import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user_model.dart';

class UserService {
  static const String ALL_USER = "http://127.0.0.1:8080/allUser";
  static const String USER_API = "http://127.0.0.1:8080/user";

  Future<List<User>> fetchUsers() async {
    final response = await http.get(Uri.parse(ALL_USER));

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      print(data);
      return data.map((user) => User.fromJson(user)).toList();
    } else {
      throw Exception("Failed to load users");
    }
  }

  Future<User> updateUser(User user) async {
    final response = await http.patch(
      Uri.parse(USER_API),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(user.toJson()),
    );

    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to update user");
    }
  }

  Future<String> deleteUser(User user) async {
    final response = await http.delete(
      Uri.parse(USER_API),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(user.toJson()),
    );

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception("Failed to delete user");
    }
  }

  Future<User> createUser(User user) async {
    final response = await http.post(
      Uri.parse(USER_API),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(user.toJson()),
    );

    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to create user");
    }
  }
}
