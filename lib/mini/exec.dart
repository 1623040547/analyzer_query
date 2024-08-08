import 'dart:io';

import 'package:analyzer/dart/analysis/features.dart';
import 'package:analyzer/dart/analysis/utilities.dart';
import 'package:analyzer/dart/ast/ast.dart';

import 'package:analyzer_query/mini/log.dart';
import 'package:analyzer_query/mini/visitor.dart';
import 'package:analyzer_query/proj_path/dart_file.dart';
import 'package:dart_style/dart_style.dart';
import 'package:pub_semver/pub_semver.dart';

void execMinVisitor() {
  rootDart
    ..acceptPack = (pack) {
      return pack.name == "analyzer";
    }
    ..acceptDartFile = (file) {
      return file.fileName == "visitor";
    }
    ..acceptDartString = (fileString) {
      return fileString.contains("SimpleAstVisitor");
    };
  rootDart.flush();
  assert(rootDart.files.length == 1);
  List<String> nodes = [];
  final file = rootDart.files.first;

  final result = parseFile(
    path: file.filePath,
    featureSet: FeatureSet.fromEnableFlags2(
      sdkLanguageVersion: Version(3, 1, 5),
      flags: [],
    ),
  );

  result.unit.visitChildren(MinVisitor((declaration) {
    if (declaration.name.toString() == "SimpleAstVisitor") {
      for (var member in declaration.members) {
        if (member is MethodDeclaration) {
          final node = member.parameters?.parameters.first;
          if (node is SimpleFormalParameter && node.type != null) {
            nodes.add(node.type.toString());
          }
        }
      }
      analyzerLog(nodes.join('\n'));
    }
  }));

  rootDart.acceptPack = (pack) {
    return pack.name == "analyzer_query";
  };
  rootDart.flush();
  assert(rootDart.packages.length == 1);
  final pack = rootDart.packages.first;
  final String fileString = DartFormatter().format(_template(nodes));
  File("${pack.path}/full_visitor.dart").writeAsStringSync(fileString);
}

String _template(List<String> nodeName) => '''
import 'package:analyzer/dart/ast/visitor.dart';
import 'package:analyzer/src/dart/ast/ast.dart';

class FullVisitor extends SimpleAstVisitor {
  final Function(AstNodeImpl) visit;

  FullVisitor(this.visit);

  void _forward(node) {
    visit.call(node);
    node.visitChildren(this);
  }
  
  ${nodeName.map((e) => """
      @override
      visit$e($e node) => _forward(node); 
    """).toList().join('\n')}
}    
''';
