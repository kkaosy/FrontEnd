// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Customer _$CustomerFromJson(Map<String, dynamic> json) => Customer()
  ..id = json['id'] as num
  ..email = json['email'] as String
  ..password = json['password'] as String
  ..name = json['name'] as String
  ..address = json['address'] as String
  ..phoneNumber = json['phoneNumber'] as String;

Map<String, dynamic> _$CustomerToJson(Customer instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'password': instance.password,
      'name': instance.name,
      'address': instance.address,
      'phoneNumber': instance.phoneNumber,
    };
