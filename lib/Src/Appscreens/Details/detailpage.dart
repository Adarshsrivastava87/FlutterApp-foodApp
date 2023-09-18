import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/Src/Appscreens/BottumBar/Bottumbar.dart';
import 'package:my_app/Src/Appscreens/controllers/Productcontroller.dart';
import 'package:my_app/Src/Appscreens/controllers/categoryController.dart';

// ignore: must_be_immutable
class OrderDetailView extends StatefulWidget {
  OrderDetailView({super.key});

  @override
  State<OrderDetailView> createState() => _OrderDetailViewState();
}

class _OrderDetailViewState extends State<OrderDetailView> {
  var data = Get.arguments;

  var Category = Get.put(categoryController());
  var Cart = Get.put(productController());
  @override
  Widget build(BuildContext context) {
    //print(Category.CategoryData[9].name);
    return Scaffold(
      appBar: AppBar(
          centerTitle: false,
          title: Text(
            "${data.name}",
            style: const TextStyle(fontWeight: FontWeight.bold),
          )),
      body: (Category.CategoryData.length == 0
          ? Center(
              child: InkWell(
                  onTap: () => setState(() {}),
                  child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 249, 234, 189),
                          borderRadius: BorderRadius.circular(100)),
                      child: const Center(child: Text("Refresh")))))
          : productlist()),
      bottomNavigationBar: BottumTabBar(),
    );
  }

  Container productlist() {
    return Container(
        padding: EdgeInsets.all(12.0),
        child: GridView.builder(
          itemCount: Category.CategoryData.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 4.0, mainAxisSpacing: 4.0),
          itemBuilder: (BuildContext context, int index) {
            return Container(
                margin: EdgeInsets.all(4),
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 250, 234, 210),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    Expanded(
                        flex: 4,
                        child: Container(
                          //color: Colors.amber,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 3,
                                child: Container(
                                  height: 10,
                                  //color: Colors.blue,
                                  child: Image.network(
                                    Category.CategoryData[index].imgUrl,
                                    width: Get.width,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  height: 10,
                                  //color: Color.fromARGB(255, 133, 151, 167),
                                  child: Text(
                                    "${Category.CategoryData[index].name}",
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  height: 10,
                                  //color: Colors.blue,
                                  child: Text(
                                    "Rs:${Category.CategoryData[index].price}",
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.orange),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )),
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.fromLTRB(40, 0, 40, 4),
                      child: InkWell(
                        onTap: () {
                          Cart.addItems(Category.CategoryData[index]);
                        },
                        child: Container(
                          decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 241, 217, 185),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: const Center(
                              child: Text(
                            "Add to Cart+",
                            style: TextStyle(fontWeight: FontWeight.w500),
                          )),
                        ),
                      ),
                    )),
                  ],
                ));
          },
        ));
  }
}
