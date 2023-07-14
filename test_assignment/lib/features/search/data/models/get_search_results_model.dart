import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/get_search_results_entity.dart';
import '../../domain/entities/search_result_entity.dart';
import 'search_result_model.dart';

part 'get_search_results_model.g.dart';

@JsonSerializable()
class GetSearchResultsModel {
  List<SearchResultModel>? results;

  GetSearchResultsModel(
    this.results,
  );

  factory GetSearchResultsModel.fromJson(Map<String, dynamic> json) => _$GetSearchResultsModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$GetSearchResultsModelToJson(this);

  GetSearchResultsEntity toEntity() {
    List<SearchResultEntity>? searchEntity = [];

    for (var i = 0; i < results!.length; i++) {
      searchEntity.add(results![i].toEntity());
    }
    return GetSearchResultsEntity(
      searchEntity,
    );
  }
}
