import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/Src/Appscreens/Dashboard/Homepage.dart';
import 'package:my_app/Src/Appscreens/LoginScreen/CustomeButton.dart';
import 'package:my_app/Src/Appscreens/LoginScreen/Loginpage/login.dart';
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
      body: Stack(
        children: [
          Container(
            //color: const Color.fromARGB(255, 240, 221, 164),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(50.0),
                  child: Image.network(
                    "https://img.freepik.com/free-vector/background-with-different-meals_23-2147871165.jpg?size=626&ext=jpg&ga=GA1.2.443638125.1658230036&semt=ais",
                    width: 200, // Specify the desired width
                    height: 200, // Specify the desired height
                    fit: BoxFit.cover,
                  ),
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
                  child: Obx(
                    () => TextField(
                      obscureText: SignupController.showpassword.value,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0)),
                          hintText: "New password",
                          suffixIcon: SignupController.showpassword.value
                              ? InkWell(
                                  onTap: () =>
                                      SignupController.setshowpassword(false),
                                  child: Icon(Icons.remove_red_eye))
                              : InkWell(
                                  onTap: () {
                                    SignupController.setshowpassword(true);
                                  },
                                  child: Icon(Icons.remove_done)),
                          prefixIcon: Icon(Icons.password)),
                      onChanged: (v) => SignupController.setnewUserpassword(v),
                    ),
                  ),
                ),

                const SizedBox(
                  height: 5,
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

                customebutton(
                  Button_name: "Signup",
                  callback: () => SignupController.signup(),
                ),
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
        ],
      ),
    );
  }
}
