import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/hydra_member_entity.dart';

part 'hydra_member_model.g.dart';

@JsonSerializable()
class HydraMemberModel {
  String? aid;
  String? atype;
  String? id;
  String? domain;
  bool? isActive;
  bool? isPrivate;
  String? createdAt;
  String? updatedAt;

  HydraMemberModel(
    this.aid,
    this.atype,
    this.id,
    this.domain,
    this.isActive,
    this.isPrivate,
    this.createdAt,
    this.updatedAt,
  );

  factory HydraMemberModel.fromJson(Map<String, dynamic> json) => _$HydraMemberModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$HydraMemberModelToJson(this);

  HydraMemberEntity toEntity() {
    return HydraMemberEntity(
      aid,
      atype,
      id,
      domain,
      isActive,
      isPrivate,
      createdAt,
      updatedAt,
    );
  }
}
