import 'package:ecommerce/product/widget/sign_in_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../../core/constants/color/color_theme.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key key}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String _email;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Reset Password"),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          /*const SizedBox(
            height: 50,
            child: InputField(
              hintText: 'Email ',
            ),
          ),*/
          TextField(
            keyboardType: TextInputType.emailAddress,
            controller: _emailController,
            decoration: const InputDecoration(
              hintText: ("Email"),
            ),
            onChanged: (value) {
              setState(() {
                _email = value;
              });
            },
          ),
          SignInButton(
              width: 100,
              text: "Send",
              color: AppColor.primaryorange,
              onPressed: () {
                FirebaseAuth.instance.sendPasswordResetEmail(email: _email);
              })
        ],
      ),
    );
  }
}
