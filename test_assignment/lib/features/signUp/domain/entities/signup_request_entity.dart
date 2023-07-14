import '../../data/models/signup_request_model.dart';

class SignupRequestEntity {
  String? address;
  String? password;

  SignupRequestEntity({
    this.address,
    this.password,
  });

  SignupRequestModel toModel() {
    return SignupRequestModel(
      address,
      password,
    );
  }
}
