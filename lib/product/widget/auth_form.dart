import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/constants/color/color_theme.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../core/constants/enums/enums.dart';
import '../../core/constants/validator/validators.dart';
import 'sign_in_button.dart';
import '../../features/firebase/authentication/service/service.dart';
import 'show_alert_dialog.dart';

class EmailSignInForm extends StatefulWidget with EmailAndPasswordValidators {
  EmailSignInForm({Key key}) : super(key: key);

  @override
  _EmailSignInFormState createState() => _EmailSignInFormState();
}

class _EmailSignInFormState extends State<EmailSignInForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  String get _email => _emailController.text;
  String get _password => _passwordController.text;
  EmailSignInFormType _formType = EmailSignInFormType.signIn;
  bool _submitted = false;
  bool _isLoading = false;

  void _submit() async {
    setState(() {
      _submitted = true;
      _isLoading = true;
    });
    try {
      final auth = Provider.of<AuthBase>(context, listen: false);

      if (_formType == EmailSignInFormType.signIn) {
        await auth.signInWithEmailandPassword(_email, _password);
      } else {
        await auth.createUserWithEmailandPassword(_email, _password);
      }
      Navigator.of(context).pop();
    } catch (e) {
      showAlertDialog(
        context,
        title: 'Sign in Failed!',
        content: e.toString(),
        defaultActionText: 'OK.',
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _emailEditingComplete() {
    final newFocus = widget.emailValidator.isValid(_email)
        ? _passwordFocusNode
        : _emailFocusNode;
    FocusScope.of(context).requestFocus(newFocus);
  }

  void _toggleFormType() {
    setState(() {
      _submitted = false;
      _formType = _formType == EmailSignInFormType.signIn
          ? EmailSignInFormType.register
          : EmailSignInFormType.signIn;
    });
    _emailController.clear();
    _passwordController.clear();
  }

  List<Widget> _buildChildren() {
    final primaryText = _formType == EmailSignInFormType.signIn
        ? 'Sign in'
        : 'Create an account';
    final secondaryText = _formType == EmailSignInFormType.signIn
        ? 'Need an account? Register'
        : 'Have an account? Sign in';
    bool submitEnabled = widget.emailValidator.isValid(_email) &&
        widget.passwordValidator.isValid(_password);

    return [
      _buildEmailTextField(),
      const SizedBox(height: 8.0),
      _buildPasswordTextField(),
      const SizedBox(height: 8.0),
      SignInButton(
        width: context.width * 0.8,
        color: AppColor.primaryorange,
        textColor: AppColor.backgroundColor,
        text: primaryText,
        onPressed: submitEnabled ? _submit : null,
      ),
      
      const SizedBox(height: 8.0),
      TextButton(
          onPressed: !_isLoading ? _toggleFormType : null,
          child: Text(secondaryText)),
    ];
  }

  TextField _buildPasswordTextField() {
    bool showErrorText = _submitted &&
        !widget.passwordValidator.isValid(_password) &&
        !_isLoading;

    return TextField(
      controller: _passwordController,
      focusNode: _passwordFocusNode,
      decoration: InputDecoration(
          enabled: _isLoading == false,
          labelText: 'Password',
          errorText: showErrorText ? widget.invalidPasswordErrorText : null),
      obscureText: true,
      textInputAction: TextInputAction.done,
      onChanged: (password) => _updateState(),
      onEditingComplete: _submit,
    );
  }

  TextField _buildEmailTextField() {
    bool showErrorText = _submitted && !widget.emailValidator.isValid(_email);
    return TextField(
      controller: _emailController,
      focusNode: _emailFocusNode,
      decoration: InputDecoration(
        enabled: _isLoading == false,
        labelText: 'Email',
        hintText: 'test@example.com',
        errorText: showErrorText ? widget.invalidEmailErrorText : null,
      ),
      autocorrect: false,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      onChanged: (email) => _updateState(),
      onEditingComplete: _emailEditingComplete,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: _buildChildren(),
      ),
    );
  }

  void _updateState() {
    setState(() {});
  }
}
