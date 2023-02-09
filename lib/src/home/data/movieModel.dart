import 'package:json_annotation/json_annotation.dart';

part 'movieModel.g.dart';

@JsonSerializable()
class MovieModel {
  int id;
  String title;
  String overview;
  @JsonKey(name: 'cover_url')
  String coverUrl;

  MovieModel({
    required this.id,
    required this.title,
    required this.overview,
    required this.coverUrl,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) =>
      _$MovieModelFromJson(json);

  Map<String, dynamic> toJson() => _$MovieModelToJson(this);
}
