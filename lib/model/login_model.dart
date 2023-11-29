
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:test_projrct/apiUrl.dart';






class loginModel {
  String? status;
  List<Images>? images;

  loginModel({this.status, this.images});

  loginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(new Images.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Images {
  String? xtImage;
  String? id;

  Images({this.xtImage, this.id});

  Images.fromJson(Map<String, dynamic> json) {
    xtImage = json['xt_image'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['xt_image'] = this.xtImage;
    data['id'] = this.id;
    return data;
  }
}


class GetDioProvider {
  late Dio _dio;

  GetDioProvider() {
    _dio = Dio();
  }

  Future<loginModel> getRequest(Map<String, dynamic> map) async {
    try {
      Response response =
          await _dio.post(ApiConstants.baseUrl,
              data: FormData.fromMap(map));
      print("Get Response ----->  ${response}");
      print("Response---->>>>  ${response.data}");
      var resp = jsonDecode(response.data);
      loginModel datamodel = loginModel.fromJson(resp as Map<String,dynamic>);

      return datamodel;
    } catch (error) {
      print(error);
      return loginModel();
    }
  }


}
