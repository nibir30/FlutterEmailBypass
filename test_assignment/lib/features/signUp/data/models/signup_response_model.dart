import 'package:json_annotation/json_annotation.dart';
import 'package:test_assignment/features/signUp/data/models/violation_model.dart';
import 'package:test_assignment/features/signUp/domain/entities/violation_entity.dart';

import '../../domain/entities/signup_response_entity.dart';

part 'signup_response_model.g.dart';

@JsonSerializable()
class SignupResponseModel {
  //when successful
  String? acontext;
  String? aid;
  String? atype;
  String? id;
  String? address;
  int? quota;
  int? used;
  bool? isDisabled;
  bool? isDeleted;
  String? createdAt;
  String? updatedAt;

  //when unsuccessful
  String? hydratitle;
  String? hydradescription;
  List<ViolationModel>? violations;

  SignupResponseModel(
    this.acontext,
    this.aid,
    this.atype,
    this.id,
    this.address,
    this.quota,
    this.used,
    this.isDisabled,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
    this.hydratitle,
    this.hydradescription,
    this.violations,
  );

  factory SignupResponseModel.fromJson(Map<String, dynamic> json) => _$SignupResponseModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$SignupResponseModelToJson(this);

  SignupResponseEntity toSuccessfulEntity() {
    return SignupResponseEntity(
      acontext: acontext,
      aid: aid,
      atype: atype,
      id: id,
      address: address,
      quota: quota,
      used: used,
      isDeleted: isDeleted,
      isDisabled: isDisabled,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

  SignupResponseEntity toUnsuccessfulEntity() {
    List<ViolationEntity>? dummyentity = [];

    for (var i = 0; i < violations!.length; i++) {
      dummyentity.add(violations![i].toEntity());
    }
    return SignupResponseEntity(
      acontext: acontext,
      atype: atype,
      hydratitle: hydratitle,
      hydradescription: hydradescription,
      violations: dummyentity,
    );
  }
}
