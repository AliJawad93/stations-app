import 'package:station/domain/entity/response_massage.dart';

class ResponseMassageModel extends ResponseMassageEntity {
  ResponseMassageModel({required super.massage});
  factory ResponseMassageModel.fromMap(Map<String, dynamic> map) {
    return ResponseMassageModel(
      massage: map['message'] ?? '',
    );
  }
}
