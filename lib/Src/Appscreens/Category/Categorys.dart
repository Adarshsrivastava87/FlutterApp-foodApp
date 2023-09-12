import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/Src/Appscreens/Details/detailpage.dart';
import 'package:my_app/Src/Appscreens/LoginScreen/Userloginstate.dart';
import 'package:my_app/Src/Appscreens/controllers/Productcontroller.dart';

// ignore: must_be_immutable
class MyCategory extends StatelessWidget {
  MyCategory({super.key});

  var controller = Get.put(UserLogindata());
  @override
  Widget build(BuildContext context) {
    // ignore: non_constant_identifier_names
    MoveTo(details) {
      Get.to(() => OrderDetailView(), arguments: details);
    }

    return Obx(
      () => Container(
        height: 120,
        //color: Colors.green,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: controller.ResposeLists.length,
            itemBuilder: (context, index) {
              return Card(
                color: index == 0
                    ? Colors.orange
                    : Color.fromARGB(255, 255, 254, 252),
                margin: EdgeInsets.all(10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
                child: InkWell(
                  //highlightColor: Colors.amber,
                  splashColor: Color.fromARGB(255, 214, 231, 245),
                  onTap: () => MoveTo(controller.ResposeLists[index]),
                  child: Container(
                    width: 100,
                    //color: Colors.blue,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Image.network(
                              controller.ResposeLists[index].imgUrl,
                              height: 50.0,
                              width: 50.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.all(7.0),
                            child: Text(
                              "${controller.ResposeLists[index].name}",
                              style: TextStyle(
                                color: index == 0 ? Colors.white : Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
