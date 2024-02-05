import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin:const  EdgeInsets.all(25),
      width: double.infinity,
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 216, 14, 0),
          borderRadius: BorderRadius.circular(5)),
      child: TextButton(
        onPressed: () {
          Get.toNamed('/splash');
        },
        child: const Text(
          "SIGN OUT",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}