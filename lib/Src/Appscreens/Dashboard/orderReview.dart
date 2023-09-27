import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class ReviewOrder extends StatelessWidget {
  var Dispalydata;
  ReviewOrder({super.key, required this.Dispalydata});
  @override
  Widget build(BuildContext context) {
    print("=>width${Get.width}");
    print("=>Hieght${Get.height}");
    print("${Dispalydata}");
    return Scaffold(
        appBar: AppBar(title: const Text("Order Details")),
        body: SingleChildScrollView(
          child: Center(
            child: Wrap(
              spacing: 12,
              runSpacing: 10,
              children: [
                Container(
                    height: 200,
                    width: 200,
                    decoration: const BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: const Center(child: Text("data"))),
                Container(
                    height: 200,
                    width: 100,
                    color: const Color.fromARGB(255, 200, 180, 125),
                    child: const Text("data")),
                Container(
                    height: 100,
                    width: 100,
                    color: Colors.amber,
                    child: const Text("data")),
                Container(
                    height: 100,
                    width: 100,
                    color: const Color.fromARGB(255, 227, 207, 148),
                    child: const Text("data")),
                Container(
                    height: 100,
                    width: 100,
                    color: Colors.amber,
                    child: const Text("data")),
                Container(
                    height: 100,
                    width: 100,
                    color: Colors.amber,
                    child: const Text("data")),
                Container(
                    height: 100,
                    width: 100,
                    color: Colors.amber,
                    child: const Text("data")),
                Container(
                    height: 100,
                    width: 100,
                    color: Colors.amber,
                    child: const Text("data")),
                Container(
                    height: 100,
                    width: 100,
                    color: Colors.amber,
                    child: const Text("data")),
                Container(
                    height: 100,
                    width: 100,
                    color: Colors.amber,
                    child: const Text("data")),
                Container(
                    height: 100,
                    width: 100,
                    color: Colors.amber,
                    child: const Text("data")),
                Container(
                    height: 100,
                    width: 100,
                    color: Colors.amber,
                    child: const Text("data")),
                Container(
                    height: 100,
                    width: 100,
                    color: Colors.amber,
                    child: const Text("data")),
                Container(
                    height: 100,
                    width: 100,
                    color: Colors.amber,
                    child: const Text("data")),
                Container(
                    height: 100,
                    width: 100,
                    color: Colors.amber,
                    child: const Text("data")),
                Container(
                    height: 100,
                    width: 100,
                    color: Colors.amber,
                    child: const Text("data")),
                Container(
                    height: 100,
                    width: 100,
                    color: Colors.amber,
                    child: const Text("data")),
                Container(
                    height: 100,
                    width: 100,
                    color: Colors.amber,
                    child: const Text("data")),
                Container(
                    height: 100,
                    width: 100,
                    color: Colors.amber,
                    child: const Text("data")),
                Container(
                    height: 100,
                    width: 100,
                    color: Colors.amber,
                    child: const Text("data")),
                Container(
                    height: 100,
                    width: 100,
                    color: Colors.amber,
                    child: const Text("data")),
                Container(
                    height: 100,
                    width: 100,
                    color: Colors.amber,
                    child: const Text("data")),
                Container(
                    height: 100,
                    width: 100,
                    color: Colors.amber,
                    child: const Text("20")),
              ],
            ),
          ),
        ));
  }
}
