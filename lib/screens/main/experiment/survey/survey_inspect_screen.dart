import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sasimee/widgets/outline_text_field.dart';

import '../../../../styles/color_styles.dart';

class SurveyInspectScreen extends StatelessWidget {
  static String routeName = "/survey-inspect";

  const SurveyInspectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _surveyInspectLayout(),
            Column(
              children: [
                _inspectionButton(),
                const SizedBox(height: 139,),
              ],
            )
          ],
        )
      ),
    );
  }

  Widget _surveyInspectLayout() {
    TextEditingController titleController = TextEditingController();
    final FocusNode titleFocusNode = FocusNode();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("survey_link".tr(),
          style: const TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8,),
        OutlineTextField(textEditingController: titleController, focusNode: titleFocusNode),
        const SizedBox(height: 32,),
        Text("survey_inspection_guide".tr(),
          style: const TextStyle(
            color: ColorStyles.subText,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 22,),
        Text("survey_inspection_criteria".tr(),
          style: const TextStyle(
              color: ColorStyles.subText,
              fontSize: 14,
              fontWeight: FontWeight.w400,
              height: 2
          ),
        ),
      ],
    );
  }

  //TODO: 설문 검수 진행
  Widget _inspectionButton() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: ColorStyles.primaryBlue,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Text("survey_do_inspect".tr(),
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
    );
  }
}