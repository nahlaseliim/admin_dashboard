import 'package:admin_dashboard/core/constants/api_constants.dart';
import 'package:admin_dashboard/features/users/data/models/user_model.dart';
import 'package:dio/dio.dart';

class UserService{
  Dio dio=Dio(BaseOptions(baseUrl: ApiConstants.baseUrl));
  Future<List<UserModel>> getUserData() async {
    final response= await dio.get(ApiConstants.userEndpoint);

    return(response.data as List ).map((e)=>UserModel.fromJson(e)).toList();
  }
}