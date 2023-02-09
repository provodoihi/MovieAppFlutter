import 'dart:convert';

import 'package:dio/dio.dart';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/src/home/data/dataModel.dart';

import '../data/showModel.dart';

part 'movie_event.dart';

part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  MovieBloc() : super(MovieInitial()) {
    on<MovieLoad>((event, emit) async {
      try {
        emit(MovieLoading());
        final response1 = await Dio().get(
            'https://mcuapi.herokuapp.com/api/v1/movies?page=1&limit=10&columns=id%2Ctitle%2Coverview%2Ccover_url&order=chronology%2CASC');
        final response2 = await Dio().get(
            'https://mcuapi.herokuapp.com/api/v1/tvshows?page=1&limit=5&columns=id%2Ctitle%2Coverview%2Ccover_url&order=release_date%2CASC');
        emit(
          MovieLoadSuccess(
            movie: DataModel.fromJson(response1.data),
            show: ShowModel.fromJson(response2.data),
          ),
        );
      } catch (e) {
        print(e);
        emit(MovieLoadFailed());
      }
    });
  }
}
