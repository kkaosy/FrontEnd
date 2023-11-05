import 'dart:convert';

import 'package:myshop/models/index.dart';
import 'package:http/http.dart' as http;

class ServicesFav {

  //get
  static Future<Favs> getFavsByIdCus(num? id) async {
    try {
      final response = await http.get(Uri.parse("http://172.20.10.3:8080/api/favs/cus/${id}"));
      if (200 == response.statusCode) {
        return parseFav(response.body);
      } else {
        
        return Favs();
      }
    } catch (e) {
      print('Error ${e.toString()}');
      return Favs();
    }
  }


  //add
  static Future<Favs> addFav(num cusId,num productId)async {
        final response = await http.post(
      Uri.parse('http://172.20.10.3:8080/api/favs'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'customer':{
              'id': cusId
          },
          'product':{
              'id': productId
          }
      }),
    );


    if (response.statusCode == 201) {
      return Favs.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create album.');
    }
  }

  //delete
 static Future<Favs> deleteFav(num id) async {
  final http.Response response = await http.delete(
    
    Uri.parse('http://172.20.10.3:8080/api//favs/${id}}'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );

  if (response.statusCode == 200) {
    return Favs.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    throw Exception('Failed to delete album.');
  }
}

  //Add
  // static  addCarts(num amount,num? customerId, num productId) async {
  //       final response = await http.post(
  //     Uri.parse('http://192.168.234.48:8080/api/carts'),
  //     headers: <String, String>{
  //       'Content-Type': 'application/json; charset=UTF-8',
  //     },
  //      body: jsonEncode(<String, dynamic>{
  //         'amount': amount,
  //         'customer':{
  //             'id': customerId
  //         },
  //         'product':{
  //             'id': productId
  //         }
  //     }),
  //   );

  //   if (response.statusCode == 201) {
  //     return Carts.fromJson(jsonDecode(response.body));
  //   } else {
  //     throw Exception('Failed to create album.');
  //   }
  // }

  // //Update
  // static Future<Carts> updateCarts(num amount,num id) async {
  //       final response = await http.put(
  //     Uri.parse('http://192.168.234.48:8080/api/carts/${id}'),
  //     headers: <String, String>{
  //       'Content-Type': 'application/json; charset=UTF-8',
  //     },
  //      body: jsonEncode(<String, dynamic>{
  //         'amount': amount
  //     }),
  //   );


  //   if (response.statusCode == 201) {
  //     return Carts.fromJson(jsonDecode(response.body));
  //   } else {
  //     throw Exception('Failed to create album.');
  //   }
  // }


  static Favs parseFav(String reponseBody) {
    final parsed = json.decode(reponseBody).cast<Map<String, dynamic>>();
    List<Fav> favs = parsed.map<Fav>((json) => Fav.fromJson(json)).toList();
    Favs f = Favs();
    f.favs = favs;
    return f;
  }
}