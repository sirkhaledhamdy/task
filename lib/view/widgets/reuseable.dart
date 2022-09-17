import 'package:flutter/material.dart';
import 'package:task/constants/size_extention.dart';
import 'package:task/view/styles/colors.dart';

Widget defaultButton ({
  double width = double.infinity,
  double minWidth = double.infinity,
  Color color = kButtonColor,
  Color textColor = Colors.white,
  Color sideColor = Colors.white,
  double elevation =  5.0,
  required void Function()? onPressed,
  required String text,
}) => Material(
  shape: RoundedRectangleBorder(
    side: BorderSide(
      color: sideColor,
    ),
    borderRadius:BorderRadius.circular(10.0),),
  clipBehavior: Clip.antiAlias,
  elevation: elevation,
  color: color,
  child:MaterialButton(
    minWidth: minWidth,
    onPressed: onPressed,
    child: Text(
      text.toUpperCase(),
      style: TextStyle(
        color: textColor,
      ),
    ),
  ),
);



Widget defaultFormField ({
  String? initialValue,
  required TextEditingController controller,
  required TextInputType type,
  void Function(String)? onSubmit,
  void Function(String)? onChange,
  required Function validate,
  IconData? prefix,
  dynamic suffix,
  bool isPass = false,
  void Function()? suffixPressed,
  String? errorText,
  String? hint,
  TextStyle? hintStyle,
}) => TextFormField(
  maxLines: 1,
  controller: controller,
  keyboardType: type,
  textAlign: TextAlign.right,
  decoration: InputDecoration(
    contentPadding: EdgeInsets.symmetric(horizontal: 20),
    errorText: errorText,
    suffixIcon: suffix,
    hintText: hint,
    hintStyle: hintStyle,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30.rSp),
      borderSide: BorderSide.none,
    ),
  ),
  onFieldSubmitted: onSubmit,
  validator: (value){
    if(value!.isEmpty) {
      return 'User Must Input Data';
    }
    return null;
  },
  obscureText: isPass,

);



void navigateTo(context, widget)
{
  Navigator.push(context, MaterialPageRoute(builder:
      (context) => widget,
  ),);
}



void navigateAndFinish(context, widget)
{
  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
    builder: (context) => widget,
  ),
        (Route<dynamic> route) => false,
  );
}