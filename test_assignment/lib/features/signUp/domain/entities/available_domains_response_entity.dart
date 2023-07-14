import 'hydra_member_entity.dart';

class GetAvailableDomainsEntity {
  String? acontext;
  String? aid;
  String? atype;
  List<HydraMemberEntity>? hydramember;
  int? hydratotalItems;

  GetAvailableDomainsEntity(
    this.acontext,
    this.aid,
    this.atype,
    this.hydramember,
    this.hydratotalItems,
  );
}
