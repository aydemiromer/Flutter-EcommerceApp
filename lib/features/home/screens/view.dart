import 'package:ecommerce/features/firebase/authentication/service/service.dart';
import 'package:ecommerce/product/widget/show_alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class View extends StatelessWidget {
  const View({Key key}) : super(key: key);
  Future<void> _signOut(BuildContext context) async {
    try {
      final auth = Provider.of<AuthBase>(context, listen: false);
      await auth.signOut();
      //onSignout();
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
    }
  }
  Future<void> _confirmSignOut(BuildContext context) async {
    final didRequestSignOut = await showAlertDialog(
      context,
      title: 'Logout',
      content: 'Are you sure you want to logout?',
      defaultActionText: 'Logout',
      cancelActionText: 'Cancel',
    );
    if (didRequestSignOut == true) {
      _signOut(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
        actions: [
          TextButton(
              onPressed: () => _confirmSignOut(context),
              child: const Text(
                'Logout',
                style: TextStyle(fontSize: 18.0, color: Colors.white),
              )),
        ],
      ),
    );
  }
}

