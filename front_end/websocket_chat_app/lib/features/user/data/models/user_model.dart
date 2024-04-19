import 'dart:convert';

import 'package:websocket_chat_app/features/user/domain/entities/user_entity.dart';

/// id : 0
/// name : "string"
/// status : "ONLINE"

UserModel userEntityFromJson(String str) => UserModel.fromJson(json.decode(str));

String userEntityToJson(UserModel data) => json.encode(data.toJson());

class UserModel extends UserEntity {
  UserModel({
    int? id,
    String? name,
    String? status,
  }) : super(id: id, name: name, status: status);

  UserModel.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _status = json['status'];
  }

  int? _id;
  String? _name;
  String? _status;

  UserModel copyWith({
    int? id,
    String? name,
    String? status,
  }) =>
      UserModel(
        id: id ?? _id,
        name: name ?? _name,
        status: status ?? _status,
      );

  int? get id => _id;

  String? get name => _name;

  String? get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['status'] = _status;
    return map;
  }
}
