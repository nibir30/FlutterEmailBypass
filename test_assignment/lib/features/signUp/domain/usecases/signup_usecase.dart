import 'package:test_assignment/features/signUp/domain/entities/available_domains_response_entity.dart';
import 'package:test_assignment/features/signUp/domain/entities/signup_request_entity.dart';
import 'package:test_assignment/features/signUp/domain/entities/signup_response_entity.dart';

import '../../../../api_gateway/repositories/signup_repositories/signup_repository.dart';

class SignupUseCase {
  final SignupRepository signupRepository;
  SignupUseCase({required this.signupRepository});

  Future<GetAvailableDomainsEntity?> getAvailableDomains() async {
    return await signupRepository.getAvailableDomains();
  }

  Future<SignupResponseEntity?> createAccount(SignupRequestEntity signupRequestEntity) async {
    return await signupRepository.createAccount(signupRequestEntity);
  }
}
