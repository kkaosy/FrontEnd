// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fav.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Fav _$FavFromJson(Map<String, dynamic> json) => Fav()
  ..id = json['id'] as num
  ..product = Product.fromJson(json['product'] as Map<String, dynamic>)
  ..customer = Customer.fromJson(json['customer'] as Map<String, dynamic>);

Map<String, dynamic> _$FavToJson(Fav instance) => <String, dynamic>{
      'id': instance.id,
      'product': instance.product,
      'customer': instance.customer,
    };
