import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sasimee/screens/login/login_screen.dart';
import 'package:sasimee/screens/password/password_auth_viewmodel.dart';
import 'package:sasimee/screens/password/password_reset_screen.dart';
import 'package:sasimee/styles/color_styles.dart';
import 'package:sasimee/widgets/common_text_field.dart';
import 'package:sprintf/sprintf.dart';

class PasswordAuthScreen extends StatefulWidget {
  static String routeName = "/password_auth";

  final String email;

  const PasswordAuthScreen({required this.email, super.key});

  @override
  State<PasswordAuthScreen> createState() => _PasswordAuthScreenState();
}

class _PasswordAuthScreenState extends State<PasswordAuthScreen> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return ChangeNotifierProvider(
      create: (_) => PasswordAuthViewModel(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(title: Text('find_password'.tr())),
        body: Builder(builder: (context) {
          final viewModel = Provider.of<PasswordAuthViewModel>(context);

          return SafeArea(
            child: SingleChildScrollView(
              child: Container(
                height: mediaQuery.size.height -
                    mediaQuery.padding.top -
                    mediaQuery.padding.bottom -
                    kToolbarHeight,
                padding: const EdgeInsets.only(
                  left: 32,
                  top: 53,
                  right: 32,
                  bottom: 57,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'enter_authentication_code'.tr(),
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            'sent_authentication_code'.tr(
                              namedArgs: {'email': widget.email},
                            ),
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(height: 53),
                          StreamBuilder<Duration>(
                              stream: viewModel.timer,
                              builder: (context, snapshot) {
                                final duration = snapshot.data;
                                final minutes =
                                    duration == null || duration.inMinutes < 0
                                        ? 0
                                        : duration.inMinutes;
                                final seconds =
                                    duration == null || duration.inSeconds < 0
                                        ? 0
                                        : duration.inSeconds % 60;

                                final time =
                                    sprintf('%02d:%02d', [minutes, seconds]);

                                return CommonTextField(
                                  textEditingController:
                                      viewModel.authenticationCodeController,
                                  type: TextFieldType.authenticationCode,
                                  focusNode:
                                      viewModel.authenticationCodeFocusNode,
                                  suffix: IntrinsicWidth(
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 18),
                                        child: Text(
                                          time,
                                          style: const TextStyle(
                                            fontSize: 14,
                                            color: Color(0xfff25a5a),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }),
                        ],
                      ),
                    ),
                    _bottomDoneLayout(),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  /// 인증번호 재요청 또는 입력 완료 버튼 레이아웃을 리턴합니다.
  Widget _bottomDoneLayout() {
    return Consumer<PasswordAuthViewModel>(builder: (context, viewModel, _) {
      return Column(
        children: [
          _doneButton(viewModel, context),
          const SizedBox(height: 30),
          Visibility.maintain(child: _placeholder())
        ],
      );
    });
  }

  /// 인증번호 재요청 또는 입력 완료 버튼 위젯을 리턴합니다.
  Widget _doneButton(PasswordAuthViewModel viewModel, BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
          onPressed: () async {
            if (viewModel.isButtonEnabled) {
              Navigator.of(context).pushNamedAndRemoveUntil(
                  PasswordResetScreen.routeName, (route) {
                if (route.settings.name == LoginScreen.routeName) {
                  return true;
                }

                return false;
              });
            } else {
              viewModel.requestOtp();
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: ColorStyles.primaryBlue,
          ),
          child: Text(viewModel.isButtonEnabled
              ? 'enter_complete'.tr()
              : 're_request_authentication_code'.tr())),
    );
  }

  /// 회원 가입 화면과 버튼의 위치를 일치시키기 위한 Placeholder 위젯을 리턴합니다.
  Widget _placeholder() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: null,
          child: Text(
            '',
            style: TextStyle(
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
