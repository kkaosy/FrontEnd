import 'package:json_annotation/json_annotation.dart';
import "product.dart";
import "customer.dart";
part 'cart.g.dart';

@JsonSerializable()
class Cart {
  Cart();

  late num id;
  late Product product;
  late Customer customer;
  late num amount;
  
  factory Cart.fromJson(Map<String,dynamic> json) => _$CartFromJson(json);
  Map<String, dynamic> toJson() => _$CartToJson(this);
}
