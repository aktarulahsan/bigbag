import 'dart:io';

import 'package:bigbag/model/categoryModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

final String BASE_URL = 'https://dokan-api.amwork.xyz/api/';

Future loginUser(String email, String password) async {
  String url = BASE_URL + 'customer/login';
  final response = await http.post(url,
      headers: {"Accept": "Application/json"},
      body: {'email': email, 'password': password, 'domain_id': "1"});
  print(response.body);
  var convertedDatatojson = jsonDecode(response.body);
  print(convertedDatatojson);
  return convertedDatatojson;
}

Future<CategoryModel> category()async{

try{

  var uri = Uri.parse(BASE_URL+'get-homepage-data');
  uri = uri.replace(queryParameters: <String, String>{'domain_id': '2','menu_category': "8" });

  final response = await http.get(
    uri,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
  if(response.statusCode == 200){

    final CategoryModel a= categoryModelFromJson(response.body);
    // var ps = a["get_menu_category"];
    // final CategoryModel model = categoryModelFromJson(a["get_menu_category"]);
// print( a["get_menu_category"].toString());
    // Future<List<CategoryModel>> model = a["get_menu_category"];
    // return a["get_menu_category"].toString();
    return a;
  }
}catch(e){
  print(e);
}

}



//sent data to server for create new customer
Future registerNewUser(String name, String email, String password) async {
  String url=BASE_URL+'customer/register';
  final response = await http.post(url,
        headers: {'Accept': 'Application/json'},
        body: {'name':name, 'email':email, 'password': password, 'domain_id':'1'}
  );

   return jsonDecode(response.body);
  

}
