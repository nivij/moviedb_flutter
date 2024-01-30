import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../bloc/moviebloc/movie_bloc.dart';
import '../../bloc/moviebloc/movie_bloc_event.dart';

class NoInternetWidget extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'No Internet Connection',
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              BlocProvider.of<MovieBloc>(context).add(MovieEventStarted(0, ""));
            },
            child: Text('Refresh'),
          ),
        ],
      ),
    );
  }
}