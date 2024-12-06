import 'package:flutter/material.dart';
import 'package:sasimee/widgets/tag_item.dart';

import '../../../styles/color_styles.dart';

class SurveyItem extends StatelessWidget {
  final String title; //TODO: Survey 데이터로 변경

  const SurveyItem({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _leftTime(),
          const SizedBox(
            height: 10,
          ),
          Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const TagList(
              type: ExperimentType.SURVEY,
              tags: ['설문형', '여성', '인공지능']
          )
        ],
      ),
    );
  }

  Widget _leftTime() {
    return Container(
        decoration: BoxDecoration(
            color: ColorStyles.secondaryBlue,
            borderRadius: BorderRadius.circular(4)),
        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
        child: Text(
          '1시간 남음',
          style: const TextStyle(
              fontSize: 11,
              color: ColorStyles.primaryBlue
          ),
        )
    );
  }
}
