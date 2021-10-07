import 'package:ecommerce/core/widget/custom_elevated_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FormSubmitButton extends CustomElevatedButton {
  FormSubmitButton({
    Key key,
    @required String text,
    @required VoidCallback onPressed,
    @required double width,
  }) : super(
          key: key,
          width: width,
          child: Text(
            text,
            style: const TextStyle(color: Colors.white, fontSize: 20.0),
          ),
          height: 44.0,
          color: Colors.indigo,
          borderRadius: 4.0,
          onPressed: onPressed,
        );
}
