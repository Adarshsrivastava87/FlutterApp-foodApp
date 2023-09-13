import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/Src/Appscreens/Dashboard/Homepage.dart';
import 'package:my_app/Src/Appscreens/controllers/Logincontroller.dart';
import 'package:my_app/Src/Appscreens/controllers/Productcontroller.dart';
import 'package:my_app/Src/Appscreens/controllers/Signupcontroller.dart';

class customebutton extends StatefulWidget {
  String Button_name;
  final Function callback;
  customebutton({super.key, required this.Button_name, required this.callback});

  @override
  State<customebutton> createState() => _customebuttonState();
}

class _customebuttonState extends State<customebutton> {
  //var userdataController = Get.put(productController());
  var SignupController = Get.put(Signup());
  var userLoginController = Get.put(Logincontroller());
  bool change = false;
//cusstome Alertbox
  showAlertDialog(BuildContext context) {
    Widget okButton = InkWell(
      child: Container(
          height: 50,
          width: 100,
          decoration: BoxDecoration(
              color: Colors.amber, borderRadius: BorderRadius.circular(12.0)),
          child: const Center(child: Text("OK"))),
      onTap: () {
        setState(() {
          change = false;
        });
        Navigator.pop(context, true);
      },
    );
    AlertDialog alert = AlertDialog(
      title: const Text(
        "Invalid",
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      content: const Text("Please Provide Vailid Email and Password."),
      actions: [
        okButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        print("ok");
        setState(() {
          change = true;
        });
        await Future.delayed(const Duration(seconds: 2));
        if (widget.Button_name == "Signup") {
          /// Validation for Signup
          validationForsignup();
        } else {
          /// validation for Login
          validationForlogin();
        }
      },
      child: AnimatedContainer(
        duration: const Duration(seconds: 1),
        width: change ? 50 : 290,
        height: 50,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 246, 205, 83),
            borderRadius: BorderRadius.circular(change ? 30 : 8)),
        child: change
            ? const Icon(
                Icons.done,
                color: Colors.black,
              )
            : Text(
                widget.Button_name,
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
      ),
    );
  }

  validationForsignup() {
    if (SignupController.newusername == "" ||
        SignupController.newuserpassword == "") {
      showAlertDialog(context);
    } else {
      widget.callback();
      Get.off(() => const DashBoard());
    }
  }

  validationForlogin() {
    if (userLoginController.username == "" ||
        userLoginController.userpassword == "") {
      showAlertDialog(context);
    } else {
      widget.callback();
      Get.off(() => const DashBoard());
    }
  }
}
