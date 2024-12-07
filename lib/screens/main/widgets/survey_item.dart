import 'package:flutter/material.dart';
import 'package:sasimee/widgets/tag_item.dart';

import '../../../styles/color_styles.dart';

enum ItemViewType { DEFAULT, FULL }

class SurveyItem extends StatelessWidget {
  final String title; //TODO: Survey 데이터로 변경
  final ItemViewType viewType;

  const SurveyItem({
    super.key,
    this.viewType = ItemViewType.DEFAULT,
    required this.title
  });

  @override
  Widget build(BuildContext context) {
    bool isDefaultView = viewType == ItemViewType.DEFAULT;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: isDefaultView ? BorderRadius.circular(10) : null,
          boxShadow: isDefaultView
              ? [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 4,
                    offset: const Offset(0, 3), // changes position of shadow
                  )
                ]
              : null
      ),
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
