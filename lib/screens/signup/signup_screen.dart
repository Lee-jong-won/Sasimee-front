import 'package:flutter/cupertino.dart';
import 'package:sasimee/screens/signup/views/signup_tag_view.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  static String routeName = "/signup";

  @override
  Widget build(BuildContext context) {
    return const SignupTagView(); // TODO: 회원 정보 입력 페이지로 이동
  }
}