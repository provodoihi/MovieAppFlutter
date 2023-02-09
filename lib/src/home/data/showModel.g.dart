// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'showModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShowModel _$ShowModelFromJson(Map<String, dynamic> json) => ShowModel(
      data: (json['data'] as List<dynamic>)
          .map((e) => MovieModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: json['total'] as int,
    );

Map<String, dynamic> _$ShowModelToJson(ShowModel instance) => <String, dynamic>{
      'data': instance.data.map((e) => e.toJson()).toList(),
      'total': instance.total,
    };
