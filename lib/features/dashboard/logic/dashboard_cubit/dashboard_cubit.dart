import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/services/dashboard_service.dart';
import 'dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  final DashboardService service;

  DashboardCubit(this.service) : super(DashboardInitial());

  void getDashboardData() async {
    emit(DashboardLoading());
    try {
      final data = await service.getDashboardData();
      emit(DashboardSuccess(data));
    } catch (e) {
      emit(DashboardError("Error: $e"));
    }
  }
}