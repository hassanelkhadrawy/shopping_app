import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/constants/Colors/colors.dart';

void NavigateTo({required context, required widget}) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));

void NavigateToFinish({required context, required widget}) =>
    Navigator.pushAndRemoveUntil(
        context, MaterialPageRoute(builder: (context) => widget), (route) {
      return false;
    });

Widget defaultTextForm({
  @required TextEditingController? controller,
  @required TextInputType? type,
  required String lable,
  bool isPassword = false,
  prefixIcon,
  suffixIcon,
  onSubmitted,
  onChange,
  iconPressed,
  color = defaultColor,
  required validate,
}) =>
    TextFormField(
      cursorColor: color,
      controller: controller,
      keyboardType: type,
      onFieldSubmitted: onSubmitted,
      onChanged: onChange,
      validator: validate,
      obscureText: isPassword,
      decoration: InputDecoration(
        labelText: lable,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon != null
            ? IconButton(onPressed: iconPressed, icon: suffixIcon)
            : null,
        border: OutlineInputBorder(),
      ),
    );

Widget defaultButton({
  required String lable,
  required var color,
  onPressed,
  Color background = defaultColor,
  double radius = 5.0,
  bool toUpper = true,
}) =>
    Container(
      width: double.infinity,
      height: 40.0,
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(
          radius,
        ),
      ),
      child: FlatButton(
        onPressed: onPressed,
        child: Text(
          toUpper ? lable.toUpperCase() : lable,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );

void defaultSnakBar(
        {required context, required String message, required color}) =>
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        message,
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: color,
    ));

Widget MyDevider()=>Row(
    children: <Widget>[
      Expanded(
          child: Divider()
      ),
    ]
);