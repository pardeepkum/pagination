import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_projrct/model/login_model.dart';
import 'package:test_projrct/model/signup_model.dart';

class HomeController extends GetxController {
  TextEditingController fName = TextEditingController();
  TextEditingController lName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phoneNo = TextEditingController();
  int offset = 0;
  bool isLoading = false;
  EasyRefreshController refreshController = EasyRefreshController();

  RxList<Images?> images = <Images?>[].obs;
  //  late ApiConstants _authApiProvider;

  Dio dio = Dio();
  GetDioProvider provider = GetDioProvider();
  GetDioProvider1 provider1 = GetDioProvider1();
  @override
  void onInit() {
    // _authApiProvider = ApiConstants();

    fetchUsers();
    super.onInit();
  }
  Future<void> fetchUsers({bool refresh = false, int page = 1}) async {
    if (!isLoading) {
      isLoading = true;
    }

    try {
      Map<String, dynamic> body = {
        "user_id": "108",
        "offset": page,
      };

      loginModel response = await provider.getRequest(body);

      if (response.images != null && response.images!.isNotEmpty) {
        if (refresh) {
          images.clear();
        }
        images.addAll(response.images!);
        offset = page;
        print(offset);
      }

      print(images);
    } catch (error) {
      print(error);
    } finally {
      if (refresh) {
       refreshController.finishRefresh();
      } else {
        refreshController.finishLoad();
      }
      await Future.delayed(const Duration(milliseconds: 100));
      isLoading = false;
    }
  }
    @override
  void dispose() {
  refreshController.dispose();
    super.dispose();
  }
}

void showSnackBar(BuildContext context, String message) {
  final snackBar = SnackBar(
    backgroundColor: Colors.green,
    content: Text(message),
    duration: const Duration(seconds: 7),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
