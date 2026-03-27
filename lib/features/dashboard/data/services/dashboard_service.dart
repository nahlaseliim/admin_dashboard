import 'package:admin_dashboard/features/dashboard/data/models/dashboard_model.dart';
import 'package:dio/dio.dart';

class DashboardService {
  final Dio dio = Dio();

  Future<DashboardModel> getDashboardData() async {
    final usersRes = await dio.get(
      'https://jsonplaceholder.typicode.com/users',
    );
    final ordersRes = await dio.get(
      'https://jsonplaceholder.typicode.com/posts',
    );
   double revenueCalculation = ordersRes.data.length * 30;
final reportsRes = await dio.get(
      'https://jsonplaceholder.typicode.com/comments',
    );

    return DashboardModel(
      usersCount: usersRes.data.length,
      ordersCount: ordersRes.data.length,
      revenue: "\$${revenueCalculation.toStringAsFixed(2)}",
      reportsCount: reportsRes.data.length,
    );
  }
}