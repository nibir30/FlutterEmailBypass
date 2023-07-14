import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/login_response_entity.dart';

part 'login_response_model.g.dart';

@JsonSerializable()
class LoginResponseModel {
  String? message;
  String? token;

  LoginResponseModel(
    this.message,
    this.token,
  );

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) => _$LoginResponseModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$LoginResponseModelToJson(this);

  LoginResponseEntity toSuccessfulEntity() {
    return LoginResponseEntity(
      token: token,
    );
  }

  LoginResponseEntity toUnsuccessfulEntity() {
    return LoginResponseEntity(
      message: message,
    );
  }
}
