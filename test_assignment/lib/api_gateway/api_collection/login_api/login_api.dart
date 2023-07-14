import 'package:test_assignment/features/logIn/data/models/login_response_model.dart';

class LoginApi {
  LoginResponseModel listMapResponse(Map<String, dynamic>? responseJson) {
    final LoginResponseModel _response = LoginResponseModel.fromJson(responseJson!);

    return _response;
  }
}
