import 'package:json_annotation/json_annotation.dart';

part 'customer.g.dart';

@JsonSerializable()
class Customer {
  Customer();

  late num id;
  late String email;
  late String password;
  late String name;
  late String address;
  late String phoneNumber;
  
  factory Customer.fromJson(Map<String,dynamic> json) => _$CustomerFromJson(json);
  Map<String, dynamic> toJson() => _$CustomerToJson(this);
}
