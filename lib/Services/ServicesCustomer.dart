import 'dart:convert';
import 'package:myshop/models/index.dart';
import 'package:http/http.dart' as http;

class ServicesCustomer {
    Future<Customers?>? customer;
  static const String url = "http://10.160.80.55:8080/api/customers";
  //Login
   static Future<Customers> loinCustomer(String email,String password) async {
        final response = await http.post(
      Uri.parse('http://10.160.80.55:8080/api/customers/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'email' : email,
        'password': password,
      }),
    );

    print("ress = ${response.body}");
    if (response.body == "1") {

      print("Login successful!");
      return Customers.fromJson(jsonDecode(response.body));

    } else {
      
      throw Exception('Invalid email or password. Please try again.');
    }
  }


  //getByemail
  static Future<Customer> gatByEmail(String email) async {
    final response = await http
        .get(Uri.parse('http://172.20.10.3:8080/api/customers/email/${email}'));

    if (response.statusCode == 200) {
      return Customer.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      throw Exception('Failed to load Customer');
    }
  }
  //   static Future<Customers> getCustomersByEmail(String email) async {
  //   try {
  //     final response = await http.get(Uri.parse("http://192.168.234.48:8080/api/customers/email/${email}"));
  //     if (200 == response.statusCode) {
  //       return parseCustomer(response.body);
  //     } else {
        
  //       return Customers();
  //     }
  //   } catch (e) {
  //     print('Error ${e.toString()}');
  //     return Customers();
  //   }
  // }
  // static Future<Customers> getCustomersByEmail(String email) async {
  //   try {
  //     final response = await http.get(Uri.parse("http://192.168.234.48:8080/api/customers/email/${email}"));
  //     if (200 == response.statusCode) {
  //       return parseUser(response.body);
  //     } else {
  //       return Customers();
  //     }
  //   } catch (e) {
  //     print('Error ${e.toString()}');
  //     return Customers();
  //   }
  // }

  //get
  // static Future<Customers> getCustomers() async {
  //   try {
  //     final response = await http.get(Uri.parse(url));
  //     if (200 == response.statusCode) {
  //       return parseCustomer(response.body);
  //     } else {
        
  //       return Customers();
  //     }
  //   } catch (e) {
  //     print('Error ${e.toString()}');
  //     return Customers();
  //   }
  // }

  //Login
  // static Future<Customers> login(String email , password) async {
    
  //   try{
      
  //     final response = await http.post(
  //       Uri.parse(url),
  //       body: {
  //         'email' : email,
  //         'password' : password
  //       }
  //     );

  //     if(response.statusCode == 200){
        
  //       var data = jsonDecode(response.body.toString());
  //       print(data['token']);
  //       print('Login successfully');

  //     }else {
  //       print('failed');
  //     }
  //   }catch(e){
  //     print(e.toString());
  //   }
  // }

  //Add
 static Future<Customers> postCustomers(String email,String password,String name, String address,String phoneNumber,) async {
        final response = await http.post(
      Uri.parse('http://172.20.10.3:8080/api/customers'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email' : email,
        'password': password,
        'name': name,
        'address': address,
        'phoneNumber': phoneNumber
      }),
    );


    if (response.statusCode == 201) {
      return Customers.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create album.');
    }

    // try {
    //   Map<String, dynamic> request = {
    //     'email' : email,
    //     'password': password,
    //     'name': name,
    //     'address': address,
    //     'phoneNumber': phoneNumber
    //   };
    //   final response = await http.post(Uri.parse(url),body: request);
    //   return Customers.fromJson(json.decode(response.body));

    // } catch (e) {
    //   print('Error ${e.toString()}');
    //   return Customers();
    // }
  }

  //Login 
  // Future<void> loginWithEmail() async{
  //   var headers = {'Content-Type': 'application/json'};
  //   try {
  //     var url = 
  //   } catch (e) {
      
  //   }
  // }


  // static Customers parseCustomer(String reponseBody) {
  //   final parsed = json.decode(reponseBody).cast<Map<String, dynamic>>();
  //   Customer customers = parsed.map<Customer>((json) => Customer.fromJson(json));
  //   Customers cus = Customers();
  //   cus.customers = customers;
  //   return cus;
  // }

  //   static Carts parseCart(String reponseBody) {
  //   final parsed = json.decode(reponseBody).cast<Map<String, dynamic>>();
  //   List<Cart> carts = parsed.map<Cart>((json) => Cart.fromJson(json)).toList();
  //   Carts c = Carts();
  //   c.carts = carts;
  //   return c;
  // }
}