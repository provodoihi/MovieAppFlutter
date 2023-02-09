import 'package:json_annotation/json_annotation.dart';

part 'showDetail.g.dart';

@JsonSerializable()
class ShowDetailModel {
  int id;
  String title;
  String overview;
  @JsonKey(name: 'cover_url')
  String coverUrl;

  ShowDetailModel({
    required this.id,
    required this.title,
    required this.overview,
    required this.coverUrl,
  });

  factory ShowDetailModel.fromJson(Map<String, dynamic> json) =>
      _$ShowDetailModelFromJson(json);

  Map<String, dynamic> toJson() => _$ShowDetailModelToJson(this);
}