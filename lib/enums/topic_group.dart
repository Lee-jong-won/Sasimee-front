enum TopicGroup {
  ai('인공지능'),
  male('부동산'),
  property('정치'),
  education('교육'),
  health('건강'),
  career('직장/노동'),
  environment('환경'),
  psychology('심리'),
  socialMedia('소셜 미디어'),
  culture('문화'),
  technology('기술'),
  ethics('윤리'),
  emotion('감정'),
  ego('자아'),
  consumption('소비'),
  society('사회'),
  socialBehavior('사회적 행동'),
  healthCare('보건'),
  happiness('행복');

  final String label;
  const TopicGroup(this.label);

  static List<String> getTopicTagList() {
    return TopicGroup.values.map((topic) => topic.label).toList();
  }
}