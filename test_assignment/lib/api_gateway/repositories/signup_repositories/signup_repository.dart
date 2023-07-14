import 'package:test_assignment/features/signUp/data/dataSources/signup_datasources.dart';
import 'package:test_assignment/features/signUp/data/models/available_domains_response_model.dart';
import 'package:test_assignment/features/signUp/data/models/signup_response_model.dart';
import 'package:test_assignment/features/signUp/domain/entities/available_domains_response_entity.dart';
import 'package:test_assignment/features/signUp/domain/entities/signup_response_entity.dart';

import '../../../features/signUp/domain/entities/signup_request_entity.dart';

abstract class SignupRepository {
  Future<GetAvailableDomainsEntity?> getAvailableDomains();
  Future<SignupResponseEntity?> createAccount(SignupRequestEntity signupRequestEntity);
}

class SignupRepositoryImpl implements SignupRepository {
  final SignupDataSource _searchDataSource = SignupDataSourceImpl();

  SignupRepositoryImpl();

  @override
  Future<GetAvailableDomainsEntity?> getAvailableDomains() async {
    final GetAvailableDomainsModel? _response = await _searchDataSource.getAvailableDomains();

    /// converting models to entities
    GetAvailableDomainsEntity? _signupEntity = _response!.toEntity();
    return _signupEntity;
  }

  @override
  Future<SignupResponseEntity?> createAccount(SignupRequestEntity signupRequestEntity) async {
    final SignupResponseModel? _response = await _searchDataSource.createAccount(signupRequestEntity);

    /// converting models to entities
    if (_response!.id == null) {
      SignupResponseEntity? _signupEntity = _response.toUnsuccessfulEntity();
      return _signupEntity;
    } else {
      SignupResponseEntity? _signupEntity = _response.toSuccessfulEntity();
      return _signupEntity;
    }
  }
}
