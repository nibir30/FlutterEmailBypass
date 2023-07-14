import 'package:get/get.dart';
import 'package:test_assignment/api_gateway/repositories/home_repositories/home_repository.dart';
import 'package:test_assignment/features/dashboard/domain/entities/get_messages_response_entity.dart';
import 'package:test_assignment/features/dashboard/domain/usecase/home_usecase.dart';

class MessagesController extends GetxController {
  var isLoading = false.obs;
  var messages = GetMessagesEntity().obs;

  void getMessages() async {
    isLoading.value = true;
    HomeRepository homeRepository = HomeRepositoryImpl();
    HomeUseCase homeUseCase = HomeUseCase(homeRepository: homeRepository);
    var response = await homeUseCase.getMessages();
    isLoading.value = false;
    messages.value = response!;
  }
}
