import '../../data/models/login_response_model.dart';

class LoginResponseEntity {
  String? message;
  String? token;

  LoginResponseEntity({
    this.message,
    this.token,
  });

  LoginResponseModel toModel() {
    return LoginResponseModel(
      message,
      token,
    );
  }
}
