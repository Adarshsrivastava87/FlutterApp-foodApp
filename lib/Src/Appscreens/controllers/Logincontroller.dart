import 'dart:convert';

import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;

class Logincontroller extends GetxController {
  var username = "".obs;
  var userpassword = "".obs;
  var googleAccount = Rx<GoogleSignInAccount?>(null);

  setUserpassword(data) {
    print("password:$data");
    userpassword.value = data;
  }

  setUsername(data) {
    print("username:$data");
    username.value = data;
  }

  login() async {
    //googleAccount.value = await _googlsignin.signIn();
    List<Map> data = [];
    Map user = {
      "displayName": googleAccount.value?.displayName,
      "email": googleAccount.value?.email,
      "id": googleAccount.value?.id,
      "photoUrl": googleAccount.value?.photoUrl
    };
    data.add(user);

    print("Login function called ${googleAccount.value?.displayName}");
    var url =
        'https://foodapp-b31b9-default-rtdb.asia-southeast1.firebasedatabase.app/User.json';
    http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
  }
}
