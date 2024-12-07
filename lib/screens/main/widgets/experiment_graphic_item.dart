import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sasimee/styles/svg_icons.dart';
import 'package:sasimee/widgets/tag_item.dart';

class ExperimentGraphicItem extends StatelessWidget {
  final ExperimentType type; //TODO: Perform 데이터로 변경

  const ExperimentGraphicItem({
    super.key,
    required this.type
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: ExperimentType.getTagBackgroundColor[type],
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 15, horizontal: 18
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: SizedBox(
              width: 80,
              height: 80,
              child: type == ExperimentType.SURVEY
                  ? Image.asset('assets/images/graphics/img_survey.png')
                  : Image.asset('assets/images/graphics/img_perform.png')
            ),
          ),
          const SizedBox(height: 17,),
          Text(type == ExperimentType.SURVEY
              ? 'survey_description'.tr()
              : 'perform_description'.tr(),
            style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: Colors.black
            ),
          ),
          const SizedBox(height: 17,),
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 10, horizontal: 16
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 4,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: GestureDetector(
              onTap: (){
                //TODO: 실험 생성 화면으로 이동
                print("실헝 생성, $type");
              },
              child: Row(
                children: [
                  Expanded(
                    child: Text(type == ExperimentType.SURVEY
                        ? "survey_create".tr()
                        : "perform_create".tr(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w300,
                          color: Colors.black
                      ),
                    ),
                  ),
                  SvgIcons.arrowDotted
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}