// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admins.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Admins _$AdminsFromJson(Map<String, dynamic> json) => Admins()
  ..admins = (json['admins'] as List<dynamic>)
      .map((e) => Admin.fromJson(e as Map<String, dynamic>))
      .toList();

Map<String, dynamic> _$AdminsToJson(Admins instance) => <String, dynamic>{
      'admins': instance.admins,
    };
