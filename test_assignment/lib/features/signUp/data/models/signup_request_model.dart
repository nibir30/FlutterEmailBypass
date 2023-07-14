import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/signup_request_entity.dart';

part 'signup_request_model.g.dart';

@JsonSerializable()
class SignupRequestModel {
  String? address;
  String? password;

  SignupRequestModel(
    this.address,
    this.password,
  );

  factory SignupRequestModel.fromJson(Map<String, dynamic> json) => _$SignupRequestModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$SignupRequestModelToJson(this);

  SignupRequestEntity toEntity() {
    return SignupRequestEntity(
      address: address,
      password: password,
    );
  }
}
