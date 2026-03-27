import 'package:admin_dashboard/features/dashboard/data/models/dashboard_model.dart';

import '../../data/models/user_model.dart';

abstract class UserState {}

class UserInitial extends UserState {}
class UserLoading extends UserState {}
class UserSuccess extends UserState {
  final UserModel data;
  UserSuccess(this.data);
}
class UserError extends UserState {
  final String message;
  UserError(this.message);
}