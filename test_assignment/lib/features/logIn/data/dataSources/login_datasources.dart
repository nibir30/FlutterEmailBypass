import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:test_assignment/api_gateway/api_collection/login_api/login_api.dart';
import 'package:test_assignment/features/logIn/data/models/login_response_model.dart';
import 'package:test_assignment/features/logIn/domain/entities/login_request_entity.dart';

abstract class LoginDataSource {
  Future<LoginResponseModel?> login(LoginRequestEntity loginRequestEntity);
}

class LoginDataSourceImpl implements LoginDataSource {
  LoginDataSourceImpl();

  LoginApi _loginApi = LoginApi();

  @override
  Future<LoginResponseModel?> login(LoginRequestEntity loginRequestEntity) async {
    /// url input
    String url = 'https://api.mail.tm/token';

    /// http request
    final response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'address': loginRequestEntity.address!,
        'password': loginRequestEntity.password!,
      }),
    );

    /// json data to List of Maps conversion
    final Map<String, dynamic> body = Map<String, dynamic>.from(json.decode(response.body));

    /// map to model conversion
    LoginResponseModel _response = _loginApi.listMapResponse(body);
    print(body);
    return _response;
  }
}
