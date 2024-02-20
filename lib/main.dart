import 'package:codenoramovie/src/bloc/moviebloc/movie_bloc.dart';
import 'package:codenoramovie/src/res/widgets/BottomNav.dart';
import 'package:codenoramovie/src/ui/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      debugShowCheckedModeBanner: false,

      home: MultiBlocProvider(
        providers: [
          BlocProvider<MovieBloc>(
            create: (context) => MovieBloc(),
          ),

        ],
        child: BottomNav(),
      ),
    );
  }
}
