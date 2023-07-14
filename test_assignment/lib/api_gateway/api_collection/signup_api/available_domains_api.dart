import 'package:test_assignment/features/signUp/data/models/available_domains_response_model.dart';

class AvailableDomainsApi {
  GetAvailableDomainsModel listMapResponse(Map<String, dynamic>? responseJson) {
    final GetAvailableDomainsModel _response = GetAvailableDomainsModel.fromJson(responseJson!);

    return _response;
  }
}
