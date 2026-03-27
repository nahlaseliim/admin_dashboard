import 'package:admin_dashboard/core/constants/api_constants.dart';
import 'package:admin_dashboard/features/dashboard/data/models/dashboard_model.dart';
import 'package:dio/dio.dart';

class DashboardService {
  final Dio dio = Dio(BaseOptions(baseUrl: ApiConstants.baseUrl));

  Future<DashboardModel> getDashboardData() async {
    final usersRes = await dio.get(ApiConstants.userEndpoint);
    final ordersRes = await dio.get(ApiConstants.orderEndpoint);
    double revenueCalculation = ordersRes.data.length * 30;
    final reportsRes = await dio.get(ApiConstants.reportEndpoint);

    return DashboardModel(
      usersCount: usersRes.data.length,
      ordersCount: ordersRes.data.length,
      revenue: "\$${revenueCalculation.toStringAsFixed(2)}",
      reportsCount: reportsRes.data.length,
    );
  }
}