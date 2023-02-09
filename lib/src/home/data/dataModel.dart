import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app/src/home/data/movieModel.dart';

part 'dataModel.g.dart';

@JsonSerializable(explicitToJson: true)
class DataModel {
  List<MovieModel> data;
  int total;

  DataModel({
    required this.data,
    required this.total,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) =>
      _$DataModelFromJson(json);
  Map<String, dynamic> toJson() => _$DataModelToJson(this);
}