// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignupResponseModel _$SignupResponseModelFromJson(Map<String, dynamic> json) {
  return SignupResponseModel(
    json['@context'] as String?,
    json['@id'] as String?,
    json['@type'] as String?,
    json['id'] as String?,
    json['address'] as String?,
    json['quota'] as int?,
    json['used'] as int?,
    json['isDisabled'] as bool?,
    json['isDeleted'] as bool?,
    json['createdAt'] as String?,
    json['updatedAt'] as String?,
    json['hydra:title'] as String?,
    json['hydra:description'] as String?,
    (json['violations'] as List<dynamic>?)?.map((e) => ViolationModel.fromJson(e as Map<String, dynamic>)).toList(),
  );
}

Map<String, dynamic> _$SignupResponseModelToJson(SignupResponseModel instance) => <String, dynamic>{
      '@context': instance.acontext,
      '@id': instance.aid,
      '@type': instance.atype,
      'id': instance.id,
      'address': instance.address,
      'quota': instance.quota,
      'used': instance.used,
      'isDisabled': instance.isDisabled,
      'isDeleted': instance.isDeleted,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'hydra:title': instance.hydratitle,
      'hydra:description': instance.hydradescription,
      'violations': instance.violations,
    };
