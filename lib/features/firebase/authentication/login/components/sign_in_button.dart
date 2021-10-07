import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/core/widget/custom_elevated_button.dart';


class SignInButton extends CustomElevatedButton {
  SignInButton({
    Key? key,
    required double width,
    required String text,
    required Color color,
     Color? textColor,
    required VoidCallback onPressed,
  }) : super(
    width:width,
          key: key,
          child: Text(
            text,
            style:  TextStyle(color: textColor ,fontSize: 15),
          ),
          color: color,
          borderRadius: 20.0,
          onPressed: onPressed,
        );
}
