import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:total_energies/models/login_model.dart';

class LoginService {
  final String baseUrl = "http://92.204.139.204:4335/api/Customer/CustomerLogin";
 
  // Create (Register)
  Future<http.Response> loginuser(LoginModel user) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(user.toJson()),
    );

    return response ;
  }
}