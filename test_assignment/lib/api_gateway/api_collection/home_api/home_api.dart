import 'package:test_assignment/features/dashboard/data/models/get_messages_response_model.dart';

class HomeApi {
  GetMessagesModel listMapResponse(Map<String, dynamic>? responseJson) {
    final GetMessagesModel _response = GetMessagesModel.fromJson(responseJson!);

    return _response;
  }
}
