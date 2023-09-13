import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/Src/Appscreens/controllers/Productcontroller.dart';

class MyCart extends StatefulWidget {
  MyCart({super.key});

  @override
  State<MyCart> createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  var controller = Get.put(productController());

  @override
  Widget build(BuildContext context) {
    // var controller = Get.put(productController());
    return Obx(
      () => Scaffold(
          appBar: AppBar(
            leading: Padding(
              padding: const EdgeInsets.all(6.0),
              child: InkWell(
                onTap: () => Get.back(),
                child: Container(
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 250, 234, 210),
                      borderRadius: BorderRadius.circular(100)),
                  child: const Icon(
                    Icons.turn_slight_left_sharp,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            backgroundColor: Color.fromARGB(255, 250, 249, 249),
            elevation: 0,
            title: const Text(
              "My cart",
              style: TextStyle(color: Colors.black),
            ),
            actions: [
              (controller.Cart.isEmpty
                  ? Text("")
                  : Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: InkWell(
                        onTap: () {
                          if (controller.Cart.isEmpty) {
                            return;
                          } else {
                            controller.Cart.clear();
                            controller.totalPrice();
                            Get.back();
                          }
                        },
                        child: Container(
                          height: 20,
                          width: 80,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 250, 234, 210),
                              borderRadius: BorderRadius.circular(100)),
                          child: const Icon(
                            Icons.delete,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ))
            ],
          ),
          body: (controller.Cart.isNotEmpty
              ? productlist()
              : Center(
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Cart is Empty!",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 18),
                        ),
                        Image.network(
                            "https://cdni.iconscout.com/illustration/premium/thumb/empty-cart-2130356-1800917.png"),
                      ],
                    ),
                  ),
                )),
          bottomNavigationBar: (controller.Cart.isNotEmpty
              ? Bottumbarforcart()
              : const Text(""))),
    );
  }

  ListView productlist() {
    return ListView.builder(
        itemCount: controller.Cart.length,
        itemBuilder: (context, index) {
          return Container(
              margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              height: 120,
              width: Get.width,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 250, 234, 210),
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                children: [
                  Expanded(
                      flex: 3,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15)),
                          height: 100,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.network(
                              controller.Cart[index].imgUrl,
                            ),
                          ),
                        ),
                      )),
                  Expanded(
                      flex: 4,
                      child: Container(
                        //color: const Color.fromARGB(255, 191, 101, 68),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              child: Text(
                                "${controller.Cart[index].name}",
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              child: Text(
                                "Rs${controller.Cart[index].Price}",
                                style: const TextStyle(
                                    color: Colors.orange,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: InkWell(
                                      onTap: () {
                                        controller.incAndDecQuantity(
                                            "Decrement", index);
                                        setState(() {});
                                      },
                                      child: Container(
                                          height: 25,
                                          width: 25,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: const Icon(
                                            Icons.remove,
                                            size: 18,
                                          ))),
                                ),
                                Text(
                                  "${controller.Cart[index].quantity}",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: InkWell(
                                      onTap: () {
                                        controller.incAndDecQuantity(
                                            "Increment", index);
                                        setState(() {});
                                      },
                                      child: Container(
                                          height: 25,
                                          width: 25,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: const Icon(
                                            Icons.add,
                                            size: 18,
                                          ))),
                                ),
                              ],
                            )
                          ],
                        ),
                      )),
                  Expanded(
                      flex: 1,
                      child: InkWell(
                        onTap: () {
                          controller.removedata(index);
                        },
                        child: Container(
                          height: 50,
                          width: 10,
                          decoration: const BoxDecoration(
                              // color: Colors.white,
                              color: Color.fromARGB(255, 250, 247, 244),
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(15),
                                  topLeft: Radius.circular(15))),
                          child: const Padding(
                            padding: EdgeInsets.only(left: 15),
                            child: Icon(Icons.delete),
                          ),
                        ),
                      ))
                ],
              ));
        });
  }

  Container Bottumbarforcart() {
    return Container(
      height: 130,
      //color: Colors.blue,
      child: Row(
        children: [
          Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  height: 70,
                  decoration: BoxDecoration(
                      //color: Colors.cyanAccent,
                      border: Border.all(color: Colors.orange),
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Text(
                          "Total Price",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.orange),
                        ),
                      ),
                      Text(
                        "Rs${controller.Total}",
                        style: const TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              )),
          Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: InkWell(
                  onTap: () {
                    if (controller.Cart.length <= 0) {
                      Alert_Emptycart();
                    } else {
                      Alert_Cart();
                    }

                    //controller.BuyProduct();
                  },
                  child: Container(
                    height: 70,
                    decoration: BoxDecoration(
                        //color: Color.fromARGB(255, 241, 201, 146),
                        color: Color.fromARGB(255, 82, 79, 55),
                        border: Border.all(
                          color: const Color.fromARGB(255, 55, 82, 56),
                        ),
                        borderRadius: BorderRadius.circular(10)),
                    child: const Center(
                        child: Text(
                      "Buy Now",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    )),
                  ),
                ),
              )),
        ],
      ),
    );
  }

  Alert_Emptycart() {
    Get.defaultDialog(
      title: "Cart is Empty!",
      content: SizedBox(
        height: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Oooops! cart is Empty"),
            const Text("Add item to make order!"),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    elevation: 1,
                    foregroundColor: const Color.fromARGB(255, 250, 234, 210),
                    backgroundColor: const Color.fromARGB(255, 250, 234, 210),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                onPressed: () => Get.back(),
                child: const Text(
                  "Ok",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w500),
                )),
          ],
        ),
      ),
    );
  }

  Alert_Cart() {
    Get.defaultDialog(
      title: "Thankyou for order!",
      content: SizedBox(
        height: 150,
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Row(
                children: [
                  const Text("Total Price :"),
                  Text("${controller.Total}Rs"),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 1,
                        foregroundColor:
                            const Color.fromARGB(255, 250, 234, 210),
                        backgroundColor:
                            const Color.fromARGB(255, 250, 234, 210),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    onPressed: () => Get.back(),
                    child: const Text(
                      "Cancle",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w500),
                    )),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 1,
                        foregroundColor:
                            const Color.fromARGB(255, 250, 234, 210),
                        backgroundColor:
                            const Color.fromARGB(255, 250, 234, 210),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    onPressed: () {
                      controller.buyProduct();
                      Get.back();
                    },
                    child: const Text(
                      "Order",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w500),
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
