import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task/view/styles/colors.dart';

class AdaptiveIndicator extends StatelessWidget {
  late String os;

  AdaptiveIndicator({
    required this.os,
  });

  @override
  Widget build(BuildContext context) {
    if(this.os =='android') return CircularProgressIndicator(color: kText1Color,);
    return CupertinoActivityIndicator();
  }
}