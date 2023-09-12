import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/Src/Appscreens/Dashboard/Homepage.dart';
import 'package:my_app/Src/Appscreens/controllers/Productcontroller.dart';

class customebutton extends StatefulWidget {
  const customebutton({super.key});

  @override
  State<customebutton> createState() => _customebuttonState();
}

class _customebuttonState extends State<customebutton> {
  var userdataController = Get.put(UserLogindata());
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
        if (userdataController.Username == "" ||
            userdataController.Userpassword == "") {
          showAlertDialog(context);
        } else {
          //userdataController.login();
          Get.off(() => const DashBoard());
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
            : const Text(
                "Login",
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
      ),
    );
  }
}
