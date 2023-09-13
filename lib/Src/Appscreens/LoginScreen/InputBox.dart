import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/Src/Appscreens/controllers/Logincontroller.dart';
import 'package:my_app/Src/Appscreens/controllers/Productcontroller.dart';

class InputBox extends StatelessWidget {
  final String inputText;
  final bool secureText;
  const InputBox(
      {super.key, required this.inputText, required this.secureText});

  @override
  Widget build(BuildContext context) {
    var userLoginController = Get.put(Logincontroller());

    return TextField(
      obscureText: secureText,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: "$inputText",
          //suffixIcon: secureText ? Icon(Icons.password) : null,
          prefixIcon: secureText
              ? Icon(Icons.password)
              : Icon(Icons.card_giftcard_rounded)),
      onChanged: (v) => secureText
          ? userLoginController.setUserpassword(v)
          : userLoginController.setUsername(v),
    );
  }
}
