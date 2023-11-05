import 'dart:convert';

import 'package:myshop/models/index.dart';
import 'package:http/http.dart' as http;

class ServicesCart {
    // Future<Customers?>? customer;
    //192.168.234.48
  // static const String url = "http://192.168.234.48:8080/api/carts/cus/1";

  //get
  static Future<Carts> getCarts(num? id) async {
    try {
      final response = await http.get(Uri.parse("http://172.20.10.3:8080/api/carts/cus/${id}"));
      if (200 == response.statusCode) {
        return parseCart(response.body);
      } else {
        
        return Carts();
      }
    } catch (e) {
      print('Error ${e.toString()}');
      return Carts();
    }
  }

  // static Future<Favs> addFav(num cusId,num productId)async {
  //       final response = await http.post(
  //     Uri.parse('http://10.160.80.55:8080/api/favs'),
  //     headers: <String, String>{
  //       'Content-Type': 'application/json; charset=UTF-8',
  //     },
  //     body: jsonEncode(<String, dynamic>{
  //       'customer':{
  //             'id': cusId
  //         },
  //         'product':{
  //             'id': productId
  //         }
  //     }),
  //   );


  //   if (response.statusCode == 201) {
  //     return Favs.fromJson(jsonDecode(response.body));
  //   } else {
  //     throw Exception('Failed to create album.');
  //   }
  // }

  //Add
  static Future<Carts>  addCarts(num amount,num? customerId, num productId) async {
        final response = await http.post(
      Uri.parse('http://172.20.10.3:8080/api/carts'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
       body: jsonEncode(<String, dynamic>{
          'amount': amount,
          'customer':{
              'id': customerId
          },
          'product':{
              'id': productId
          }
      }),
    );

    if (response.statusCode == 201) {
      return Carts.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create Customer');
    }
  }

  //Update
  static Future<Carts> updateCarts(num amount,num id) async {
        final response = await http.put(
      Uri.parse('http://172.20.10.3:8080/api/carts/${id}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
       body: jsonEncode(<String, dynamic>{
          'amount': amount
      }),
    );


    if (response.statusCode == 201) {
      return Carts.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create album.');
    }
  }


  static Carts parseCart(String reponseBody) {
    final parsed = json.decode(reponseBody).cast<Map<String, dynamic>>();
    List<Cart> carts = parsed.map<Cart>((json) => Cart.fromJson(json)).toList();
    Carts c = Carts();
    c.carts = carts;
    return c;
  }
}