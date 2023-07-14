import 'package:json_annotation/json_annotation.dart';
import 'package:test_assignment/features/signUp/domain/entities/hydra_member_entity.dart';

import '../../domain/entities/available_domains_response_entity.dart';
import 'hydra_member_model.dart';

part 'available_domains_response_model.g.dart';

@JsonSerializable()
class GetAvailableDomainsModel {
  String? acontext;
  String? aid;
  String? atype;
  List<HydraMemberModel>? hydramember;
  int? hydratotalItems;

  GetAvailableDomainsModel(
    this.acontext,
    this.aid,
    this.atype,
    this.hydramember,
    this.hydratotalItems,
  );

  factory GetAvailableDomainsModel.fromJson(Map<String, dynamic> json) => _$GetAvailableDomainsModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$GetAvailableDomainsModelToJson(this);

  GetAvailableDomainsEntity toEntity() {
    List<HydraMemberEntity>? searchEntity = [];

    for (var i = 0; i < hydramember!.length; i++) {
      searchEntity.add(hydramember![i].toEntity());
    }
    return GetAvailableDomainsEntity(
      acontext,
      aid,
      atype,
      searchEntity,
      hydratotalItems,
    );
  }
}
