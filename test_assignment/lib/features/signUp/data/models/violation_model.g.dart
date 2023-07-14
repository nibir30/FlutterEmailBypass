// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'violation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ViolationModel _$ViolationModelFromJson(Map<String, dynamic> json) {
  return ViolationModel(
    json['propertyPath'] as String?,
    json['message'] as String?,
    json['code'] as String?,
  );
}

Map<String, dynamic> _$ViolationModelToJson(ViolationModel instance) =>
    <String, dynamic>{
      'propertyPath': instance.propertyPath,
      'message': instance.message,
      'code': instance.code,
    };
