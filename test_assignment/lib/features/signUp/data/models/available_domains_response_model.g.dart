// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'available_domains_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAvailableDomainsModel _$GetAvailableDomainsModelFromJson(Map<String, dynamic> json) {
  return GetAvailableDomainsModel(
    json['@context'] as String?,
    json['@id'] as String?,
    json['@type'] as String?,
    (json['hydra:member'] as List<dynamic>?)?.map((e) => HydraMemberModel.fromJson(e as Map<String, dynamic>)).toList(),
    json['hydra:totalItems'] as int?,
  );
}

Map<String, dynamic> _$GetAvailableDomainsModelToJson(GetAvailableDomainsModel instance) => <String, dynamic>{
      '@context': instance.acontext,
      '@id': instance.aid,
      '@type': instance.atype,
      'hydra:member': instance.hydramember,
      'hydra:totalItems': instance.hydratotalItems,
    };
