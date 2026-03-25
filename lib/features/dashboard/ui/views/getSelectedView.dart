import 'package:flutter/material.dart';
import 'DashboardView.dart';
import 'OrdersView.dart';
import 'UsersView.dart';

Widget getSelectedView(int selectedIndex) {
  switch (selectedIndex) {
    case 0:
      return DashboardView();
    case 1:
      return UsersView();
    case 2:
      return OrdersView();
    default:
      return Center(child: Text("Page not found"));
  }
}
