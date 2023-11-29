

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:test_projrct/apiUrl.dart';

class signupModel {
  String? status;
  String? message;

  signupModel({this.status, this.message});

  signupModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    return data;
  }
}

class GetDioProvider1 {
  late Dio _dio;

  GetDioProvider1() {
    _dio = Dio();
  }
  Future<signupModel> apiRequest(FormData formData) async {
    try {
      Response response = await _dio.post(ApiConstants.loginUrl, data: formData);
      print("Get Response ----->  ${response}");
      print("Response---->>>>  ${response.data}");
      var resp = jsonDecode(response.data);
      signupModel datamodel = signupModel.fromJson(resp as Map<String, dynamic>);

      return datamodel;
    } catch (error) {
      print(error);
      return signupModel();
    }
  }
}