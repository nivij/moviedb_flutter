// import 'package:codenoramovie/src/bloc/moviebloc/movie_bloc.dart';
// import 'package:codenoramovie/src/bloc/moviebloc/movie_bloc_event.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// class Home extends StatelessWidget {
//   const Home({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MultiBlocProvider(
//         providers:[
//           BlocProvider(create: (_) => MovieBloc()..add(MovieEventStarted(0, '')))
//         ] ,
//
//         child: Scaffold(
//           appBar: AppBar(
//             backgroundColor: Colors.black,
//           ),
//           body: _buildBody(context),
//         ));
//   }
//
//   Widget _buildBody(BuildContext context){
//     return LayoutBuilder(builder: (BuildContext context,BoxConstraints constraints) {
//       return SingleChildScrollView(
//        child: ConstrainedBox(
//          constraints: BoxConstraints(minHeight: constraints.maxHeight),
//          child: Column(
//            crossAxisAlignment: CrossAxisAlignment.start,
//            children: <Widget>[
//
//            ],
//          ),
//        ),
//       );
//     },);
//   }
// }
