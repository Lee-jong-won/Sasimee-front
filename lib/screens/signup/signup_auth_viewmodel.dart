import 'dart:async';

import 'package:flutter/cupertino.dart';

class SignupAuthViewModel with ChangeNotifier {
  final TextEditingController _authenticationNumberController =
  TextEditingController();

  get authenticationNumberController => _authenticationNumberController;

  final FocusNode _authenticationNumberFocusNode = FocusNode();

  get authenticationNumberFocusNode => _authenticationNumberFocusNode;

  bool _isButtonEnabled = false;

  bool get isButtonEnabled => _isButtonEnabled;

  SignupAuthViewModel() {
    _authenticationNumberController.addListener(_validateInputs);
  }

  void _validateInputs() {
    final code = _authenticationNumberController.text.trim();

    _isButtonEnabled = code.length == 6;

    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
    _authenticationNumberController.dispose();
    _authenticationNumberFocusNode.dispose();
  }

  Future<void> requestOtp() async {
    _authenticationNumberController.clear();
  }
}