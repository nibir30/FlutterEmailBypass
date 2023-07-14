import 'package:test_assignment/api_gateway/repositories/home_repositories/home_repository.dart';
import 'package:test_assignment/features/dashboard/domain/entities/get_messages_response_entity.dart';

class HomeUseCase {
  final HomeRepository homeRepository;
  HomeUseCase({required this.homeRepository});

  Future<GetMessagesEntity?> getMessages() async {
    return await homeRepository.getMessages();
  }
}
