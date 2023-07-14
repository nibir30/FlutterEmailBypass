import 'package:test_assignment/features/logIn/data/dataSources/login_datasources.dart';
import 'package:test_assignment/features/logIn/data/models/login_response_model.dart';
import 'package:test_assignment/features/logIn/domain/entities/login_request_entity.dart';
import 'package:test_assignment/features/logIn/domain/entities/login_response_entity.dart';

abstract class LoginRepository {
  Future<LoginResponseEntity?> login(LoginRequestEntity loginRequestEntity);
}

class LoginRepositoryImpl implements LoginRepository {
  final LoginDataSource _loginDataSource = LoginDataSourceImpl();

  LoginRepositoryImpl();

  @override
  Future<LoginResponseEntity?> login(LoginRequestEntity loginRequestEntity) async {
    final LoginResponseModel? _response = await _loginDataSource.login(loginRequestEntity);

    /// converting models to entities
    if (_response!.message == null) {
      LoginResponseEntity? _signupEntity = _response.toSuccessfulEntity();
      return _signupEntity;
    } else {
      LoginResponseEntity? _signupEntity = _response.toUnsuccessfulEntity();
      return _signupEntity;
    }
  }
}
