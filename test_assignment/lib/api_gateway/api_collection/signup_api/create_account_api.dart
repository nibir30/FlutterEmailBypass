import 'package:test_assignment/features/signUp/data/models/signup_response_model.dart';

class CreateAccountApi {
  SignupResponseModel listMapResponse(Map<String, dynamic>? responseJson) {
    final SignupResponseModel _response = SignupResponseModel.fromJson(responseJson!);

    return _response;
  }
}
