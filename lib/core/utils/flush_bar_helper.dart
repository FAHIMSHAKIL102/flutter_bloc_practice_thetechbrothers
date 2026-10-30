import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';

class FlushBarHelper {
  static void flushBarErrorMessage(String message, BuildContext context) {
    showFlushbar(context: context, flushbar: Flushbar(
      forwardAnimationCurve: Curves.bounceIn,
      margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      padding: EdgeInsets.all(15),
      icon: Icon(Icons.error),
      message: message,
      duration: Duration(seconds: 2),
      borderRadius: BorderRadius.circular(12),
      flushbarPosition: FlushbarPosition.TOP,
      backgroundColor: Colors.red,
      reverseAnimationCurve: Curves.bounceInOut,
      positionOffset: 20,
    )..show(context));
  }

  static void flushBarSuccessMessage(String message, BuildContext context) {
    showFlushbar(
      context: context,
      flushbar: Flushbar(
        forwardAnimationCurve: Curves.bounceIn,
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        padding: EdgeInsets.all(15),
        icon: Icon(Icons.done),
        message: message,
        duration: Duration(seconds: 2),
        borderRadius: BorderRadius.circular(12),
        flushbarPosition: FlushbarPosition.TOP,
        backgroundColor: Colors.green,
        reverseAnimationCurve: Curves.bounceInOut,
        positionOffset: 20,
      )..show(context),
    );
  }


}
