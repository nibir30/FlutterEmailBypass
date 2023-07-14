import 'package:test_assignment/features/dashboard/data/dataSources/home_datasource.dart';
import 'package:test_assignment/features/dashboard/data/models/get_messages_response_model.dart';
import 'package:test_assignment/features/dashboard/domain/entities/get_messages_response_entity.dart';

abstract class HomeRepository {
  Future<GetMessagesEntity?> getMessages();
}

class HomeRepositoryImpl implements HomeRepository {
  final HomeDataSource _searchDataSource = HomeDataSourceImpl();

  HomeRepositoryImpl();

  @override
  Future<GetMessagesEntity?> getMessages() async {
    final GetMessagesModel? _response = await _searchDataSource.getMessages();

    /// converting models to entities
    GetMessagesEntity? _signupEntity = _response!.toEntity();
    return _signupEntity;
  }
}
