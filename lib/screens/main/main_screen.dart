import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sasimee/screens/main/widgets/experiment_graphic_item.dart';
import 'package:sasimee/screens/main/widgets/perform_item.dart';
import 'package:sasimee/screens/main/widgets/survey_item.dart';
import 'package:sasimee/widgets/tag_item.dart';

import '../../styles/color_styles.dart';
import '../../styles/svg_icons.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  static String routeName = "/";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
          _appBar(),
          Expanded(
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  _bannerLayout(),
                  Positioned(
                      top: 145, // 배너와 겹치는 위치 조절
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: _contentLayout()
                  )
                ],
              )
          ),
        ])
    );
  }

  Widget _appBar() {
    return AppBar(
      scrolledUnderElevation: 0, // 스크롤 시 앱바가 어두워지는 현상 제거
      backgroundColor: Colors.white,
      titleSpacing: 22, // 좌측 여백
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 28,
            height: 25,
            child: Image.asset('assets/images/sasimee_logo.png'),
          ),
          const SizedBox(width: 13),
          SizedBox(
            height: 25,
            child: SvgIcons.textLogo,
          )
        ],
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              //TODO: 마이페이지로 이동
            },
            child: SizedBox(
              width: 30,
              height: 30,
              child: SvgIcons.profile,
            ),
          ),
        ),
        const SizedBox(width: 12) // 우측 여백
      ],
    );
  }

  Widget _bannerLayout() {
    return SizedBox(
      width: double.infinity,
      child: Image.asset(
        'assets/images/banners/banner_user_guide.png',
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _contentLayout() {
    return Container(
          decoration: const BoxDecoration(
            color: ColorStyles.layoutBackground,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(
                  vertical: 30,
                  horizontal: 24
              ),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _surveyRecommendLayout(), // 추천하는 설문형 실험
                    const SizedBox(height: 32,),
                    _performRecommendLayout(), // 추천하는 실험형 실험
                    const SizedBox(height: 32,),
                    _graphicsLayout()
                  ],
                ),
              ),
            ),
          ),
    );
  }

  Widget _surveyRecommendLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("survey_recommend_title".tr(),
          textAlign: TextAlign.start,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 10,),
        ...List.generate(
          3, (index) => Column(
            children: [
              const SurveyItem(title: '이미지 생성형 AI 사용 목적 조사'),
              if (index != 2) const SizedBox(height: 16), // 마지막 아이템이 아닐 경우에만 간격 추가
            ],
          ),
        )
      ],
    );
  }

  Widget _performRecommendLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("perform_recommend_title".tr(),
          textAlign: TextAlign.start,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 10,),
        Row(
          children: [
            Flexible(
                flex: 1,
                child: PerformItem(title: 'Social\nExperiment 1')
            ),
            SizedBox(width: 12,),
            Flexible(
                flex: 1,
                child: PerformItem(title: 'Social\nExperiment 2')
            ),
          ],
        )
      ],
    );
  }

  Widget _graphicsLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("more".tr(),
          textAlign: TextAlign.start,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 10,),
        Row(
          children: [
            Flexible(
                flex: 1,
                child: ExperimentGraphicItem(type: ExperimentType.SURVEY)
            ),
            SizedBox(width: 20,),
            Flexible(
                flex: 1,
                child: ExperimentGraphicItem(type: ExperimentType.PERFORM)
            ),
          ],
        ),
      ],
    );
  }
}