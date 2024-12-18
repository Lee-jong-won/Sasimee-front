import 'package:json_annotation/json_annotation.dart';

part 'post_profile_request.g.dart';

@JsonSerializable()
class PatchProfileRequest {
  String name;
  String phonenumber;

  PatchProfileRequest({required this.name, required this.phonenumber});

  factory PatchProfileRequest.fromJson(Map<String, dynamic> json) =>
      _$PostProfileRequestFromJson(json);

  Map<String, dynamic> toJson() => _$PostProfileRequestToJson(this);
}
