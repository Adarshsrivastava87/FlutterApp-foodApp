import 'dart:convert';

import 'package:get/get.dart';
import 'package:my_app/Modal/modal.dart';
import 'package:http/http.dart' as http;
import 'package:my_app/Src/Appscreens/Modals/product.dart';

class productController extends GetxController {
  var Total = "0".obs;
  var checkoutdata = [].obs;
  var ResposeLists = <Products>[].obs;

  fetchdata() async {
    //print("fetching");
    var url =
        'https://foodapp-b31b9-default-rtdb.asia-southeast1.firebasedatabase.app/Producst.json';
    var res = await http.get(Uri.parse(url));
    if (res.statusCode == 200) {
      var stringdata = res.body;
      ResposeLists.value = productsFromJson(stringdata);
    }
  }

  checkdata() {}

  var Cart = [].obs;
  addItems(item) {
    //print("check");
    var data = FoodListCart(
        imgUrl: item.imgUrl,
        Id: item.id,
        Price: item.price,
        name: item.name,
        quantity: 1);
    Cart.add(data);
    //print(Cart);
  }

  incAndDecQuantity(v, index) {
    if (v == "Increment") {
      Cart[index].quantity++;
    } else if (Cart[index].quantity > 1) {
      Cart[index].quantity--;
    } else {
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
    Cart.clear();
    Total.value = "0";
  }

  @override
  void onInit() {
    // TODO: implement onInit
    fetchdata();
    super.onInit();
  }
}
