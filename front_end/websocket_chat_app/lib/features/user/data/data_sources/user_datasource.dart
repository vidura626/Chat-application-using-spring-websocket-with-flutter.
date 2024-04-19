import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../core/constants/constants.dart';
import '../models/user_model.dart';


part 'user_datasource.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class UserDatasource {
  factory UserDatasource(Dio dio, {String baseUrl}) = _UserDatasource;
  
  
  @POST('user')
  Future<HttpResponse<UserModel>> saveUser(@Body() UserModel userModel);
}