import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app/src/home/data/movieModel.dart';

part 'showModel.g.dart';

@JsonSerializable(explicitToJson: true)
class ShowModel {
  List<MovieModel> data;
  int total;

  ShowModel({
    required this.data,
    required this.total,
  });

  factory ShowModel.fromJson(Map<String, dynamic> json) =>
      _$ShowModelFromJson(json);
  Map<String, dynamic> toJson() => _$ShowModelToJson(this);
}