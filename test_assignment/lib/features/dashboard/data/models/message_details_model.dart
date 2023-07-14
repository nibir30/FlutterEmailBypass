import 'package:json_annotation/json_annotation.dart';
import 'package:test_assignment/features/dashboard/domain/entities/from_entity.dart';

import '../../domain/entities/message_details_entity.dart';
import 'from_model.dart';

part 'message_details_model.g.dart';

@JsonSerializable()
class MessageDetailsModel {
  String? aid;
  String? atype;
  String? id;
  String? accountId;
  String? msgid;
  FromModel? from;
  List<FromModel>? to;
  String? subject;
  String? intro;
  bool? seen;
  bool? isDeleted;
  bool? hasAttachments;
  int? size;
  String? downloadUrl;
  String? createdAt;
  String? updatedAt;

  MessageDetailsModel(
    this.aid,
    this.atype,
    this.id,
    this.accountId,
    this.msgid,
    this.from,
    this.to,
    this.subject,
    this.intro,
    this.seen,
    this.isDeleted,
    this.hasAttachments,
    this.size,
    this.downloadUrl,
    this.createdAt,
    this.updatedAt,
  );

  factory MessageDetailsModel.fromJson(Map<String, dynamic> json) => _$MessageDetailsModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$MessageDetailsModelToJson(this);

  MessageDetailsEntity toEntity() {
    List<FromEntity>? toentity = [];

    for (var i = 0; i < to!.length; i++) {
      toentity.add(to![i].toEntity());
    }

    return MessageDetailsEntity(
      aid,
      atype,
      id,
      accountId,
      msgid,
      from!.toEntity(),
      toentity,
      subject,
      intro,
      seen,
      isDeleted,
      hasAttachments,
      size,
      downloadUrl,
      createdAt,
      updatedAt,
    );
  }
}
