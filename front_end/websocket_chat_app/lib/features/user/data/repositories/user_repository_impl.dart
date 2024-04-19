import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:retrofit/retrofit.dart';
import 'package:websocket_chat_app/core/resources/data_state.dart';
import 'package:websocket_chat_app/features/user/data/models/user_model.dart';
import 'package:websocket_chat_app/features/user/domain/entities/user_entity.dart';

import '../../domain/repositories/user_repository.dart';
import '../data_sources/user_datasource.dart';

class UserRepositoryImpl extends UserRepository {

  final UserDatasource _userDataSource;

  UserRepositoryImpl(this._userDataSource);

  @override
  Future<DataState<UserModel>> saveUser(UserEntity userEntity) async {
    try {
      HttpResponse entity = await _userDataSource.saveUser(UserModel.fromJson(userEntity.toJson()));
      if (entity.response.statusCode == HttpStatus.ok) {
        return DataSuccess(entity.data);
      } else {
        return DataFailed(DioException(requestOptions: entity.response.requestOptions, response: entity.response, type: DioExceptionType.badResponse, error: entity.response.statusMessage));
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<UserEntity>> connectUser(UserEntity userEntity) async {
   try {
     await _userDataSource.connectUser();
   } on DioException catch (e) {
     return DataFailed(e);
   }
  }


}