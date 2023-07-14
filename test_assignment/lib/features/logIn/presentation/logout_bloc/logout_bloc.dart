import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:test_assignment/features/dashboard/domain/entities/get_messages_response_entity.dart';

import '../../../../core/user_info.dart';
import '../../../dashboard/presentation/getx/messages_controller.dart';

part 'logout_event.dart';
part 'logout_state.dart';

class LogoutBloc extends Bloc<LogoutEvent, LogoutState> {
  LogoutBloc() : super(LogoutInitial()) {
    on<LoadingLogoutEvent>((event, emit) => emit(LogoutLoadingState()));
    on<RequestLogoutEvent>(_onRequestLogout);
  }

  Future<void> _onRequestLogout(final RequestLogoutEvent event, final Emitter<LogoutState> emit) async {
    emit(LogoutLoadingState());
    // final LoginRepository _repository = LoginRepositoryImpl();
    // final LoginUseCase _useCase = LoginUseCase(authRepository: _repository);
    // final BaseAuthData authData = BaseAuthData();
    // final LoginResponseEntity? _entity = await _useCase(authData);
    // if (_entity != null) {
    userInfo.clearLogin();
    final getMessagesController = Get.put(MessagesController());
    getMessagesController.messages.value = GetMessagesEntity();

    emit(LogoutSuccessState());
    // } else {
    //   emit(LogoutErrorState("Unable to logout"));
    // }
  }
}
