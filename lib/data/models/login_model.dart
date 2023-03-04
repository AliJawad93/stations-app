import 'package:station/domain/entity/login.dart';

class LoginModel extends LoginEntity {
  LoginModel({required super.email, required super.password});

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'pass': password,
    };
  }
}
