import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user_model.dart';

class UserService {
  final String baseUrl = "http://92.204.139.204:4335/api/Customer/CustomerLogin";
  final String regUrl =
      "http://92.204.139.204:4335/api/Customer/CustomerRegisteration";

  // Create (Register)
  Future<http.Response> registerUser(UserModel user) async {
    final response = await http.post(
      Uri.parse(regUrl),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(user.toJson()),
    );

    return response ;
  }

  // Read (Get Users)
  Future<List<UserModel>> getUsers() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      List jsonResponse = jsonDecode(response.body);
      return jsonResponse.map((data) => UserModel.fromJson(data)).toList();
    } else {
      throw Exception("Failed to load users");
    }
  }

  // Update User
  Future<bool> updateUser(int id, UserModel user) async {
    final response = await http.put(
      Uri.parse("$baseUrl/$id"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(user.toJson()),
    );

    return response.statusCode == 200;
  }

  // Delete User
  Future<bool> deleteUser(int id) async {
    final response = await http.delete(Uri.parse("$baseUrl/$id"));

    return response.statusCode == 200;
  }
}
