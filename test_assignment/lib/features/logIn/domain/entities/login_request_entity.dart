import '../../data/models/login_request_model.dart';

class LoginRequestEntity {
  String? address;
  String? password;

  LoginRequestEntity({
    this.address,
    this.password,
  });

  LoginRequestModel toModel() {
    return LoginRequestModel(
      address,
      password,
    );
  }
}
