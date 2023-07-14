import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:test_assignment/api_gateway/api_collection/signup_api/signup_api.dart';
import 'package:test_assignment/features/signUp/data/models/available_domains_response_model.dart';

import '../../../../api_gateway/api_collection/search_api/search_api.dart';

abstract class SignupDataSource {
  Future<GetAvailableDomainsModel?> getAvailableDomains();
}

class SignupDataSourceImpl implements SignupDataSource {
  final SignUpApi _signUpApi = SignUpApi();

  SignupDataSourceImpl();

  @override
  Future<GetAvailableDomainsModel?> getAvailableDomains() async {
    /// url input
    String url = 'https://api.mail.tm/domains';

    /// http request
    final response = await http.get(Uri.parse(url));

    /// json data to List of Maps conversion
    final Map<String, dynamic> body = Map<String, dynamic>.from(json.decode(response.body));

    /// map to model conversion
    GetAvailableDomainsModel _response = _signUpApi.listMapResponse(body);
    print(body);
    return _response;
  }
}
