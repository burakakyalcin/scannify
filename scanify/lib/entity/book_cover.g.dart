// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_cover.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookCover _$BookCoverFromJson(Map<String, dynamic> json) {
  return BookCover(
    small: json['small'] as String,
    medium: json['medium'] as String,
    large: json['large'] as String,
  );
}

Map<String, dynamic> _$BookCoverToJson(BookCover instance) => <String, dynamic>{
      'small': instance.small,
      'medium': instance.medium,
      'large': instance.large,
    };
