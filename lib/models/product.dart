import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable()
class Product {
  Product();

  late num id;
  late String name;
  late String picture;
  late num price;
  late String size;
  late String color;
  late String description;
  late num amount;
  late String type;
  late String rating;
  
  factory Product.fromJson(Map<String,dynamic> json) => _$ProductFromJson(json);
  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
