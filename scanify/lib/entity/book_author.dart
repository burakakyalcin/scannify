import 'package:json_annotation/json_annotation.dart';
part 'book_author.g.dart';

@JsonSerializable()
class BookAuthor {
  final String name;
  final String url;

  BookAuthor({this.name = '', this.url = ''});

  factory BookAuthor.fromJson(Map<String, dynamic> json) =>
      json != null ? _$BookAuthorFromJson(json) : BookAuthor();

  Map<String, dynamic> toJson() => _$BookAuthorToJson(this);

  @override
  String toString() => toJson().toString();
}