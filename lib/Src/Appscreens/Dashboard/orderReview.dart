import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/Productcontroller.dart';

// ignore: must_be_immutable
class ReviewOrder extends StatelessWidget {
  var Dispalydata;
  ReviewOrder({super.key, required this.Dispalydata});
  @override
  final UserLogindata controller = Get.find<UserLogindata>();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Order Details"),
        backgroundColor: Colors.orange,
        elevation: 5,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Product Name
              Text(
                Dispalydata.name,
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
                ),
              ),

              const SizedBox(height: 16),

              // Product Image
              Center(
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  shadowColor: Colors.grey.withOpacity(0.5),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(
                      Dispalydata.imgUrl,
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Product Details Section
              Text(
                "Product Details",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal.shade700,
                ),
              ),
              const SizedBox(height: 10),
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                shadowColor: Colors.teal.shade200,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    Dispalydata.detail.foodDetails,
                    style: const TextStyle(
                      fontSize: 16,
                      height: 1.5,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Product Price Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Price:",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.teal.shade700,
                    ),
                  ),
                  Text(
                    "₹${Dispalydata.price}",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Add to Cart Button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Obx(() {
                  // Check if the item is already in the cart
                  bool isAdded = controller.Cart.any(
                      (cartItem) => cartItem.Id == Dispalydata.id);
                  return ElevatedButton(
                    onPressed: () {
                      if (!isAdded) {
                        controller
                            .addItems(Dispalydata); // Add the item to the cart
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isAdded
                          ? Color.fromARGB(255, 243, 192, 115)
                          : Colors.orange,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        isAdded ? "Added to Cart" : "Add to Cart",
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
