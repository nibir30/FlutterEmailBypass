import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/violation_entity.dart';

part 'violation_model.g.dart';

@JsonSerializable()
class ViolationModel {
  String? propertyPath;
  String? message;
  String? code;

  ViolationModel(
    this.propertyPath,
    this.message,
    this.code,
  );

  factory ViolationModel.fromJson(Map<String, dynamic> json) => _$ViolationModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ViolationModelToJson(this);

  ViolationEntity toEntity() {
    return ViolationEntity(
      propertyPath,
      message,
      code,
    );
  }
}
