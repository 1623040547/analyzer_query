import 'package:analyzer/dart/ast/ast.dart';

extension CommentExtension on Comment {
  String get commentString => tokens.map((e) => e.toString()).join('\n');
}

extension AnnotationExtension on NodeList<Annotation> {
  String? get metaString => isEmpty ? null : join('\n');
}