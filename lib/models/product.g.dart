// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product()
  ..id = json['id'] as num
  ..name = json['name'] as String
  ..picture = json['picture'] as String
  ..price = json['price'] as num
  ..size = json['size'] as String
  ..color = json['color'] as String
  ..description = json['description'] as String
  ..amount = json['amount'] as num
  ..type = json['type'] as String
  ..rating = json['rating'] as String;

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'picture': instance.picture,
      'price': instance.price,
      'size': instance.size,
      'color': instance.color,
      'description': instance.description,
      'amount': instance.amount,
      'type': instance.type,
      'rating': instance.rating,
    };
