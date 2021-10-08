import 'package:ecommerce/features/firebase/authentication/service/service.dart';
import 'package:ecommerce/product/widget/auth_form.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/product/widget/social_login_button.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/color/color_theme.dart';
import '../../../../core/constants/text/text_constant.dart';
import '../../../../core/extensions/context_extension.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key key}) : super(key: key);

  Future<void> _signInWithGoogle(BuildContext context) async {
    try {
      final auth = Provider.of<AuthBase>(context, listen: false);

      await auth.signInWithGoogle();
    } catch (e) {
      // print(e.toString());
    }
  }

  Future<void> _signInWithFacebook(BuildContext context) async {
    try {
      final auth = Provider.of<AuthBase>(context, listen: false);

      await auth.signInWithFacebook();
    } catch (e) {
      //print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    final appconstants = AppColor();
    return Scaffold(
      body: body(context, appconstants),
    );
  }

  SafeArea body(BuildContext context, AppColor appconstants) {
    return SafeArea(
      child: Padding(
        padding: context.paddingNormal * 0.6,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(
                height: 40,
              ),
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
              const SizedBox(
                height: 40,
              ),
              EmailSignInForm(),
              buttonsmethod(context, appconstants),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Column buttonsmethod(BuildContext context, AppColor appconstants) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SocialSignInButton(
              width: context.width * 0.175,
              color: AppColor.primaryorange,
              assetName: 'assets/images/google-logo.png',
              onPressed: () => _signInWithGoogle(context),
            ),
            const SizedBox(
              width: 20,
            ),
            SocialSignInButton(
              width: context.width * 0.175,
              color: AppColor.primaryorange,
              assetName: 'assets/images/facebook-logo.png',
              onPressed: () => _signInWithFacebook(context),
            ),
          ],
        ),
      ],
    );
  }
}
