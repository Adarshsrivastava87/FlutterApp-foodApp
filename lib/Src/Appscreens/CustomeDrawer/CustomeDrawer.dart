import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/Src/Appscreens/LoginScreen/login.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      color: Colors.amber,
      child: Column(
        children: [
          const Text("ok"),
          const Expanded(child: Text("ok")),
          InkWell(
              onTap: () {
                Get.offAll(() => const ApploginPage());
              },
              child: const Padding(
                padding: EdgeInsets.all(80.0),
                child: Text("Log Out"),
              ))
        ],
      ),
    );
  }
}
