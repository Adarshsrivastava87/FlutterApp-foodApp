import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/Src/Appscreens/Cart/Mycart.dart';
import 'package:my_app/Src/Appscreens/Dashboard/Homepage.dart';
import 'package:my_app/Src/Appscreens/LoginScreen/Loginpage/login.dart';
import 'package:my_app/Src/Appscreens/controllers/Productcontroller.dart';

class BottumTabBar extends StatelessWidget {
  const BottumTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(UserLogindata());
    return Container(
      height: 80,
      //color: Colors.orange,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
            splashColor: Color.fromARGB(255, 214, 231, 245),
            onTap: () {
              //print("Dashboard");
              Get.to(() => DashBoard());
            },
            child: Container(
              height: 40,
              width: 160,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Get.currentRoute == "/DashBoard"
                      ? Color.fromARGB(255, 244, 229, 207)
                      : Colors.orange,
                  borderRadius: BorderRadius.circular(20)),
              child: Text(
                "Got Rewards",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Get.currentRoute == "/DashBoard"
                        ? Colors.orange
                        : Colors.white),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              controller.TotalPrice();
              Get.to(() => MyCart());
            },
            child: SizedBox(
                width: 40,
                child: Center(
                    child: Stack(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Positioned(
                      top: 10,
                      left: 10,
                      child: Container(
                        height: 25,
                        width: 25,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 246, 230, 205),
                            border: Border.all(color: Colors.orange),
                            borderRadius: BorderRadius.circular(200)),
                        child: Center(
                            child: Obx(() => Text(
                                  "${controller.Cart.length}",
                                  style: TextStyle(
                                      color: Colors.orange,
                                      fontWeight: FontWeight.bold),
                                ))),
                      ),
                    ),
                    Positioned(top: 33, child: Icon(Icons.shopping_cart)),
                  ],
                ))),
          ),
          InkWell(
            onTap: () {
              Get.off(() => ApploginPage());
            },
            child: Container(
              height: 40,
              width: 160,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(20)),
              child: const Text(
                "Checkout",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}



// Container(
//                   width: 100,
//                   height: 110,
//                   child: Center(
//                       child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Icon(
//                         Icons.dashboard,
//                         color: Get.currentRoute == "/DashBoard"
//                             ? Color.fromARGB(255, 111, 220, 224)
//                             : Color.fromARGB(255, 255, 252, 174),
//                       ),
//                       Text("DashBoard")
//                     ],
//                   )
//                   )),