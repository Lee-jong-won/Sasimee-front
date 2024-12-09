import 'package:flutter/cupertino.dart';

class LoginViewModel with ChangeNotifier {

  final TextEditingController _emailController = TextEditingController();
  get emailController => _emailController;

  final TextEditingController _passwordController = TextEditingController();
  get passwordController => _passwordController;

  final FocusNode _emailFocusNode = FocusNode();
  get emailFocusNode => _emailFocusNode;

  final FocusNode _passwordFocusNode = FocusNode();
  get passwordFocusNode => _passwordFocusNode;

  LoginViewModel() {
    _emailFocusNode.addListener(_onFocusChange);
  }

  void _onFocusChange() {
    notifyListeners();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }
}