import 'dart:convert';
/// id : 0
/// name : "string"
/// status : "ONLINE"

UserEntity userEntityFromJson(String str) => UserEntity.fromJson(json.decode(str));
String userEntityToJson(UserEntity data) => json.encode(data.toJson());
class UserEntity {
  UserEntity({
      int? id, 
      String? name, 
      String? status,}){
    _id = id;
    _name = name;
    _status = status;
}

  UserEntity.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _status = json['status'];
  }
  int? _id;
  String? _name;
  String? _status;
UserEntity copyWith({  int? id,
  String? name,
  String? status,
}) => UserEntity(  id: id ?? _id,
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