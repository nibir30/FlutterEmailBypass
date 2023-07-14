import 'package:json_annotation/json_annotation.dart';
import 'package:test_assignment/features/dashboard/domain/entities/message_details_entity.dart';

import '../../domain/entities/get_messages_response_entity.dart';
import 'message_details_model.dart';

part 'get_messages_response_model.g.dart';

@JsonSerializable()
class GetMessagesModel {
  String? acontext;
  String? aid;
  String? atype;
  List<MessageDetailsModel>? hydramember;
  int? hydratotalItems;

  GetMessagesModel(
    this.acontext,
    this.aid,
    this.atype,
    this.hydramember,
    this.hydratotalItems,
  );

  factory GetMessagesModel.fromJson(Map<String, dynamic> json) => _$GetMessagesModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$GetMessagesModelToJson(this);

  GetMessagesEntity toEntity() {
    List<MessageDetailsEntity>? dummyentity = [];

    for (var i = 0; i < hydramember!.length; i++) {
      dummyentity.add(hydramember![i].toEntity());
    }
    return GetMessagesEntity(
      acontext: acontext,
      aid: aid,
      atype: atype,
      hydramember: dummyentity,
      hydratotalItems: hydratotalItems,
    );
  }
}
