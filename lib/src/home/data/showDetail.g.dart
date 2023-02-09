// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'showDetail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShowDetailModel _$ShowDetailModelFromJson(Map<String, dynamic> json) =>
    ShowDetailModel(
      id: json['id'] as int,
      title: json['title'] as String,
      overview: json['overview'] as String,
      coverUrl: json['cover_url'] as String,
    );

Map<String, dynamic> _$ShowDetailModelToJson(ShowDetailModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'overview': instance.overview,
      'cover_url': instance.coverUrl,
    };
