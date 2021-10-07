import 'package:flutter/material.dart';
import 'package:ecommerce/features/firebase/authentication/login/components/social_login_button.dart';

import '../../../../core/constants/color/color_theme.dart';
import '../../../../core/constants/text/text_constant.dart';
import '../../../../core/extensions/context_extension.dart';
import 'components/input_field.dart';
import 'components/password_field.dart';
import 'components/sign_in_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appconstants = AppColor();
    return Scaffold(
      body: body(context, appconstants),
    );
  }

  SafeArea body(BuildContext context, AppColor appconstants) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: context.height * 0.08,
            alignment: Alignment.center,
            child: const Text(
              TextConstants.title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 50.0,
              ),
            ),
          ),
          textbuildmethod(appconstants),
          buttonsmethod(context, appconstants),
          TextButton(
            onPressed: () {},
            child: Text(
              TextConstants.register,
              style: TextStyle(
                color: appconstants.textColor,
                fontSize: 15,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Column buttonsmethod(BuildContext context, AppColor appconstants) {
    return Column(
      children: [
        SignInButton(
          width: context.width * 0.8,
          color: appconstants.primaryorange,
          textColor: appconstants.backgroundColor,
          text: (TextConstants.login),
          onPressed: () {},
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SocialSignInButton(
              width: context.width * 0.175,
              color: appconstants.gray,
              assetName: 'assets/images/google-logo.png',
              onPressed: () {},
            ),
            const SizedBox(
              width: 20,
            ),
            SocialSignInButton(
              width: context.width * 0.175,
              color: appconstants.gray,
              assetName: 'assets/images/facebook-logo.png',
              onPressed: () {},
            ),
          ],
        ),
      ],
    );
  }

  Column textbuildmethod(AppColor appconstants) {
    return Column(
      children: [
        InputField(
          appconstants: appconstants,
          hintText: "Email",
        ),
        const SizedBox(
          height: 25,
        ),
        PasswordField(
          appconstants: appconstants,
        ),
        Container(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () {},
            child: Text(
              TextConstants.forgot,
              style: TextStyle(
                color: appconstants.textColor,
                fontSize: 15,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
