import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_projrct/Home_Screen.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp( MyApp());


}

class MyApp extends StatelessWidget {
   const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Test',
        home:  HomeScreen(),
    );
  }

  }

