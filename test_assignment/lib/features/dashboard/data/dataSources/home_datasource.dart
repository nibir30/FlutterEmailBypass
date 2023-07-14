import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:test_assignment/api_gateway/api_collection/home_api/home_api.dart';
import 'package:test_assignment/core/user_info.dart';
import 'package:test_assignment/features/dashboard/data/models/get_messages_response_model.dart';

abstract class HomeDataSource {
  Future<GetMessagesModel?> getMessages();
}

class HomeDataSourceImpl implements HomeDataSource {
  final HomeApi _homeApi = HomeApi();

  HomeDataSourceImpl();

  @override
  Future<GetMessagesModel?> getMessages() async {
    /// url input
    String url = 'https://api.mail.tm/messages';

    /// http request
    final response = await http.get(
      Uri.parse(url),
      headers: {
        HttpHeaders.authorizationHeader: 'Bearer ' + userInfo.authToken,
      },
    );

    /// json data to List of Maps conversion
    final Map<String, dynamic> body = Map<String, dynamic>.from(json.decode(response.body));

    /// map to model conversion
    GetMessagesModel _response = _homeApi.listMapResponse(body);
    print(body);
    return _response;
  }
}
