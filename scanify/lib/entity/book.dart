import 'package:json_annotation/json_annotation.dart';
import 'package:scanify/entity/book_author.dart';
import 'package:scanify/entity/book_cover.dart';

part 'book.g.dart';

@JsonSerializable(explicitToJson: true, anyMap: true)
class Book {
  final String title;
  final String subtitle;
  final String pagination;
  final BookCover cover;
  final List<BookAuthor> authors;
  final String publishDate;
  final int numberOfPages;
  final String key;

  Book(
      {this.title = '',
      this.subtitle = '',
      this.pagination = '',
      this.cover,
      this.authors,
      this.publishDate = '',
      this.numberOfPages = 0,
      this.key = ''});

  factory Book.fromJson(Map<String, dynamic> json) =>
      json != null ? _$BookFromJson(json) : Book();

  Map<String, dynamic> toJson() => _$BookToJson(this);

  @override
  String toString() => toJson().toString();

  String getAvailableCoverImage() {
    if (cover != null) {
      return cover.large ?? cover.medium ?? cover.small ?? '';
    } else {
      return '';
    }
  }

  String getAuthorName() {
    if (authors != null) {
      if (authors.first != null) {
        return authors.first.name;
      }
      return 'Unknown';
    }
    return 'Unknown';
  }
}
