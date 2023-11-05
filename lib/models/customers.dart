import 'package:json_annotation/json_annotation.dart';
import "customer.dart";
part 'customers.g.dart';

@JsonSerializable()
class Customers {
  Customers();

  late List<Customer> customers;
  
  factory Customers.fromJson(Map<String,dynamic> json) => _$CustomersFromJson(json);
  Map<String, dynamic> toJson() => _$CustomersToJson(this);
}
