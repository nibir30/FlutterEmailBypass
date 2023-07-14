// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_messages_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetMessagesModel _$GetMessagesModelFromJson(Map<String, dynamic> json) {
  return GetMessagesModel(
    json['@context'] as String?,
    json['@id'] as String?,
    json['@type'] as String?,
    (json['hydra:member'] as List<dynamic>?)?.map((e) => MessageDetailsModel.fromJson(e as Map<String, dynamic>)).toList(),
    json['hydra:totalItems'] as int?,
  );
}

Map<String, dynamic> _$GetMessagesModelToJson(GetMessagesModel instance) => <String, dynamic>{
      '@context': instance.acontext,
      '@id': instance.aid,
      '@type': instance.atype,
      'hydra:member': instance.hydramember,
      'hydra:totalItems': instance.hydratotalItems,
    };
