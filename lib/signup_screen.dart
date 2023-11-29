import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_projrct/controllers/signuo_controller.dart';


class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  final controller = Get.put(SignupController());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final dynamic argument = Get.arguments;

    if (argument != null && argument is String) {
      final String imageUrl = argument;

      return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Details Screen",
            style: TextStyle(
              fontSize: 15
            ),
            ),
            centerTitle: true,
            backgroundColor: Colors.grey,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Center(
                      child: CachedNetworkImage(
                        imageUrl: imageUrl,
                        placeholder: (context, _) {
                          return const CircularProgressIndicator();
                        },
                      ),
                    ),
                    const SizedBox(height: 10,),
                    TextFormField(
                      controller: controller.fName,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter first name';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(


                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue, width: 2.0),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                        ),

                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            )),
                          hintText: 'First Name'),
                    ),
                    const SizedBox(height: 10,),
                    TextFormField(
                      controller: controller.lName,
                      validator: (value) {
                        if(value == null || value.isEmpty){
                          return 'Please enter last name';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue, width: 2.0),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                          ),

                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10.0),
                              )),
                          hintText: 'Last Name'),
                    ),
                    const SizedBox(height: 10,),
                    TextFormField(
                      controller: controller.email,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        if (!RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$').hasMatch(value)) {
                          return 'Please enter a valid email address';
                        }
                        return null;
                      },

                      decoration: const InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue, width: 2.0),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                          ),

                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10.0),
                              )),
                          hintText: 'Email'),
                    ),
                    const SizedBox(height: 10,),
                    TextFormField(
                      controller: controller.phoneNo,

                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your phone number';
                        }
                        if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
                          return 'Please enter a valid 10 phone number';
                        }
                        return null;

                      },

                      decoration: const InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue, width: 2.0),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                          ),

                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10.0),
                              )),
                          hintText: 'Phone Number'),
                    ),
                    const SizedBox(height: 20,),
                    GestureDetector(
                      onTap: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          controller.signUp(imageUrl);
                          showSnackBar(context, 'data successfully fetched');
                          Get.back();

                        }

                      },
                      child: Container(
                        color: Colors.red,
                        height: 50,
                        width: double.infinity,
                        alignment: Alignment.center,
                        child: const Text("Submit", style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('Invalid argument type or argument is null.'),
        ),
      );
    }
  }
}



void showSnackBar(BuildContext context, String message) {
  final snackBar = SnackBar(
    backgroundColor: Colors.green,
    content: Text(message),
    duration: const Duration(seconds:7 ),

  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}