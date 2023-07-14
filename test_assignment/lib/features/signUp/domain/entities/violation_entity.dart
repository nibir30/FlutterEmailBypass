import '../../data/models/violation_model.dart';

class ViolationEntity {
  String? propertyPath;
  String? message;
  String? code;

  ViolationEntity(
    this.propertyPath,
    this.message,
    this.code,
  );

  ViolationModel toModel() {
    return ViolationModel(
      propertyPath,
      message,
      code,
    );
  }
}
