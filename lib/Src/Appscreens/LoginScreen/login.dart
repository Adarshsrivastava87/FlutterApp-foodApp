import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/Src/Appscreens/Dashboard/Homepage.dart';
import 'package:my_app/Src/Appscreens/LoginScreen/CustomeButton.dart';
import 'package:my_app/Src/Appscreens/LoginScreen/InputBox.dart';
import 'package:my_app/Src/Appscreens/LoginScreen/Signup.dart';
import 'package:my_app/Src/Appscreens/LoginScreen/Userloginstate.dart';
import 'package:my_app/Src/Appscreens/controllers/Productcontroller.dart';

class ApploginPage extends StatefulWidget {
  const ApploginPage({super.key});

  @override
  State<ApploginPage> createState() => _ApploginPageState();
}

class _ApploginPageState extends State<ApploginPage> {
  var userdataController = Get.put(UserLogindata());

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
            // TextField(
            //   decoration: InputDecoration(
            //       border: OutlineInputBorder(
            //           borderRadius: BorderRadius.circular(20.0)),
            //       hintText: "User name",
            //       prefixIcon: Icon(Icons.card_giftcard_rounded)),
            // ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: InputBox(inputText: "username", secureText: false),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: InputBox(
                inputText: "password",
                secureText: true,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Text("Don't Have Account ?"),
                ),
                InkWell(
                    onTap: () => Get.to(() => AppSignUpPage()),
                    child: const Text(
                      "click me ",
                      style: TextStyle(color: Colors.orange),
                    )),
              ],
            ),

            const customebutton(),
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
                        await userdataController.login();
                        if (userdataController.googleAccount.value == null) {
                          Get.to(() => ApploginPage());
                        } else {
                          print("${userdataController.googleAccount.value}");
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
