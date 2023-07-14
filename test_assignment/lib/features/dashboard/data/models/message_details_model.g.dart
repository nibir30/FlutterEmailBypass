// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessageDetailsModel _$MessageDetailsModelFromJson(Map<String, dynamic> json) {
  return MessageDetailsModel(
    json['@id'] as String?,
    json['@type'] as String?,
    json['id'] as String?,
    json['accountId'] as String?,
    json['msgid'] as String?,
    json['from'] == null ? null : FromModel.fromJson(json['from'] as Map<String, dynamic>),
    (json['to'] as List<dynamic>?)?.map((e) => FromModel.fromJson(e as Map<String, dynamic>)).toList(),
    json['subject'] as String?,
    json['intro'] as String?,
    json['seen'] as bool?,
    json['isDeleted'] as bool?,
    json['hasAttachments'] as bool?,
    json['size'] as int?,
    json['downloadUrl'] as String?,
    json['createdAt'] as String?,
    json['updatedAt'] as String?,
  );
}

Map<String, dynamic> _$MessageDetailsModelToJson(MessageDetailsModel instance) => <String, dynamic>{
      'aid': instance.aid,
      'atype': instance.atype,
      'id': instance.id,
      'accountId': instance.accountId,
      'msgid': instance.msgid,
      'from': instance.from,
      'to': instance.to,
      'subject': instance.subject,
      'intro': instance.intro,
      'seen': instance.seen,
      'isDeleted': instance.isDeleted,
      'hasAttachments': instance.hasAttachments,
      'size': instance.size,
      'downloadUrl': instance.downloadUrl,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
