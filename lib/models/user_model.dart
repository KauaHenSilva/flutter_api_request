import 'package:flutter/material.dart';

class UserModel extends ChangeNotifier {
  final String id;
  final String email;
  final String age;

  UserModel({
    required this.id,
    required this.email,
    required this.age,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      email: json['email'],
      age: json['age'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'age': age,
    };
  }
}
