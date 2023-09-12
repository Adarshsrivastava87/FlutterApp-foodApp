import 'dart:convert';

import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:my_app/Modal/modal.dart';
import 'package:http/http.dart' as http;
import 'package:my_app/Src/Appscreens/Modals/product.dart';

class UserLogindata extends GetxController {
  var Username = "".obs;
  var Userpassword = "".obs;
  var Total = "0".obs;
  var checkoutdata = [].obs;
  var ResposeLists = <Products>[].obs;
  //var _googlsignin = GoogleSignIn();
  var googleAccount = Rx<GoogleSignInAccount?>(null);

  login() async {
    //googleAccount.value = await _googlsignin.signIn();
    List<Map> data = [];
    Map user = {
      "displayName": googleAccount.value?.displayName,
      "email": googleAccount.value?.email,
      "id": googleAccount.value?.id,
      "photoUrl": googleAccount.value?.photoUrl
    };
    data.add(user);

    print("Login function called ${googleAccount.value?.displayName}");
    var url =
        'https://foodapp-b31b9-default-rtdb.asia-southeast1.firebasedatabase.app/User.json';
    http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
  }

  Fetchdata() async {
    print("fetching");
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
    print("check");
    var data = FoodListCart(
        imgUrl: item.imgUrl,
        Id: item.id,
        Price: item.price,
        name: item.name,
        quantity: item.quantity);
    Cart.add(data);
    print(Cart);
  }

  IncAndDecQuantity(v, index) {
    if (v == "Increment") {
      Cart[index].quantity++;
    } else if (Cart[index].quantity >= 2) {
      Cart[index].quantity--;
    } else {
      return;
    }
    TotalPrice();
  }

  TotalPrice() {
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

  Removedata(index) {
    print(index);
    Cart.removeAt(index);
    TotalPrice();
  }

  setUserpassword(data) {
    print("password:$data");
    Userpassword.value = data;
  }

  setUsername(data) {
    print("username:$data");
    Username.value = data;
  }

  BuyProduct() {
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
    Fetchdata();
    super.onInit();
  }
}
