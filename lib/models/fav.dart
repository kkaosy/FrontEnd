import 'package:json_annotation/json_annotation.dart';
import "product.dart";
import "customer.dart";
part 'fav.g.dart';

@JsonSerializable()
class Fav {
  Fav();

  late num id;
  late Product product;
  late Customer customer;
  
  factory Fav.fromJson(Map<String,dynamic> json) => _$FavFromJson(json);
  Map<String, dynamic> toJson() => _$FavToJson(this);
}
