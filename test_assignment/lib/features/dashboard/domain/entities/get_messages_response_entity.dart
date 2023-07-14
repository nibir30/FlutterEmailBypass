import 'message_details_entity.dart';

class GetMessagesEntity {
  String? acontext;
  String? aid;
  String? atype;
  List<MessageDetailsEntity>? hydramember;
  int? hydratotalItems;

  GetMessagesEntity({
    this.acontext,
    this.aid,
    this.atype,
    this.hydramember,
    this.hydratotalItems,
  });
}
