import '../../../../api_gateway/repositories/login_repositories/login_repository.dart';
import '../entities/login_request_entity.dart';
import '../entities/login_response_entity.dart';

class LoginUseCase {
  final LoginRepository loginRepository;
  LoginUseCase({required this.loginRepository});

  Future<LoginResponseEntity?> login(LoginRequestEntity loginRequestEntity) async {
    return await loginRepository.login(loginRequestEntity);
  }
}
