import 'package:test_assignment/features/signUp/data/dataSources/signup_repositories.dart';
import 'package:test_assignment/features/signUp/data/models/available_domains_response_model.dart';
import 'package:test_assignment/features/signUp/domain/entities/available_domains_response_entity.dart';

abstract class SignupRepository {
  Future<GetAvailableDomainsEntity?> getAvailableDomains();
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
}
