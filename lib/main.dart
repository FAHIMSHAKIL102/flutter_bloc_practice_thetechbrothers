import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_practice_thetechbrothers/core/router/routes.dart';
import 'package:flutter_bloc_practice_thetechbrothers/core/router/routes_name.dart';
import 'package:flutter_bloc_practice_thetechbrothers/feature/favourite/domain/repository/favourite_repository.dart';
import 'package:flutter_bloc_practice_thetechbrothers/feature/favourite/presentation/bloc/favourite_bloc.dart';
import 'package:flutter_bloc_practice_thetechbrothers/feature/imagepicker/bloc/image_picker_bloc.dart';
import 'package:flutter_bloc_practice_thetechbrothers/feature/post/presentation/bloc/post_bloc.dart';
import 'package:flutter_bloc_practice_thetechbrothers/feature/switch/bloc/switch_bloc.dart';
import 'package:flutter_bloc_practice_thetechbrothers/feature/todo/presentation/bloc/to_do_bloc.dart';
import 'package:flutter_bloc_practice_thetechbrothers/core/utils/image_picker_utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        //BlocProvider(create: (context) => CounterBloc()),
        BlocProvider(create: (context) => SwitchBloc()),
        BlocProvider(create: (context) => ImagePickerBloc(ImagePickerUtils())),
        BlocProvider(create: (context) => ToDoBloc()),
        BlocProvider(create: (context) => FavouriteBloc(FavouriteRepository())),
        BlocProvider(create: (context) => PostBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
       initialRoute: RoutesName.homeScreen,
       onGenerateRoute: Routes.generateRoute,
      ),
    );
  }
}
