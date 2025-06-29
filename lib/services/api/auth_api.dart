import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:sasimee/models/request/auth/post_email_send_request.dart';
import 'package:sasimee/models/response/auth/post_email_send_response.dart';
import 'package:sasimee/models/request/auth/post_email_verify_request.dart';
import 'package:sasimee/models/request/auth/post_register_request.dart';
import 'package:sasimee/models/request/auth/post_login_request.dart';
import 'package:sasimee/models/response/auth/post_login_response.dart';
import 'package:sasimee/models/response/default_response.dart';
import 'package:sasimee/models/response/auth/get_profile_response.dart';
import 'package:sasimee/models/request/auth/patch_profile_request.dart';
import 'package:sasimee/models/user_tag.dart';

import '../../models/request/auth/post_token_reissue_request.dart';
import '../../utils/constants.dart';

part 'auth_api.g.dart';

@RestApi(baseUrl: BASE_URL)
abstract class AuthApi {
  factory AuthApi(Dio dio, {String baseUrl}) = _AuthApi;

  // 로그인
  @POST("/user/login")
  Future<PostLoginResponse> postLogin(
      @Body() PostLoginRequest postLoginRequest);

  // 토큰 재발급
  @POST("/user/reissue")
  Future<PostLoginResponse> postTokenReissue(
      @Body() PostTokenReissueRequest postTokenReissueRequest);

  // 인증 코드 보내기
  @POST("/email/send")
  Future<PostEmailSendResponse> send(
      @Body() PostEmailSendRequest request);

  // email 인증
  @POST("/email/verify")
  Future<DefaultResponse> verify(
      @Body() PostEmailVerifyRequest request);

  // 회원가입
  @POST("/user/register")
  Future<DefaultResponse> register(
      @Body() PostRegisterRequest request);

  // 프로필 가져오기
  @GET("/user/mypage/profile")
  Future<GetProfileResponse> getProfile();

  // 프로필 수정하기
  @PATCH("/user/mypage/profile/modifiy")
  Future<void> modifyProfile(
      @Body() PatchProfileRequest request);

  // 태그 가져오기
  @GET("/user/mypage/tag")
  Future<List<UserTag>> getTag();

  //  태그 변경
  @PATCH("/user/mypage/tag/modify")
  Future<void> modifyTag(@Body() List<UserTag> tag);
}
