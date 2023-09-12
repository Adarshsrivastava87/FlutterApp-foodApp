import 'dart:convert';

import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;

class Signup extends GetxController {
  var newusername = "".obs;
  var newuserpassword = "".obs;
  var _googlsignin = GoogleSignIn();
  var googleAccount = Rx<GoogleSignInAccount?>(null);

  setnewUserpassword(data) {
    print("password:$data");
    newuserpassword.value = data;
  }

  setnewUsername(data) {
    print("username:$data");
    newusername.value = data;
  }

  signup() async {
    //working on//
    print("calling aaaaaaaa:");
    // var url =
    //     'https://foodapp-b31b9-default-rtdb.asia-southeast1.firebasedatabase.app/Newusers.json';
    // http.post(
    //   Uri.parse(url),
    //   headers: <String, String>{
    //     'Content-Type': 'application/json; charset=UTF-8',
    //   },
    //   body:  ,
    // );
    return;
  }
}
