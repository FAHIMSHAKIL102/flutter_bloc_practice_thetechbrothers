import 'package:flutter/material.dart';
import 'package:flutter_bloc_practice_thetechbrothers/core/router/routes_name.dart';
import 'package:flutter_bloc_practice_thetechbrothers/feature/counter/presentation/page/counter_screen.dart';
import 'package:flutter_bloc_practice_thetechbrothers/feature/error/presentation/pages/error_screen.dart';
import 'package:flutter_bloc_practice_thetechbrothers/feature/favourite/presentation/pages/favourite_screen.dart';
import 'package:flutter_bloc_practice_thetechbrothers/feature/home/page/home_screen.dart';
import 'package:flutter_bloc_practice_thetechbrothers/feature/imagepicker/pages/image_picker_screen.dart';
import 'package:flutter_bloc_practice_thetechbrothers/feature/login/presentation/pages/login_screen.dart';
import 'package:flutter_bloc_practice_thetechbrothers/feature/post/presentation/pages/post_screen.dart';
import 'package:flutter_bloc_practice_thetechbrothers/feature/switch/pages/switch_screen.dart';
import 'package:flutter_bloc_practice_thetechbrothers/feature/todo/presentation/pages/to_do_screen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings setting) {
    switch (setting.name) {
      case RoutesName.homeScreen:
        return MaterialPageRoute(builder: (context) => HomeScreen());
      case RoutesName.counterScreen:
        return MaterialPageRoute(builder: (context) => CounterScreen());
      case RoutesName.favouriteScreen:
        return MaterialPageRoute(builder: (context) => FavouriteScreen());
      case RoutesName.imagepickerScreen:
        return MaterialPageRoute(builder: (context) => ImagePickerScreen());
      case RoutesName.loginScreen:
        return MaterialPageRoute(builder: (context) => LoginScreen());
      case RoutesName.postScreen:
        return MaterialPageRoute(builder: (context) => PostScreen());
      case RoutesName.switchScreen:
        return MaterialPageRoute(builder: (context) => SwitchScreen());
      case RoutesName.todoScreen:
        return MaterialPageRoute(builder: (context) => ToDoScreen());

      default:
        return MaterialPageRoute(
          builder: ((context) {
            return ErrorScreen();
          }),
        );
    }
  }
}
