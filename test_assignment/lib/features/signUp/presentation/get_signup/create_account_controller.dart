import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:test_assignment/api_gateway/repositories/signup_repositories/signup_repository.dart';
import 'package:test_assignment/core/utils/toast.dart';
import 'package:test_assignment/features/signUp/domain/entities/signup_request_entity.dart';
import 'package:test_assignment/features/signUp/domain/entities/signup_response_entity.dart';
import 'package:test_assignment/features/signUp/domain/usecases/signup_usecase.dart';
import 'package:test_assignment/router/routing_variables.dart';

class CreateAccountController extends GetxController {
  var signupResponse = SignupResponseEntity().obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  void createAccount(SignupRequestEntity signupRequestEntity, BuildContext context) async {
    SignupRepository signupRepository = SignupRepositoryImpl();
    SignupUseCase signupUseCase = SignupUseCase(signupRepository: signupRepository);
    isLoading.value = true;

    var response = await signupUseCase.createAccount(signupRequestEntity);
    signupResponse.value = response!;
    isLoading.value = false;

    if (response.id != null) {
      toastMsg("Your Account has been created!");
      Navigator.pushNamed(context, Navigation.authPage);
    } else {
      toastMsg("The Username already exists, try another one");
    }
  }
}
