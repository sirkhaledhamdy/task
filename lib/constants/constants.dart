import 'dart:math';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

int? accessToken;
String userName = '';
bool isVerified = false;

const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
Random _rnd = Random();
String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
    length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));


void showToast({
  required String text,
  required ToastStates state,
}) => Fluttertoast.showToast(
  msg: text,
  toastLength: Toast.LENGTH_LONG,
  gravity: ToastGravity.BOTTOM,
  timeInSecForIosWeb: 5,
  backgroundColor: choseToastColor(state),
  textColor: Colors.white,
  fontSize: 16.0,
);

// enum
enum ToastStates {success , error, warning}

Color? choseToastColor(ToastStates state)
{
  Color color;
  switch(state)
  {
    case ToastStates.success:
      color = Colors.green.withOpacity(.8);
      break;
    case ToastStates.error:
      color =  Colors.red.withOpacity(.8);
      break;
    case ToastStates.warning:
      color =  Colors.orangeAccent.withOpacity(.8);
      break;
  }
  return color;
}

String getOS(){
  return Platform.operatingSystem;
}
