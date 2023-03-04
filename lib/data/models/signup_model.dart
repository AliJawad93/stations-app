import 'package:station/domain/entity/sign_up.dart';

class SignUpModel extends SignUpEntity {
  SignUpModel(
      {required super.name, required super.email, required super.password});
  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'pass': password,
      'name': name,
    };
  }
}
