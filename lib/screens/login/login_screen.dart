import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sasimee/screens/login/login_viewmodel.dart';
import 'package:sasimee/screens/main/main_screen.dart';
import 'package:sasimee/styles/icons.dart';

import '../../styles/color_styles.dart';
import '../../widgets/common_text_field.dart';

class LoginScreen extends StatelessWidget {
  static String routeName = "/login";
  
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginViewModel loginViewModel = Provider.of<LoginViewModel>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 30,),
                Flexible(
                    flex: 3,
                    child: _appDescriptionLayout()
                ),
                const SizedBox(height: 10,),
                Flexible(
                  flex: 3,
                    child: _contentInputLayout(loginViewModel)
                ),
                Flexible(
                  flex: 2,
                    child: _bottomLoginAndSignupLayout(context)
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _appDescriptionLayout() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 80,
          child: PngImages.logo,
        ),
        const SizedBox(height: 18,),
        SizedBox(
          width: 126,
          height: 38,
          child: SvgIcons.textLogo,
        ),
        const SizedBox(height: 15,),
        Text('login_app_description'.tr(),
          style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Colors.black
          ),
        ),
      ],
    );
  }

  Widget _contentInputLayout(LoginViewModel viewModel) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        CommonTextField(textEditingController: viewModel.emailController, type: TextFieldType.EMAIL),
        const SizedBox(height: 20,),
        CommonTextField(textEditingController: viewModel.passwordController, type: TextFieldType.PASSWORD),
        const SizedBox(height: 6,),
        TextButton(
          onPressed: () {
            //TODO: 비밀번호 찾기 페이지로 이동
            print("비밀번호 찾기 버튼 클릭");
          },
          child: Text('forget_password'.tr(),
            style: const TextStyle(
              color: ColorStyles.hintText,
              fontSize: 14,
              fontWeight: FontWeight.w400,
              decoration: TextDecoration.underline,
            ),
          ),
        )
      ],
    );
  }

  Widget _bottomLoginAndSignupLayout(BuildContext context) {
    return Column(
      children: [
        _loginButton(context),
        const SizedBox(height: 30,),
        _signupButton()
      ],
    );
  }

  Widget _loginButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
          onPressed: (){
            // TODO: 로그인 화면으로 이동
            Navigator.pushNamedAndRemoveUntil(context, MainScreen.routeName, (route) => false); // 홈으로 이동 (임시)
          },
          child: Text('login'.tr())
      ),
    );
  }

  Widget _signupButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('not_yet_member'.tr(),
          style: const TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
        TextButton(
          onPressed: () {
            //TODO: 회원가입 페이지로 이동
            print("회원가입 버튼 클릭");
          },
          child: Text('signup'.tr(),
            style: const TextStyle(
              color: ColorStyles.primaryBlue,
              fontSize: 14,
              fontWeight: FontWeight.w600,
              decoration: TextDecoration.underline,
              decorationColor: ColorStyles.primaryBlue,
            ),
          ),
        ),
      ],
    );
  }
}