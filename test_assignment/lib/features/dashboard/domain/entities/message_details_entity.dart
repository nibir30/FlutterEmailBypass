import 'from_entity.dart';

class MessageDetailsEntity {
  String? aid;
  String? atype;
  String? id;
  String? accountId;
  String? msgid;
  FromEntity? from;
  List<FromEntity>? to;
  String? subject;
  String? intro;
  bool? seen;
  bool? isDeleted;
  bool? hasAttachments;
  int? size;
  String? downloadUrl;
  String? createdAt;
  String? updatedAt;

  MessageDetailsEntity(
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
}
