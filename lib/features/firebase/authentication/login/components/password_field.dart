import 'package:flutter/material.dart';
import 'package:ecommerce/core/constants/color/color_theme.dart';
import 'package:ecommerce/features/firebase/authentication/login/components/text_field_container.dart';

class PasswordField extends StatelessWidget {
  const PasswordField({
    Key key,
    @required this.appconstants,
  }) : super(key: key);
  final AppColor appconstants;

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        obscureText: true,
        decoration: const InputDecoration(
          hintText: "Password",
          suffixIcon: Icon(
            Icons.visibility,
            color: AppColor.primaryorange,
          ),
        ),
      ),
    );
  }
}
