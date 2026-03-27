import 'package:flutter/material.dart';

class DashboardModel {
  final int usersCount;
  final int ordersCount;
  final String revenue;
  final int reportsCount;

  DashboardModel({
    required this.usersCount,
    required this.ordersCount,
    required this.revenue,
    required this.reportsCount
  });

}
