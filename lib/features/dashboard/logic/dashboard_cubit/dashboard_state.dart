import 'package:admin_dashboard/features/dashboard/data/models/dashboard_model.dart';

abstract class DashboardState {}

class DashboardInitial extends DashboardState {}
class DashboardLoading extends DashboardState {}
class DashboardSuccess extends DashboardState {
  final DashboardModel data;
  DashboardSuccess(this.data);
}
class DashboardError extends DashboardState {
  final String message;
  DashboardError(this.message);
}