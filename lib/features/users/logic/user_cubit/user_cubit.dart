import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/services/user_service.dart';
import 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final UserService service;

  UserCubit(this.service) : super(UserInitial());

  void getUserData() async {
    emit(UserLoading());
    try {
      final users = await service.getUserData();
      emit(UserSuccess(users));
    } catch (e) {
      emit(UserError("Error: $e"));
    }
  }
}