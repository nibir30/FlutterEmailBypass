import 'package:test_assignment/features/signUp/domain/entities/violation_entity.dart';

class SignupResponseEntity {
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
  List<ViolationEntity>? violations;

  SignupResponseEntity({
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
  });
}
