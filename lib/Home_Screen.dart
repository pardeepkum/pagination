import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_projrct/controllers/menu_controllers.dart';
import 'package:test_projrct/signup_screen.dart';


class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final controller = Get.put(HomeController());


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,

      body:Obx(
        ()=> EasyRefresh(
          controller: controller.refreshController,
          onRefresh: () async {
            await controller.fetchUsers(refresh: true);
            controller.dispose();
          },
          onLoad: () async {
            await controller.fetchUsers(page: controller.offset + 1);
          },
          child: ListView.builder(
              itemCount: controller.images.length,
              itemBuilder: (context, index) {
                if (controller.images.isNotEmpty) {
                  return GestureDetector(
                    onTap: (){
                     Get.to(SignupScreen(),arguments:controller.images[index]?.xtImage ?? "" );
                    },
                    child: Container(
                        height: MediaQuery.of(context).size.height*.3,
                        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                        color: Colors.black,
                        child: CachedNetworkImage(
                          imageUrl: controller.images[index]?.xtImage ?? "",
                          placeholder: (context,_){
                            return const Center(child: CircularProgressIndicator());
                          },
                        )),
                  );
                } else {
                  return Container(
                    height: 200,
                    color: Colors.grey,
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
              },
            ),
        ),
      ),
    );
  }
}
