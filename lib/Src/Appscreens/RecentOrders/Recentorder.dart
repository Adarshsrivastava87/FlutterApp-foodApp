import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/Src/Appscreens/Dashboard/orderReview.dart';
import 'package:my_app/Src/Appscreens/controllers/Productcontroller.dart';

class MyrecentOrders extends StatefulWidget {
  const MyrecentOrders({super.key});

  @override
  State<MyrecentOrders> createState() => _MyrecentOrdersState();
}

class _MyrecentOrdersState extends State<MyrecentOrders> {
  var user = Get.put(productController());

  printdata() {
    print("check:${user.ResposeLists[0].imgUrl}");
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 1000,
      child: Obx(
        () => ListView.builder(
            shrinkWrap: true,
            // physics: NeverScrollableScrollPhysics(),
            itemCount: user.ResposeLists.length,
            itemBuilder: (context, index) {
              return Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                margin: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image.network(
                          "${user.ResposeLists[index].imgUrl}",
                          height: 90.0,
                          width: 80.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 120,
                      width: 160,
                      //color: Colors.amber,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 18),
                            child: Text(
                              // "Burger & Milkshake",
                              user.ResposeLists[index].name,
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                          const Text(
                            "Shake with..",
                            style: TextStyle(fontSize: 14),
                          ),
                          InkWell(
                            onTap: () {
                              user.addItems(user.ResposeLists[index]);
                            },
                            child: const Padding(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: Text(
                                "Add To Cart+",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                        flex: 1,
                        child: SizedBox(
                          height: 120,
                          //color: Colors.blueGrey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    const Text(
                                      "Rs",
                                      style: TextStyle(
                                          color: Colors.orange,
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "${user.ResposeLists[index].price}",
                                      style: const TextStyle(
                                          color: Colors.orange,
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Get.to(() => ReviewOrder(
                                        Dispalydata: user.ResposeLists[index],
                                      ));
                                },
                                child: Container(
                                  height: 40,
                                  //width: 300,
                                  decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(14),
                                        bottomLeft: Radius.circular(14),
                                      ),
                                      color: Colors.orange),
                                  child: const Center(
                                    child: Text(
                                      "Express Checkout",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ))
                  ],
                ),
              );
            }),
      ),
    );
  }
}
