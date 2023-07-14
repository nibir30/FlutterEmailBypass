import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:test_assignment/api_gateway/api_collection/signup_api/available_domains_api.dart';
import 'package:test_assignment/api_gateway/api_collection/signup_api/create_account_api.dart';
import 'package:test_assignment/features/signUp/data/models/available_domains_response_model.dart';
import 'package:test_assignment/features/signUp/data/models/signup_response_model.dart';
import 'package:test_assignment/features/signUp/domain/entities/signup_request_entity.dart';

abstract class SignupDataSource {
  Future<GetAvailableDomainsModel?> getAvailableDomains();
  Future<SignupResponseModel?> createAccount(SignupRequestEntity signupRequestEntity);
}

class SignupDataSourceImpl implements SignupDataSource {
  final AvailableDomainsApi _availableDomainsApi = AvailableDomainsApi();
  final CreateAccountApi _createAccountApi = CreateAccountApi();

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
    GetAvailableDomainsModel _response = _availableDomainsApi.listMapResponse(body);
    print(body);
    return _response;
  }

  @override
  Future<SignupResponseModel?> createAccount(SignupRequestEntity signupRequestEntity) async {
    /// url input
    String url = 'https://api.mail.tm/accounts';

    /// http request
    final response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'address': signupRequestEntity.address!,
        'password': signupRequestEntity.password!,
      }),
    );

    /// json data to List of Maps conversion
    final Map<String, dynamic> body = Map<String, dynamic>.from(json.decode(response.body));

    /// map to model conversion
    SignupResponseModel _response = _createAccountApi.listMapResponse(body);
    print(body);
    return _response;
  }
}
