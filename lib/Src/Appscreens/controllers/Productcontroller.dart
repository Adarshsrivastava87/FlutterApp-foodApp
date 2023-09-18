import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:my_app/Modal/modal.dart';
import 'package:http/http.dart' as http;
import 'package:my_app/Src/Appscreens/Modals/product.dart';

class productController extends GetxController {
  var Total = "0".obs;
  var checkoutdata = [].obs;
  var ResposeLists = <Products>[].obs;
  var Cart = [].obs;
  fetchdata() async {
    //print("fetching");
    var url =
        'https://foodapp-b31b9-default-rtdb.asia-southeast1.firebasedatabase.app/Product.json';
    var res = await http.get(Uri.parse(url));
    if (res.statusCode == 200) {
      var stringdata = res.body;
      ResposeLists.value = productsFromJson(stringdata);
    }
  }

  checkdata() {}

  addItems(item) {
    print("check added item ${item.quantity}");
    if (Cart.isEmpty) {
      /// Add item if cart is Empty
      var data = FoodListCart(
          imgUrl: item.imgUrl,
          Id: item.id,
          Price: item.price,
          name: item.name,
          quantity: 1);
      Cart.add(data);
    } else {
      bool check = true;
      Cart.forEach((element) {
        check = element.Id == item.id;
      });
      if (check) {
        //print("Exsist");
        Timer(const Duration(seconds: 1), () {
          Get.back();
        });
        Get.defaultDialog(
            title: "Item Add",
            content: const Text(
              "Item Already Added To Cart",
              style: TextStyle(color: Colors.green),
            ));
      } else {
        var data = FoodListCart(
            imgUrl: item.imgUrl,
            Id: item.id,
            Price: item.price,
            name: item.name,
            quantity: 1);
        Cart.add(data);
      }
    }

    //print(Cart);
  }

  incAndDecQuantity(v, index) async {
    if (v == "Increment") {
      print(index);
      int id = Cart[index].Id;
      if (Cart[index].quantity < ResposeLists[id].quantity) {
        print("=======>${ResposeLists[id].quantity}");
        Cart[index].quantity++;
      }
    } else if (Cart[index].quantity > 1) {
      Cart[index].quantity--;
    } else {
      print("index");
      return;
    }
    totalPrice();
  }

  totalPrice() {
    print("Total price");
    num sum = 0;
    // for loop runs from 0 to cart length - 1
    for (int i = 0; i < Cart.length; i++) {
      sum = sum + Cart[i].quantity * Cart[i].Price;
    }
    // print(sum);
    Total.value = sum.toString();
    update();
  }

  removedata(index) {
    //print(index);
    Cart.removeAt(index);
    totalPrice();
  }

  buyProduct() {
    var details = new Map();
    if (Cart.isNotEmpty) {
      details["TotalPrice"] = Total.value;
      details["ProductDetails"] = Cart.toJson();
      //print("calling");
      var url =
          'https://foodapp-b31b9-default-rtdb.asia-southeast1.firebasedatabase.app/Cart.json';
      http.post(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(details),
      );
      return clearCart();
    } else {
      return;
    }
  }

  clearCart() {
    //print("clear cart");
    updateData();
    fetchdata();
    Cart.clear();
    Total.value = "0";
  }

  updateData() async {
    //await fetchdata();

    Cart.forEach((element) async {
      await http.patch(
        Uri.parse(
            'https://foodapp-b31b9-default-rtdb.asia-southeast1.firebasedatabase.app/Product/${element.Id}.json'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          "quantity": ResposeLists[element.Id].quantity - element.quantity,
        }),
      );
    });

    //fetchdata();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    fetchdata();
    super.onInit();
  }
}
