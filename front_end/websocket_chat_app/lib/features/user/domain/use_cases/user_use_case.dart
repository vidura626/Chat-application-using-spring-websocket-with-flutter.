import 'dart:developer';

import 'package:websocket_chat_app/features/user/domain/entities/user_entity.dart';

import '../../../../core/resources/data_state.dart';
import '../repositories/user_repository.dart';

abstract class UserUseCase extends DataState<UserEntity>{
  Future<DataState<UserEntity>> register(UserEntity userEntity);
  Future<DataState<UserEntity>> login(UserEntity userEntity);
}


class UserUseCaseImpl extends UserUseCase {

  UserRepository _userRepository;

  UserUseCaseImpl(this._userRepository);

  @override
  Future<DataState<UserEntity>> login(UserEntity userEntity) {
    return _userRepository.connectUser(userEntity);
  }

  @override
  Future<DataState<UserEntity>> register(UserEntity userEntity)  {
    log("register use case called");
    log(userEntity.toJson().toString());
    return _userRepository.saveUser(userEntity);
  }

}