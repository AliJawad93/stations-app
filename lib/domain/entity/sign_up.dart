import 'dart:convert';

import 'package:station/domain/entity/login.dart';

class SignUpEntity extends LoginEntity {
  final String name;
  const SignUpEntity({
    required this.name,
    required super.email,
    required super.password,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SignUpEntity &&
        other.name == name &&
        other.email == super.email &&
        other.password == super.password;
  }

  @override
  int get hashCode =>
      name.hashCode ^ super.email.hashCode ^ super.password.hashCode;
}
