import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:station/data/data_source/api_data_source.dart';
import 'package:station/data/models/signup_model.dart';
import 'package:station/domain/entity/response_massage.dart';

class SignUpController extends GetxController {
  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _confirmPassword = TextEditingController();
  bool _visibility = false;
  bool _isloading = false;
  void changeVisibility() {
    _visibility = !getVisibility;
    update();
  }

  void changeIsloading(bool status) {
    _isloading = status;
    update();
  }

  bool canSignUp() {
    if (_name.text.isNotEmpty &&
        _email.text.isNotEmpty &&
        _password.text == _confirmPassword.text) {
      return true;
    }

    return false;
  }

  Future<ResponseMassageEntity> signUp() async {
    SignUpModel signUpModel = SignUpModel(
        name: _name.text, email: _email.text, password: _password.text);

    ResponseMassageEntity massage = await ApiDataSource.signUp(signUpModel);

    return massage;
  }

  TextEditingController get getName => _name;
  TextEditingController get getEmail => _email;
  TextEditingController get getPassword => _password;
  TextEditingController get getConfirmPassword => _confirmPassword;
  bool get getVisibility => _visibility;
  bool get getIsloading => _isloading;
}
