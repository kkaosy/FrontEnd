// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favs.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Favs _$FavsFromJson(Map<String, dynamic> json) => Favs()
  ..favs = (json['favs'] as List<dynamic>)
      .map((e) => Fav.fromJson(e as Map<String, dynamic>))
      .toList();

Map<String, dynamic> _$FavsToJson(Favs instance) => <String, dynamic>{
      'favs': instance.favs,
    };
