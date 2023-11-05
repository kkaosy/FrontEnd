import 'package:json_annotation/json_annotation.dart';
import "fav.dart";
part 'favs.g.dart';

@JsonSerializable()
class Favs {
  Favs();

  late List<Fav> favs;
  
  factory Favs.fromJson(Map<String,dynamic> json) => _$FavsFromJson(json);
  Map<String, dynamic> toJson() => _$FavsToJson(this);
}
