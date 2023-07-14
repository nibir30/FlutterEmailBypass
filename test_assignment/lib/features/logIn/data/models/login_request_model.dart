import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/login_request_entity.dart';

part 'login_request_model.g.dart';

@JsonSerializable()
class LoginRequestModel {
  String? address;
  String? password;

  LoginRequestModel(
    this.address,
    this.password,
  );

  factory LoginRequestModel.fromJson(Map<String, dynamic> json) => _$LoginRequestModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$LoginRequestModelToJson(this);

  LoginRequestEntity toEntity() {
    return LoginRequestEntity(
      address: address,
      password: password,
    );
  }
}
