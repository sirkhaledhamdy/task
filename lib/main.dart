import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:task/constants/bloc_observer.dart';
import 'package:task/constants/constants.dart';
import 'package:task/view/screens/choose_verification.dart';
import 'package:task/view/screens/code_screen.dart';
import 'package:task/view/screens/home_screen.dart';
import 'package:task/view/screens/login_screen.dart';
import 'package:task/view/screens/register_screen.dart';
import 'package:task/view/screens/verify_email.dart';
import 'package:task/view/screens/verify_phone.dart';

import 'constants/shared/local/cache_helper.dart';
import 'constants/shared/remote/dio_helper.dart';

void main() {
  BlocOverrides.runZoned(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await DioHelper.init();
      await CacheHelper.init();
      // starting widget
      Widget widget;
      accessToken = CacheHelper.getData(
        key: 'accessToken',
      )?? null;

      print(accessToken);

      // First Page check.
      if (accessToken != null) {
        widget = HomeScreen();
      } else {
        widget = LoginScreen();
      }
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
          .then((_) {
        runApp(MyApp(
          startWidget: widget,
        ));
      });
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
    final Widget startWidget;

  const MyApp({super.key, required this.startWidget});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      title: 'task',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: startWidget,
    );
  }
}

