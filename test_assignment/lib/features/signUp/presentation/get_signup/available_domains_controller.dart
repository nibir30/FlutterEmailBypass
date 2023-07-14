import 'package:get/get.dart';
import 'package:test_assignment/api_gateway/repositories/signup_repositories/signup_repository.dart';
import 'package:test_assignment/features/signUp/domain/entities/available_domains_response_entity.dart';
import 'package:test_assignment/features/signUp/domain/usecases/signup_usecase.dart';

class AvailableDomainsController extends GetxController {
  var availableDomains = GetAvailableDomainsEntity().obs;

  @override
  void onInit() {
    super.onInit();
    getAvailableDomains();
  }

  void getAvailableDomains() async {
    SignupRepository signupRepository = SignupRepositoryImpl();
    SignupUseCase signupUseCase = SignupUseCase(signupRepository: signupRepository);
    var response = await signupUseCase.getAvailableDomains();
    availableDomains.value = response!;
  }
}
