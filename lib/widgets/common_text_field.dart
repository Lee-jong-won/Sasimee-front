import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:sasimee/styles/icons.dart';
import '../styles/color_styles.dart';

class TextFieldType {
  static final EMAIL = TextFieldType("email_hint".tr(), SvgIcons.email);
  static final PASSWORD = TextFieldType("password_hint".tr(), SvgIcons.lock);
  //TODO: 이름, 전화번호 등 회원 정보 입력 유형 추가 필요

  final String hintText;
  final SvgPicture prefixIcon;

  TextFieldType(this.hintText, this.prefixIcon);
}

class CommonTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  final TextFieldType type;

  const CommonTextField({super.key,
    required this.textEditingController,
    required this.type
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextField(
        cursorColor: Colors.black54,
        obscureText: type == TextFieldType.PASSWORD, // TODO: type 비밀번호일 경우 비밀번호 보기 기능 구현
        decoration: InputDecoration(
          filled: true,
          fillColor: ColorStyles.textFieldBackground,
          contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(12.0),
            child: type.prefixIcon,
          ),
          hintText: type.hintText,
          hintStyle: const TextStyle(
              color: ColorStyles.hintText,
              fontSize: 14,
              fontWeight: FontWeight.w400
          ),
          focusColor: ColorStyles.translucenceBlue,
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(16.0)),
            borderSide: BorderSide(width: 1, color: ColorStyles.primaryBlue),
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(16.0)),
          ),
        ),
      ),
    );
  }
}