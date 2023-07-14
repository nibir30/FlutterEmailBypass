import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:test_assignment/api_gateway/repositories/login_repositories/login_repository.dart';
import 'package:test_assignment/core/user_info.dart';
import 'package:test_assignment/core/utils/toast.dart';
import 'package:test_assignment/features/logIn/domain/entities/login_request_entity.dart';
import 'package:test_assignment/features/logIn/domain/usecases/login_usecase.dart';

import '../../../../router/routing_variables.dart';
import '../../domain/entities/login_response_entity.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;
  var loginResponse = LoginResponseEntity().obs;

  @override
  void onInit() {
    super.onInit();
  }

  void login(LoginRequestEntity loginRequestEntity, BuildContext context) async {
    isLoading.value = true;

    LoginRepository loginRepository = LoginRepositoryImpl();
    LoginUseCase loginUseCase = LoginUseCase(loginRepository: loginRepository);

    var response = await loginUseCase.login(loginRequestEntity);
    isLoading.value = false;

    loginResponse.value = response!;

    if (response.message == null) {
      userInfo.setUserData(response);
      toastMsg("Welcome!");
      // Navigator.pushNamed(context, Navigation.homePage);
      Navigator.pushNamedAndRemoveUntil(
        context,
        Navigation.homePage,
        (route) => false,
      );
    } else {
      toastMsg(response.message.toString());
    }
  }
}
