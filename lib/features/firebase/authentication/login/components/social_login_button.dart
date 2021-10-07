import 'package:ecommerce/core/widget/custom_elevated_button.dart';
import 'package:flutter/cupertino.dart';

class SocialSignInButton extends CustomElevatedButton {
  SocialSignInButton({
    Key key,
    @required double width,
    @required String assetName,
    @required Color color,
    @required VoidCallback onPressed,
  }) : super(
          width: width,
          key: key,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(assetName),

              /*Opacity(
                opacity: 0.0,
                child: Image.asset(assetName),
              )*/
            ],
          ),
          color: color,
          borderRadius: 60.0,
          onPressed: onPressed,
        );
}
