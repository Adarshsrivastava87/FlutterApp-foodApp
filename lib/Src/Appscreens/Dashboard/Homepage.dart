import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/Src/Appscreens/BottumBar/Bottumbar.dart';
import 'package:my_app/Src/Appscreens/Category/Categorys.dart';
import 'package:my_app/Src/Appscreens/RecentOrders/Recentorder.dart';
import 'package:my_app/Src/Appscreens/controllers/Productcontroller.dart';
import 'package:my_app/Src/Appscreens/inspector.dart';
import 'package:my_app/main.dart';
import 'package:url_launcher/url_launcher.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  void initState() {
    super.initState();
    // Check for phone call support.
    canLaunchUrl(Uri(scheme: 'tel', path: '123')).then((bool result) {
      print("supprted =>$result");
    });
  }

  Widget build(BuildContext context) {
    var inspectcontroller = Get.put(Apiinspector());
    return Scaffold(
        // appBar: AppBar(
        //   toolbarHeight: 40,
        //   title: Text("User Dashboard"),
        //   backgroundColor: Colors.amber,
        //   elevation: 8,
        // ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  flex: 2,
                  child: Stack(key: parentKey, children: [
                    SizedBox(
                      width: Get.width,
                      height: 200,
                      child: Container(
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20.0),
                              bottomRight: Radius.circular(20.0),
                            ),
                            image: DecorationImage(
                                image: NetworkImage(
                                    "https://media.istockphoto.com/id/995038782/photo/heap-of-bread.jpg?s=612x612&w=0&k=20&c=UoAcNzbbDx2ybqoEZWBaxBdy73W2NN3km8MKSci0cHk="),
                                fit: BoxFit.cover)),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: _Card(),
                        ),
                      ],
                    ),
                    Container(child: inspector(inspectcontroller))
                  ])),
              MyCategory(),
              const Padding(
                padding: const EdgeInsets.all(8.0),
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Recent Orders",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const Expanded(flex: 2, child: MyrecentOrders())
            ]),
        // drawer: MyDrawer(),
        bottomNavigationBar: const BottumTabBar());
  }

  dynamic inspector(Apiinspector controller) {
    if (kDebugMode) {
      return Positioned(
        top: 190,
        left: 300,
        child: FloatingActionButton(
          onPressed: () {
            // mycontroller.showInspector();
            controller.navigateToInspector();
          },
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("check"),
              Text("Apis"),
            ],
          ),
        ),
      );
    } else {
      return null;
    }
  }

  Card _Card() {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      elevation: 4,
      child: SizedBox(
        height: 220,
        width: Get.width,
        child: Column(
          children: [
            SizedBox(
              height: 150,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Image.network(
                        "https://www.cnet.com/a/img/resize/69256d2623afcbaa911f08edc45fb2d3f6a8e172/hub/2023/02/03/afedd3ee-671d-4189-bf39-4f312248fb27/gettyimages-1042132904.jpg?auto=webp&fit=crop&height=675&width=1200",
                        height: 100.0,
                        width: 100.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Container(
                    height: 100,
                    width: 180,
                    //color: Colors.blue,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            "Hippo Shakes",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Row(
                          children: [
                            InkWell(
                              onTap: () => print("Map"),
                              child: const Icon(Icons.location_on_outlined,
                                  color: Colors.amber),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            const Text(
                              "180, Orchard Street",
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            InkWell(
                                onTap: () async {
                                  Uri launchUri = Uri(
                                    scheme: 'tel',
                                    path: "12345",
                                  );

                                  if (!await launchUrl(launchUri)) {
                                    print("error");
                                  } else {
                                    await launchUrl(launchUri);
                                    print("calling......");
                                  }
                                },
                                child: Icon(Icons.phone, color: Colors.amber)),
                            const SizedBox(
                              width: 8,
                            ),
                            Text("(646) 549-0555"),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 50,
              width: 290,
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 249, 224, 188),
                  borderRadius: BorderRadius.all(Radius.circular(18))),
              child: const Center(
                  child: Text(
                "SKIP THE LINE, REORDER YOUR FAVOURITES",
                style: TextStyle(
                    fontSize: 12,
                    color: Colors.orange,
                    fontWeight: FontWeight.bold),
              )),
            ),
          ],
        ),
      ),
    );
  }
}
