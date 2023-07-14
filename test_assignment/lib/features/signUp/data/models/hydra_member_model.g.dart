// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hydra_member_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HydraMemberModel _$HydraMemberModelFromJson(Map<String, dynamic> json) {
  return HydraMemberModel(
    json['@id'] as String?,
    json['@type'] as String?,
    json['id'] as String?,
    json['domain'] as String?,
    json['isActive'] as bool?,
    json['isPrivate'] as bool?,
    json['createdAt'] as String?,
    json['updatedAt'] as String?,
  );
}

Map<String, dynamic> _$HydraMemberModelToJson(HydraMemberModel instance) => <String, dynamic>{
      '@id': instance.aid,
      '@type': instance.atype,
      'id': instance.id,
      'domain': instance.domain,
      'isActive': instance.isActive,
      'isPrivate': instance.isPrivate,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
