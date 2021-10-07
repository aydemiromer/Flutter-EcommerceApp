import 'package:flutter/material.dart';
import 'package:ecommerce/core/extensions/context_extension.dart';

class TextFieldContainer extends StatelessWidget {
  final Widget child;
  const TextFieldContainer({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height * 0.06,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: context.width * 1.3,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: child,
    );
  }
}
