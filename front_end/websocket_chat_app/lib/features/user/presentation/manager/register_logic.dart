import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:websocket_chat_app/common/my_button.dart';
import 'package:websocket_chat_app/core/constants/constants.dart';
import 'package:websocket_chat_app/features/user/data/data_sources/user_datasource.dart';
import 'package:websocket_chat_app/features/user/data/repositories/user_repository_impl.dart';
import 'package:websocket_chat_app/features/user/domain/use_cases/user_use_case.dart';
import 'package:websocket_chat_app/main.dart';

import '../../../../core/resources/data_state.dart';
import '../../domain/entities/user_entity.dart';

class RegisterLogic extends GetxController {
  // ===================== TextEditingControllers =======================
  Rx<TextEditingController> nameTEController = TextEditingController().obs;

  // ===================== UseCases =====================================
  final UserUseCase _userUseCase = UserUseCaseImpl(UserRepositoryImpl(UserDatasource(Dio(BaseOptions(baseUrl: baseUrl)), baseUrl: baseUrl)));

  void onRegister() async {
    if (_validate()) {
      UserEntity user = UserEntity(name: nameTEController.value.text, status: "ONLINE", id: 0);
      DataState<UserEntity> response = await _userUseCase.register(user);
      if (response is DataSuccess) {
        Get.snackbar('Success', 'User registered successfully');
        Get.offNamed(routeMap[Routes.home]!.path);
      } else if (response is DataFailed) {
        Get.snackbar('Failed', response.error!.response!.data.toString());
      }
      clear();
    }
  }

  bool _validate() {
    if (nameTEController.value.text.isEmpty) {
      Get.snackbar('Validation Failed', 'Name cannot be empty');
      return false;
    }
    return true;
  }

  void clear() {
    nameTEController.value.clear();
  }
}
