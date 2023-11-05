// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Cart _$CartFromJson(Map<String, dynamic> json) => Cart()
  ..id = json['id'] as num
  ..product = Product.fromJson(json['product'] as Map<String, dynamic>)
  ..customer = Customer.fromJson(json['customer'] as Map<String, dynamic>)
  ..amount = json['amount'] as num;

Map<String, dynamic> _$CartToJson(Cart instance) => <String, dynamic>{
      'id': instance.id,
      'product': instance.product,
      'customer': instance.customer,
      'amount': instance.amount,
    };
