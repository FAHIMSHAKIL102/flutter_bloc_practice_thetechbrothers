import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_practice_thetechbrothers/feature/counter/bloc/counter_bloc.dart';
import 'package:flutter_bloc_practice_thetechbrothers/feature/home/page/home_screen.dart';
import 'package:flutter_bloc_practice_thetechbrothers/feature/imagepicker/bloc/image_picker_bloc.dart';
import 'package:flutter_bloc_practice_thetechbrothers/feature/switch/bloc/switch_bloc.dart';
import 'package:flutter_bloc_practice_thetechbrothers/feature/todo/presentation/bloc/to_do_bloc.dart';
import 'package:flutter_bloc_practice_thetechbrothers/utils/image_picker_utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CounterBloc()),
        BlocProvider(create: (context) => SwitchBloc()),
        BlocProvider(create: (context) => ImagePickerBloc(ImagePickerUtils())),
        BlocProvider(create: (context) => ToDoBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
        home: const HomeScreen(),
      ),
    );
  }
}
