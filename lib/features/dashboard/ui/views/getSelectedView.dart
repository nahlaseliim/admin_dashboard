import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/services/dashboard_service.dart';
import '../../logic/dashboard_cubit/dashboard_cubit.dart';
import 'DashboardView.dart';
import 'OrdersView.dart';
import 'UsersView.dart';

Widget getSelectedView(int selectedIndex) {
  switch (selectedIndex) {
    case 0:
      return BlocProvider(
        create: (context) => DashboardCubit(DashboardService())..getDashboardData(),
        child: DashboardView(),
      );
    case 1:
      return UsersView();
    case 2:
      return OrdersView();
    default:
      return Center(child: Text("Page not found"));
  }
}
