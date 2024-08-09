import 'dart:io';

import 'package:analyzer/dart/analysis/utilities.dart';
import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer_query/full_visitor.dart';
import 'package:analyzer_query/mini/log.dart';
import 'package:analyzer_query/proj_path/dart_file.dart';

export 'package:analyzer/dart/ast/ast.dart';

class TestFile {
  final String _dartString;

  final Function(AstNode, TestToken)? _visit;

  late final List<TestToken> tokens;

  TestFile._(this._dartString, {dynamic Function(AstNode, TestToken)? visit})
      : _visit = visit {
    tokens = _testString(_dartString);
  }

  static TestFile fromString(
    String dartString, {
    Function(AstNode, TestToken)? visit,
  }) {
    return TestFile._(
      dartString,
      visit: visit,
    );
  }

  static TestFile fromFile(
    String filePath, {
    Function(AstNode, TestToken)? visit,
  }) {
    return TestFile._(
      File(filePath).readAsStringSync(),
      visit: visit,
    );
  }

  List<TestToken> _testString(String dartString) {
    Map<String, TestToken> tokens = {};
    final result = parseString(content: dartString);
    result.unit.visitChildren(
      FullVisitor(
        (node) {
          final token = TestToken(
            start: node.offset,
            end: node.end,
            name: dartString.substring(node.offset, node.end),
            type: node.runtimeType,
          );
          String? id = node.parent?.testId;
          if (tokens.containsKey(id)) {
            tokens[id]?._isLeaf = false;
          }
          tokens[token.id] = token;
          _visit?.call(node, token);
        },
      ),
    );
    return tokens.values.toList();
  }

  String showLeafNodeText() {
    String text = _dartString;
    for (var token in tokens.reversed) {
      if (!token.isLeaf) continue;
      text = text.replaceRange(token.start, token.end, token.nodeType);
    }
    analyzerLog('\n$text');
    return text;
  }

  void showLeafNodeDict() {
    for (var token in tokens) {
      if (!token.isLeaf) continue;
      analyzerLog("\n"
          "type: ${token.nodeType}\n"
          "name: ${token.name}\n");
    }
  }

  void showNodeDict() {
    for (var token in tokens) {
      analyzerLog("\n"
          "type: ${token.nodeType}\n"
          "name: ${token.name}\n");
    }
  }
}

class TestToken {
  final int start;
  final int end;
  final String name;
  final Type type;
  late final String id = '${type}_${start}_$end';

  bool _isLeaf = true;

  bool get isLeaf => _isLeaf;

  String get nodeType =>
      type.toString().substring(0, type.toString().length - 4);

  TestToken({
    required this.start,
    required this.end,
    required this.name,
    required this.type,
  });
}

extension AstNodeTestTokenId on AstNode {
  String get testId => '${runtimeType}_${offset}_$end';

  TestToken testToken(DartFile file) {
    return TestToken(
      start: offset,
      end: end,
      name: file.fileString.substring(offset, end),
      type: runtimeType,
    );
  }
}
