import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/ast/visitor.dart';

class FullVisitor extends GeneralizingAstVisitor {
  final Function(AstNode) visit;

  FullVisitor(this.visit);

  @override
  visitNode(AstNode node) {
    visit.call(node);
    return super.visitNode(node);
  }
}
