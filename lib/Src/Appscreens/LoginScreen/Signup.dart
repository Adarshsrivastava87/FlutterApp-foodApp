import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/Src/Appscreens/Dashboard/Homepage.dart';
import 'package:my_app/Src/Appscreens/LoginScreen/InputBox.dart';
import 'package:my_app/Src/Appscreens/LoginScreen/login.dart';
import 'package:my_app/Src/Appscreens/controllers/Signupcontroller.dart';

class AppSignUpPage extends StatefulWidget {
  const AppSignUpPage({super.key});

  @override
  State<AppSignUpPage> createState() => _AppSignUpPageState();
}

class _AppSignUpPageState extends State<AppSignUpPage> {
  var SignupController = Get.put(Signup());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        //color: const Color.fromARGB(255, 240, 221, 164),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 200,
              width: 200,
              child: Image.network(
                  "https://static.vecteezy.com/system/resources/thumbnails/019/900/322/small/happy-young-cute-illustration-face-profile-png.png"),
            ),

            const SizedBox(
              height: 10,
            ),
            Padding(
                padding: EdgeInsets.all(8.0),
                child: TextField(
                  // obscureText: secureText,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      hintText: "username or Email",
                      //suffixIcon: secureText ? Icon(Icons.password) : null,
                      prefixIcon: Icon(Icons.password)),
                  onChanged: (v) => SignupController.setnewUsername(v),
                )),
            Padding(
                padding: EdgeInsets.all(8.0),
                child: TextField(
                  // obscureText: secureText,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      hintText: "New password",
                      //suffixIcon: secureText ? Icon(Icons.password) : null,
                      prefixIcon: Icon(Icons.password)),
                  onChanged: (v) => SignupController.setnewUserpassword(v),
                )),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Text("Already Have Account ?"),
                ),
                InkWell(
                    onTap: () => Get.to(() => ApploginPage()),
                    child: const Text(
                      "click me ",
                      style: TextStyle(color: Colors.orange),
                    )),
              ],
            ),

            // const customebutton(),
            // Obx(() => Text("${userdataController.Username}")),
            const Text("---------- OR ----------"),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.facebook),
                  InkWell(
                      onTap: () async {
                        await SignupController.signup();
                        if (SignupController.googleAccount.value == null) {
                          Get.to(() => AppSignUpPage());
                        } else {
                          print("${SignupController.googleAccount.value}");
                          Get.to(() => DashBoard());
                        }
                      },
                      child: Icon(Icons.email_sharp)),
                  Icon(Icons.facebook),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
