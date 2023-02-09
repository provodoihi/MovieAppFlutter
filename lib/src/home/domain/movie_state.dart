part of 'movie_bloc.dart';

@immutable
abstract class MovieState {}

class MovieInitial extends MovieState {}

class MovieLoading extends MovieState {}

class MovieLoadSuccess extends MovieState {
  final DataModel movie;
  final ShowModel show;

  MovieLoadSuccess({required this.movie, required this.show});
}

class MovieLoadFailed extends MovieState {}
