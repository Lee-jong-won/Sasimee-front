import 'package:json_annotation/json_annotation.dart';

part 'posting.g.dart';

@JsonSerializable()
class Posting {
  int id;
  String title;
  String author;
  List<String> tagName;

  Posting({
    required this.id,
    required this.title,
    required this.author,
    required this.tagName,
  });

  factory Posting.fromJson(Map<String, dynamic> json) =>
      _$PostingFromJson(json);

  Map<String, dynamic> toJson() => _$PostingToJson(this);
}
