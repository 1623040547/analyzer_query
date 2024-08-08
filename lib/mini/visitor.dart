import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/ast/visitor.dart';

///[SimpleAstVisitor]&[AstNodeImpl]
class MinVisitor extends SimpleAstVisitor {
  final Function(ClassDeclaration) handleClassDeclaration;

  MinVisitor(this.handleClassDeclaration);

  @override
  visitClassDeclaration(ClassDeclaration node) {
    handleClassDeclaration.call(node);
    return super.visitClassDeclaration(node);
  }
}
