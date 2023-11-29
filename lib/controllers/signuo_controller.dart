import 'dart:io';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

import '../model/signup_model.dart';

Future<String> downloadFile(String url, String savePath) async {
  dio.Response response = await dio.Dio().get(
    url,
    options: dio.Options(
      responseType: dio.ResponseType.bytes,
    ),
  );

  File file = File(savePath);
  await file.writeAsBytes(response.data);

  return savePath;
}



class SignupController extends GetxController {
  TextEditingController fName = TextEditingController();
  TextEditingController lName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phoneNo = TextEditingController();
  GetDioProvider1 provider1 = GetDioProvider1();


  void signUp(String imageUrl) async {
   {
      try {
        final appDocDir = await getApplicationDocumentsDirectory();

        String localImagePath = await downloadFile(
            imageUrl, '${appDocDir.path}/image.jpg');

        dio.FormData formData = dio.FormData.fromMap({
          "first_name": fName.text,
          "last_name": lName.text,
          "email": email.text,
          "phone": phoneNo.text,
          "user_image": await dio.MultipartFile.fromFile(
              localImagePath, filename: "user_image"),
        });
        signupModel response = await provider1.apiRequest(formData);

        if (response.status == "success") {

        } else {

        }
      } catch (error) {
        print(error);
      }
    }
  }
}
