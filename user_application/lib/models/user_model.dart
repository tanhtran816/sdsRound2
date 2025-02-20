import 'dart:convert';

class User {
  final int? id;
  final String firstName;
  final String lastName;
  final String email;
  final String phoneNumber;
  final String zipCode;

  User({
    this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.zipCode,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as int,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      email: json['email'] as String,
      phoneNumber: json['phoneNumber'] as String,
      zipCode: json['zipCode'].toString(),
    );
  }


  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'phoneNumber': phoneNumber,
      'zipCode': zipCode,
    };
  }

  static List<User> fromJsonList(String jsonString) {
    Iterable list = jsonDecode(jsonString);
    return list.map((item) => User.fromJson(item)).toList();
  }
}
