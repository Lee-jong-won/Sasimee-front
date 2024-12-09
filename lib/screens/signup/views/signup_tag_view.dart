import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../enums/age_group.dart';
import '../../../styles/color_styles.dart';
import '../../../widgets/selectable_tag_list.dart';

class SignupTagView extends StatelessWidget {
  const SignupTagView({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _contentLayout(),
              _bottomButtonLayout()
            ],
          ),
        ),
      ),
    );
  }

  Widget _contentLayout() {
    final ageGroups = AgeGroup.values.map((age) => age.label).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20,),
        const LinearProgressIndicator(
          value: 1 / 6, // 전체 스탭 중 첫 번째 단계
          backgroundColor: ColorStyles.progressBarBackground,
          color: Colors.black,
        ),
        const SizedBox(height: 40,),
        Text('signup_age_title'.tr(),
          style: const TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.w600
          ),
        ),
        const SizedBox(height: 54,),
        SizedBox(
          width: double.infinity,
          child: SelectableTagList(
            items: ageGroups,
            isMultiSelect: false,
            onSelectionChanged: (selectedItems) {
              print('Selected ages: $selectedItems');
            },
          ),
        ),
      ],
    );
  }

  Widget _bottomButtonLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('signup_tag_guide'.tr(),
          style: const TextStyle(
            color: ColorStyles.guideText,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 18,),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
              onPressed: (){
                print('다음 버튼 클릭');
                // TODO: 로그인 화면으로 이동
              },
              child: Text('next'.tr())
          ),
        ),
        const SizedBox(height: 60,), // 하단 여유 공간
      ],
    );
  }
}