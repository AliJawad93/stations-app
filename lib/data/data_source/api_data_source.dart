import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:station/core/utils/app_api.dart';
import 'package:station/data/models/login_model.dart';
import 'package:station/data/models/massage_model.dart';
import 'package:station/data/models/offer_model.dart';
import 'package:station/data/models/signup_model.dart';
import 'package:station/data/models/station_model.dart';

class ApiDataSource {
  static Future<List<StationModel>> getStationsInfo() async {
    try {
      var response = await Dio().post(AppApi.stationsInfo);
      List<Map<String, dynamic>> data =
          List<Map<String, dynamic>>.from(json.decode(response.data));
      List<StationModel> stationModels = data.map((map) {
        return StationModel.fromMap(map);
      }).toList();
      return stationModels;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  static Future<List<OfferModel>> getOfferStationById(String id) async {
    var response = await Dio().post(AppApi.stationOffer, data: {"id_sta": id});
    List<Map<String, dynamic>> data =
        List<Map<String, dynamic>>.from(json.decode(response.data));

    List<OfferModel> offerModel = data.map((map) {
      return OfferModel.fromMap(map);
    }).toList();
    return offerModel;
  }

  static Future<ResponseMassageModel> login(LoginModel loginModel) async {
    var response = await Dio().post(AppApi.login, data: loginModel.toMap());
    Map<String, dynamic> data =
        Map<String, dynamic>.from(json.decode(response.data));
    ResponseMassageModel massage = ResponseMassageModel.fromMap(data);
    return massage;
  }

  static Future<ResponseMassageModel> signUp(SignUpModel signUpModel) async {
    var response = await Dio().post(
      AppApi.signUP,
      data: signUpModel.toMap(),
    );
    Map<String, dynamic> data =
        Map<String, dynamic>.from(json.decode(response.data));
    ResponseMassageModel massage = ResponseMassageModel.fromMap(data);
    return massage;
  }
}
