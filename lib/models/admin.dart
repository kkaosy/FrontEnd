import 'package:json_annotation/json_annotation.dart';

part 'admin.g.dart';

@JsonSerializable()
class Admin {
  Admin();

  late num id;
  late String email;
  late String password;
  late String name;
  
  factory Admin.fromJson(Map<String,dynamic> json) => _$AdminFromJson(json);
  Map<String, dynamic> toJson() => _$AdminToJson(this);
}
