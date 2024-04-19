import 'package:websocket_chat_app/core/resources/data_state.dart';
import 'package:websocket_chat_app/features/user/domain/entities/user_entity.dart';

import '../../data/models/user_model.dart';

abstract class UserRepository {
  Future<DataState<UserEntity>> saveUser(UserEntity userEntity);

  Future<DataState<UserEntity>> connectUser(UserEntity userEntity);
}