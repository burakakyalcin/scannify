// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Book _$BookFromJson(Map json) {
  return Book(
    title: json['title'] as String,
    subtitle: json['subtitle'] as String,
    pagination: json['pagination'] as String,
    cover: json['cover'] == null
        ? null
        : BookCover.fromJson((json['cover'] as Map)?.map(
            (k, e) => MapEntry(k as String, e),
          )),
    authors: (json['authors'] as List)
        ?.map((e) => e == null
            ? null
            : BookAuthor.fromJson((e as Map)?.map(
                (k, e) => MapEntry(k as String, e),
              )))
        ?.toList(),
    publishDate: json['publish_date'] as String,
    numberOfPages: json['number_of_pages'] as int,
    key: json['key'] as String,
  );
}

Map<String, dynamic> _$BookToJson(Book instance) => <String, dynamic>{
      'title': instance.title,
      'subtitle': instance.subtitle,
      'pagination': instance.pagination,
      'cover': instance.cover?.toJson(),
      'authors': instance.authors?.map((e) => e?.toJson())?.toList(),
      'publish_date': instance.publishDate,
      'number_of_pages': instance.numberOfPages,
      'key': instance.key,
    };
