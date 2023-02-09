import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/src/home/domain/movie_bloc.dart';
import 'package:movie_app/src/home/presentation/detailScreen.dart';
import 'package:movie_app/src/home/presentation/listItem.dart';
import 'package:movie_app/src/home/presentation/shimmer.dart';

class HomeList extends StatelessWidget {
  const HomeList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MovieBloc()..add(MovieLoad()),
      child: const HomeListBody(),
    );
  }
}

class HomeListBody extends StatefulWidget {
  const HomeListBody({super.key});

  @override
  State<StatefulWidget> createState() => _HomeListState();
}

class _HomeListState extends State<HomeListBody> {
  void _onPressMovie(String coverUrl, String name, String description) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailScreen(
          coverUrl: coverUrl,
          name: name,
          description: description,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: BlocBuilder<MovieBloc, MovieState>(
        builder: (context, state) {
          if (state is MovieLoading) {
            return const ShimmerComponent();
          } else if (state is MovieLoadSuccess) {
            return ListView(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(12.w, 20.h, 0, 10.h),
                  child: Text(
                    'Latest Movies',
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  height: 250.h,
                  width: double.infinity,
                  child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return ListItem(
                        coverUrl: state.movie.data[index].coverUrl,
                        onTap: () => _onPressMovie(
                          state.movie.data[index].coverUrl,
                          state.movie.data[index].title,
                          state.movie.data[index].overview,
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        width: 20.w,
                        height: 240.h,
                      );
                    },
                    itemCount: state.movie.data.length,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(12.w, 20.h, 0, 10.h),
                  child: Text(
                    'Latest Series',
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  height: 250.h,
                  width: double.infinity,
                  child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return ListItem(
                        coverUrl: state.show.data[index].coverUrl,
                        onTap: () => _onPressMovie(
                          state.show.data[index].coverUrl,
                          state.show.data[index].title,
                          state.show.data[index].overview,
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        width: 20.w,
                        height: 240.h,
                      );
                    },
                    itemCount: state.show.data.length,
                  ),
                ),
              ],
            );
          } else {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
            );
          }
        },
      ),
    );
  }
}
