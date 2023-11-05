import 'package:json_annotation/json_annotation.dart';
import "admin.dart";
part 'admins.g.dart';

@JsonSerializable()
class Admins {
  Admins();

  late List<Admin> admins;
  
  factory Admins.fromJson(Map<String,dynamic> json) => _$AdminsFromJson(json);
  Map<String, dynamic> toJson() => _$AdminsToJson(this);
}
