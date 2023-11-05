import 'dart:convert';

import 'package:myshop/models/index.dart';
import 'package:http/http.dart' as http;

class ServicesProduct {
    // Future<Customers?>? customer;
  static const String url = "http://172.20.10.3:8080/api/products";

  //get
  static Future<Products> getProducts() async {
    try {
      final response = await http.get(Uri.parse(url));
      if (200 == response.statusCode) {
        return parseUser(response.body);
      } else {
        
        return Products();
      }
    } catch (e) {
      print('Error ${e.toString()}');
      return Products();
    }
  }

  //update
  //  static Future<Products> updateCarts(String name,String picture,num price,String size,String color,String description,num amount, String type,String rating,num id) async {
  //       final response = await http.put(
  //     Uri.parse('http://172.20.10.3:8080/api/products/${id}'),
  //     headers: <String, String>{
  //       'Content-Type': 'application/json; charset=UTF-8',
  //     },
  //      body: jsonEncode(<String, dynamic>{
  //         'name': name,
  //         'picture': picture,
  //         'price': price,
  //         'size': size,
  //         'color': color,
  //         'description': description,
  //         'amount': amount,
  //         'type': type,
  //         'rating': rating,
  //     }),
  //   );
  //   if (response.statusCode == 201) {
  //     return Products.fromJson(jsonDecode(response.body));
  //   } else {
  //     throw Exception('Failed to create album.');
  //   }
  // }


  //addproduct
   static Future<Products> postProducts(String name,String picture,num price,String size,String color,String description,num amount, String type,String rating) async {
        final response = await http.post(
      Uri.parse('http://172.20.10.3:8080/api/products'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'name' : name,
        'picture': picture,
        'price': price,
        'size': size,
        'color': color,
        'description': description,
        'amount': amount,
        'type': type,
        'rating': rating
      }),
    );


    if (response.statusCode == 201) {
      return Products.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create album.');
    }
  }

  //edit
  static Future<void> updateProduct(String name,String picture,num price,String size,String color,String description,num amount, String type,String rating,num id) async {
  final String apiUrl = 'http://172.20.10.3:8080/products/${id}'; 
  final Map<String, dynamic> requestData = {
        'name' : name,
        'picture': picture,
        'price': price,
        'size': size,
        'color': color,
        'description': description,
        'amount': amount,
        'type': type,
        'rating': rating
  };

  final response = await http.put(
    Uri.parse(apiUrl),
    headers: <String, String>{
      'Content-Type': 'application/json', // Adjust the content type if needed
    },
    body: jsonEncode(requestData),
  );

  if (response.statusCode == 200) {
    print("PUT request successful");
    // You can handle the response, e.g., parse JSON if the server responds with data.
  } else {
    print("Handle errors, e.g., connection issues or non-200 status codes.");
  }
}

//delete
static Future<Product> deleteProduct(String id) async {
  final http.Response response = await http.delete(
    Uri.parse('http://172.20.10.3:8080/api/products/${id}'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON. After deleting,
    // you'll get an empty JSON `{}` response.
    // Don't return `null`, otherwise `snapshot.hasData`
    // will always return false on `FutureBuilder`.
    return Product.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    // If the server did not return a "200 OK response",
    // then throw an exception.
    throw Exception('Failed to delete album.');
  }
}





  //Add
  // static Future<Customers> postCustomers(String email,String password,String name, String address,String phoneNumber,) async {
  //     final response = await http.post(
  //   Uri.parse('http://192.168.234.37:8080/api/customers'),
  //   headers: <String, String>{
  //     'Content-Type': 'application/json; charset=UTF-8',
  //   },
  //   body: jsonEncode(<String, String>{
  //     'email' : email,
  //     'password': password,
  //     'name': name,
  //     'address': address,
  //     'phoneNumber': phoneNumber
  //   }),
  // );

  // if (response.statusCode == 201) {
  //   return Customers.fromJson(jsonDecode(response.body));
  // } else {
  //   throw Exception('Failed to create album.');
  // }
  //   try {
  //     Map<String, dynamic> request = {
  //       'email' : email,
  //       'password': password,
  //       'name': name,
  //       'address': address,
  //       'phoneNumber': phoneNumber
  //     };
  //     final response = await http.post(Uri.parse(url),body: request);
  //     return Customers.fromJson(json.decode(response.body));

  //   } catch (e) {
  //     print('Error ${e.toString()}');
  //     return Customers();
  //   }
  // }

  // static Future<Carts> addCarts(int amount,int customerId, int productId) async {
  //       final response = await http.post(
  //     Uri.parse('http://192.168.234.193:8080/api/carts'),
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


  static Products parseUser(String reponseBody) {
    final parsed = json.decode(reponseBody).cast<Map<String, dynamic>>();
    List<Product> products = parsed.map<Product>((json) => Product.fromJson(json)).toList();
    Products p = Products();
    p.products = products;
    return p;
  }
}