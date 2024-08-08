import 'package:analyzer/dart/ast/visitor.dart';
import 'package:analyzer/src/dart/ast/ast.dart';

class FullVisitor extends SimpleAstVisitor {
  final Function(AstNodeImpl) visit;

  FullVisitor(this.visit);

  void _forward(node) {
    visit.call(node);
    node.visitChildren(this);
  }

  @override
  visitAdjacentStrings(AdjacentStrings node) => _forward(node);

  @override
  visitAnnotation(Annotation node) => _forward(node);

  @override
  visitArgumentList(ArgumentList node) => _forward(node);

  @override
  visitAsExpression(AsExpression node) => _forward(node);

  @override
  visitAssertInitializer(AssertInitializer node) => _forward(node);

  @override
  visitAssertStatement(AssertStatement node) => _forward(node);

  @override
  visitAssignedVariablePattern(AssignedVariablePattern node) => _forward(node);

  @override
  visitAssignmentExpression(AssignmentExpression node) => _forward(node);

  @override
  visitAugmentationImportDirective(AugmentationImportDirective node) =>
      _forward(node);

  @override
  visitAwaitExpression(AwaitExpression node) => _forward(node);

  @override
  visitBinaryExpression(BinaryExpression node) => _forward(node);

  @override
  visitBlock(Block node) => _forward(node);

  @override
  visitBlockFunctionBody(BlockFunctionBody node) => _forward(node);

  @override
  visitBooleanLiteral(BooleanLiteral node) => _forward(node);

  @override
  visitBreakStatement(BreakStatement node) => _forward(node);

  @override
  visitCascadeExpression(CascadeExpression node) => _forward(node);

  @override
  visitCaseClause(CaseClause node) => _forward(node);

  @override
  visitCastPattern(CastPattern node) => _forward(node);

  @override
  visitCatchClause(CatchClause node) => _forward(node);

  @override
  visitCatchClauseParameter(CatchClauseParameter node) => _forward(node);

  @override
  visitClassDeclaration(ClassDeclaration node) => _forward(node);

  @override
  visitClassTypeAlias(ClassTypeAlias node) => _forward(node);

  @override
  visitComment(Comment node) => _forward(node);

  @override
  visitCommentReference(CommentReference node) => _forward(node);

  @override
  visitCompilationUnit(CompilationUnit node) => _forward(node);

  @override
  visitConditionalExpression(ConditionalExpression node) => _forward(node);

  @override
  visitConfiguration(Configuration node) => _forward(node);

  @override
  visitConstantPattern(ConstantPattern node) => _forward(node);

  @override
  visitConstructorDeclaration(ConstructorDeclaration node) => _forward(node);

  @override
  visitConstructorFieldInitializer(ConstructorFieldInitializer node) =>
      _forward(node);

  @override
  visitConstructorName(ConstructorName node) => _forward(node);

  @override
  visitConstructorReference(ConstructorReference node) => _forward(node);

  @override
  visitConstructorSelector(ConstructorSelector node) => _forward(node);

  @override
  visitContinueStatement(ContinueStatement node) => _forward(node);

  @override
  visitDeclaredIdentifier(DeclaredIdentifier node) => _forward(node);

  @override
  visitDeclaredVariablePattern(DeclaredVariablePattern node) => _forward(node);

  @override
  visitDefaultFormalParameter(DefaultFormalParameter node) => _forward(node);

  @override
  visitDoStatement(DoStatement node) => _forward(node);

  @override
  visitDottedName(DottedName node) => _forward(node);

  @override
  visitDoubleLiteral(DoubleLiteral node) => _forward(node);

  @override
  visitEmptyFunctionBody(EmptyFunctionBody node) => _forward(node);

  @override
  visitEmptyStatement(EmptyStatement node) => _forward(node);

  @override
  visitEnumConstantArguments(EnumConstantArguments node) => _forward(node);

  @override
  visitEnumConstantDeclaration(EnumConstantDeclaration node) => _forward(node);

  @override
  visitEnumDeclaration(EnumDeclaration node) => _forward(node);

  @override
  visitExportDirective(ExportDirective node) => _forward(node);

  @override
  visitExpressionFunctionBody(ExpressionFunctionBody node) => _forward(node);

  @override
  visitExpressionStatement(ExpressionStatement node) => _forward(node);

  @override
  visitExtendsClause(ExtendsClause node) => _forward(node);

  @override
  visitExtensionDeclaration(ExtensionDeclaration node) => _forward(node);

  @override
  visitExtensionOverride(ExtensionOverride node) => _forward(node);

  @override
  visitExtensionTypeDeclaration(ExtensionTypeDeclaration node) =>
      _forward(node);

  @override
  visitFieldDeclaration(FieldDeclaration node) => _forward(node);

  @override
  visitFieldFormalParameter(FieldFormalParameter node) => _forward(node);

  @override
  visitForEachPartsWithDeclaration(ForEachPartsWithDeclaration node) =>
      _forward(node);

  @override
  visitForEachPartsWithIdentifier(ForEachPartsWithIdentifier node) =>
      _forward(node);

  @override
  visitForEachPartsWithPattern(ForEachPartsWithPattern node) => _forward(node);

  @override
  visitForElement(ForElement node) => _forward(node);

  @override
  visitFormalParameterList(FormalParameterList node) => _forward(node);

  @override
  visitForPartsWithDeclarations(ForPartsWithDeclarations node) =>
      _forward(node);

  @override
  visitForPartsWithExpression(ForPartsWithExpression node) => _forward(node);

  @override
  visitForPartsWithPattern(ForPartsWithPattern node) => _forward(node);

  @override
  visitForStatement(ForStatement node) => _forward(node);

  @override
  visitFunctionDeclaration(FunctionDeclaration node) => _forward(node);

  @override
  visitFunctionDeclarationStatement(FunctionDeclarationStatement node) =>
      _forward(node);

  @override
  visitFunctionExpression(FunctionExpression node) => _forward(node);

  @override
  visitFunctionExpressionInvocation(FunctionExpressionInvocation node) =>
      _forward(node);

  @override
  visitFunctionReference(FunctionReference node) => _forward(node);

  @override
  visitFunctionTypeAlias(FunctionTypeAlias node) => _forward(node);

  @override
  visitFunctionTypedFormalParameter(FunctionTypedFormalParameter node) =>
      _forward(node);

  @override
  visitGenericFunctionType(GenericFunctionType node) => _forward(node);

  @override
  visitGenericTypeAlias(GenericTypeAlias node) => _forward(node);

  @override
  visitGuardedPattern(GuardedPattern node) => _forward(node);

  @override
  visitHideCombinator(HideCombinator node) => _forward(node);

  @override
  visitIfElement(IfElement node) => _forward(node);

  @override
  visitIfStatement(IfStatement node) => _forward(node);

  @override
  visitImplementsClause(ImplementsClause node) => _forward(node);

  @override
  visitImplicitCallReference(ImplicitCallReference node) => _forward(node);

  @override
  visitImportDirective(ImportDirective node) => _forward(node);

  @override
  visitImportPrefixReference(ImportPrefixReference node) => _forward(node);

  @override
  visitIndexExpression(IndexExpression node) => _forward(node);

  @override
  visitInstanceCreationExpression(InstanceCreationExpression node) =>
      _forward(node);

  @override
  visitIntegerLiteral(IntegerLiteral node) => _forward(node);

  @override
  visitInterpolationExpression(InterpolationExpression node) => _forward(node);

  @override
  visitInterpolationString(InterpolationString node) => _forward(node);

  @override
  visitIsExpression(IsExpression node) => _forward(node);

  @override
  visitLabel(Label node) => _forward(node);

  @override
  visitLabeledStatement(LabeledStatement node) => _forward(node);

  @override
  visitLibraryAugmentationDirective(LibraryAugmentationDirective node) =>
      _forward(node);

  @override
  visitLibraryDirective(LibraryDirective node) => _forward(node);

  @override
  visitLibraryIdentifier(LibraryIdentifier node) => _forward(node);

  @override
  visitListLiteral(ListLiteral node) => _forward(node);

  @override
  visitListPattern(ListPattern node) => _forward(node);

  @override
  visitLogicalAndPattern(LogicalAndPattern node) => _forward(node);

  @override
  visitLogicalOrPattern(LogicalOrPattern node) => _forward(node);

  @override
  visitMapLiteralEntry(MapLiteralEntry node) => _forward(node);

  @override
  visitMapPattern(MapPattern node) => _forward(node);

  @override
  visitMapPatternEntry(MapPatternEntry node) => _forward(node);

  @override
  visitMethodDeclaration(MethodDeclaration node) => _forward(node);

  @override
  visitMethodInvocation(MethodInvocation node) => _forward(node);

  @override
  visitMixinDeclaration(MixinDeclaration node) => _forward(node);

  @override
  visitNamedExpression(NamedExpression node) => _forward(node);

  @override
  visitNamedType(NamedType node) => _forward(node);

  @override
  visitNativeClause(NativeClause node) => _forward(node);

  @override
  visitNativeFunctionBody(NativeFunctionBody node) => _forward(node);

  @override
  visitNullAssertPattern(NullAssertPattern node) => _forward(node);

  @override
  visitNullCheckPattern(NullCheckPattern node) => _forward(node);

  @override
  visitNullLiteral(NullLiteral node) => _forward(node);

  @override
  visitObjectPattern(ObjectPattern node) => _forward(node);

  @override
  visitOnClause(OnClause node) => _forward(node);

  @override
  visitParenthesizedExpression(ParenthesizedExpression node) => _forward(node);

  @override
  visitParenthesizedPattern(ParenthesizedPattern node) => _forward(node);

  @override
  visitPartDirective(PartDirective node) => _forward(node);

  @override
  visitPartOfDirective(PartOfDirective node) => _forward(node);

  @override
  visitPatternAssignment(PatternAssignment node) => _forward(node);

  @override
  visitPatternField(PatternField node) => _forward(node);

  @override
  visitPatternFieldName(PatternFieldName node) => _forward(node);

  @override
  visitPatternVariableDeclaration(PatternVariableDeclaration node) =>
      _forward(node);

  @override
  visitPatternVariableDeclarationStatement(
          PatternVariableDeclarationStatement node) =>
      _forward(node);

  @override
  visitPostfixExpression(PostfixExpression node) => _forward(node);

  @override
  visitPrefixedIdentifier(PrefixedIdentifier node) => _forward(node);

  @override
  visitPrefixExpression(PrefixExpression node) => _forward(node);

  @override
  visitPropertyAccess(PropertyAccess node) => _forward(node);

  @override
  visitRecordLiteral(RecordLiteral node) => _forward(node);

  @override
  visitRecordPattern(RecordPattern node) => _forward(node);

  @override
  visitRecordTypeAnnotation(RecordTypeAnnotation node) => _forward(node);

  @override
  visitRecordTypeAnnotationNamedField(RecordTypeAnnotationNamedField node) =>
      _forward(node);

  @override
  visitRecordTypeAnnotationNamedFields(RecordTypeAnnotationNamedFields node) =>
      _forward(node);

  @override
  visitRecordTypeAnnotationPositionalField(
          RecordTypeAnnotationPositionalField node) =>
      _forward(node);

  @override
  visitRedirectingConstructorInvocation(
          RedirectingConstructorInvocation node) =>
      _forward(node);

  @override
  visitRelationalPattern(RelationalPattern node) => _forward(node);

  @override
  visitRepresentationConstructorName(RepresentationConstructorName node) =>
      _forward(node);

  @override
  visitRepresentationDeclaration(RepresentationDeclaration node) =>
      _forward(node);

  @override
  visitRestPatternElement(RestPatternElement node) => _forward(node);

  @override
  visitRethrowExpression(RethrowExpression node) => _forward(node);

  @override
  visitReturnStatement(ReturnStatement node) => _forward(node);

  @override
  visitScriptTag(ScriptTag node) => _forward(node);

  @override
  visitSetOrMapLiteral(SetOrMapLiteral node) => _forward(node);

  @override
  visitShowCombinator(ShowCombinator node) => _forward(node);

  @override
  visitSimpleFormalParameter(SimpleFormalParameter node) => _forward(node);

  @override
  visitSimpleIdentifier(SimpleIdentifier node) => _forward(node);

  @override
  visitSimpleStringLiteral(SimpleStringLiteral node) => _forward(node);

  @override
  visitSpreadElement(SpreadElement node) => _forward(node);

  @override
  visitStringInterpolation(StringInterpolation node) => _forward(node);

  @override
  visitSuperConstructorInvocation(SuperConstructorInvocation node) =>
      _forward(node);

  @override
  visitSuperExpression(SuperExpression node) => _forward(node);

  @override
  visitSuperFormalParameter(SuperFormalParameter node) => _forward(node);

  @override
  visitSwitchCase(SwitchCase node) => _forward(node);

  @override
  visitSwitchDefault(SwitchDefault node) => _forward(node);

  @override
  visitSwitchExpression(SwitchExpression node) => _forward(node);

  @override
  visitSwitchExpressionCase(SwitchExpressionCase node) => _forward(node);

  @override
  visitSwitchPatternCase(SwitchPatternCase node) => _forward(node);

  @override
  visitSwitchStatement(SwitchStatement node) => _forward(node);

  @override
  visitSymbolLiteral(SymbolLiteral node) => _forward(node);

  @override
  visitThisExpression(ThisExpression node) => _forward(node);

  @override
  visitThrowExpression(ThrowExpression node) => _forward(node);

  @override
  visitTopLevelVariableDeclaration(TopLevelVariableDeclaration node) =>
      _forward(node);

  @override
  visitTryStatement(TryStatement node) => _forward(node);

  @override
  visitTypeArgumentList(TypeArgumentList node) => _forward(node);

  @override
  visitTypeLiteral(TypeLiteral node) => _forward(node);

  @override
  visitTypeParameter(TypeParameter node) => _forward(node);

  @override
  visitTypeParameterList(TypeParameterList node) => _forward(node);

  @override
  visitVariableDeclaration(VariableDeclaration node) => _forward(node);

  @override
  visitVariableDeclarationList(VariableDeclarationList node) => _forward(node);

  @override
  visitVariableDeclarationStatement(VariableDeclarationStatement node) =>
      _forward(node);

  @override
  visitWhenClause(WhenClause node) => _forward(node);

  @override
  visitWhileStatement(WhileStatement node) => _forward(node);

  @override
  visitWildcardPattern(WildcardPattern node) => _forward(node);

  @override
  visitWithClause(WithClause node) => _forward(node);

  @override
  visitYieldStatement(YieldStatement node) => _forward(node);
}
