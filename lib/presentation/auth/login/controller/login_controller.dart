import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:station/data/data_source/api_data_source.dart';
import 'package:station/data/models/login_model.dart';
import 'package:station/domain/entity/response_massage.dart';

class LoginController extends GetxController {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  bool _isloading = false;
  bool _visibility = false;

  void changeVisibility() {
    _visibility = !getVisibility;
    update();
  }

  void changeIsloading(bool status) {
    _isloading = status;
    update();
  }

  bool canSignUp() {
    if (_email.text.isNotEmpty && _password.text.isNotEmpty) {
      return true;
    }

    return false;
  }

  Future<ResponseMassageEntity> signUp() async {
    LoginModel loginModel =
        LoginModel(email: _email.text, password: _password.text);

    ResponseMassageEntity massage = await ApiDataSource.login(loginModel);

    return massage;
  }

  TextEditingController get getEmail => _email;
  TextEditingController get getPassword => _password;
  bool get getVisibility => _visibility;
  bool get getIsloading => _isloading;
}
