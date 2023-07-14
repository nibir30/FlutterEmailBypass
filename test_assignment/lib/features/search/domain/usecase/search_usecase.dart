import '../../../../api_gateway/repositories/search_repository/search_repository.dart';
import '../entities/get_search_results_entity.dart';
import '../entities/search_request_entity.dart';

class SearchUseCase {
  final SearchRepository searchRepository;
  SearchUseCase({required this.searchRepository});

  Future<GetSearchResultsEntity?> getSearchData(SearchRequestEntity searchRequestEntity) async {
    return await searchRepository.getSearchData(searchRequestEntity);
  }
}
