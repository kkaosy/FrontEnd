// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customers.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Customers _$CustomersFromJson(Map<String, dynamic> json) => Customers()
  ..customers = (json['customers'] as List<dynamic>)
      .map((e) => Customer.fromJson(e as Map<String, dynamic>))
      .toList();

Map<String, dynamic> _$CustomersToJson(Customers instance) => <String, dynamic>{
      'customers': instance.customers,
    };
