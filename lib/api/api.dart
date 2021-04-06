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