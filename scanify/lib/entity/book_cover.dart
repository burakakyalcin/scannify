import 'package:json_annotation/json_annotation.dart';
part 'book_cover.g.dart';

@JsonSerializable()
class BookCover {
  final String small;
  final String medium;
  final String large;

  BookCover({this.small = '', this.medium = '', this.large = ''});

  factory BookCover.fromJson(Map<String, dynamic> json) =>
      json != null ? _$BookCoverFromJson(json) : BookCover();

  Map<String, dynamic> toJson() => _$BookCoverToJson(this);

  @override
  String toString() => toJson().toString();
}