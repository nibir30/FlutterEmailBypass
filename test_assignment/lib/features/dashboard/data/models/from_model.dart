import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/from_entity.dart';

part 'from_model.g.dart';

@JsonSerializable()
class FromModel {
  String? address;
  String? name;

  FromModel(
    this.address,
    this.name,
  );

  factory FromModel.fromJson(Map<String, dynamic> json) => _$FromModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$FromModelToJson(this);

  FromEntity toEntity() {
    return FromEntity(
      address,
      name,
    );
  }
}
