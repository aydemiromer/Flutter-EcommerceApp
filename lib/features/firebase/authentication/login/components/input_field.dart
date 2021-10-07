import 'package:flutter/material.dart';
import 'package:ecommerce/core/constants/color/color_theme.dart';
import 'package:ecommerce/features/firebase/authentication/login/components/text_field_container.dart';

class InputField extends StatelessWidget {
  final String hintText;
  const InputField({
    Key key,
    //@required this.appconstants,
    @required this.hintText,
  }) : super(key: key);

 

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        decoration: InputDecoration(
          hintText: hintText,
          
        ),
      ),
    );
  }
}