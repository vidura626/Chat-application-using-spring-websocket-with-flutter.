import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:websocket_chat_app/core/constants/constants.dart';
import 'package:websocket_chat_app/features/user/data/data_sources/user_datasource.dart';
import 'package:websocket_chat_app/features/user/data/repositories/user_repository_impl.dart';
import 'package:websocket_chat_app/features/user/domain/entities/user_entity.dart';
import 'package:websocket_chat_app/features/user/domain/use_cases/user_use_case.dart';

class LoginLogic extends GetxController {
  // ===================== TextEditingControllers =======================
  Rx<TextEditingController> nameTEController = TextEditingController().obs;

  // ===================== Use Cases ====================================
  late final UserUseCase _userUseCase = UserUseCaseImpl(UserRepositoryImpl(UserDatasource(Dio(), baseUrl: baseUrl)));

  void login() {
    String name = nameTEController.value.text;
    ;
    UserEntity userEntity = UserEntity(name: name, id: 0, status: 'ONLINE');
    _userUseCase.login(userEntity);
  }
}
