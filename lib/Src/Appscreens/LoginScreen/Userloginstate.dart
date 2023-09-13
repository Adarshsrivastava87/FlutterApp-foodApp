// import 'dart:convert';
// import 'dart:ffi';

// import 'package:get/get.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:my_app/Modal/modal.dart';
// import 'package:http/http.dart' as http;
// import 'package:my_app/Src/Appscreens/Modals/product.dart';

// class productController extends GetxController {
//   var Username = "".obs;
//   var Userpassword = "".obs;
//   var Total = "0".obs;
//   //late List<dynamic> ResposeList = [].obs;
//   var checkoutdata = [].obs;
//   var ResposeLists = <Products>[].obs;
//   var _googlsignin = GoogleSignIn();
//   var googleAccount = Rx<GoogleSignInAccount?>(null);

//   login() async {
//     //googleAccount.value = await _googlsignin.signIn();
//   }

//   Fetchdata() async {
//     print("fetching");
//     var url =
//         'https://foodapp-b31b9-default-rtdb.asia-southeast1.firebasedatabase.app/Producst.json';
//     var res = await http.get(Uri.parse(url));
//     if (res.statusCode == 200) {
//       var stringdata = res.body;
//       ResposeLists.value = productsFromJson(stringdata);
//     }
//   }

//   checkdata() {
//     //print("check data in list :${ResposeList}");
//   }

//   List<FoodList> FoodListitems = [
//     FoodList(
//         imgUrl:
//             "https://images.pexels.com/photos/1362534/pexels-photo-1362534.jpeg?cs=srgb&dl=pexels-teejay-1362534.jpg&fm=jpg",
//         Id: 0,
//         quantity: 1,
//         Price: 100,
//         name: "Icecream",
//         Detail: Details(
//             FoodDetails:
//                 "Flutter is Google's portable UI toolkit for crafting beautiful, natively compiled applications for mobile, web, and desktop from a single codebase. Flutter works with existing code, is used by developers and organizations around the world, and is free and open source.")),
//     FoodList(
//         imgUrl:
//             "https://www.cnet.com/a/img/resize/69256d2623afcbaa911f08edc45fb2d3f6a8e172/hub/2023/02/03/afedd3ee-671d-4189-bf39-4f312248fb27/gettyimages-1042132904.jpg?auto=webp&fit=crop&height=675&width=1200",
//         Id: 1,
//         quantity: 1,
//         Price: 400,
//         name: "Food",
//         Detail: Details(
//             FoodDetails:
//                 "Flutter is Google's portable UI toolkit for crafting beautiful, natively compiled applications for mobile, web, and desktop from a single codebase. Flutter works with existing code, is used by developers and organizations around the world, and is free and open source.")),
//     FoodList(
//         imgUrl:
//             "https://media.istockphoto.com/id/995038782/photo/heap-of-bread.jpg?s=612x612&w=0&k=20&c=UoAcNzbbDx2ybqoEZWBaxBdy73W2NN3km8MKSci0cHk=",
//         Id: 2,
//         quantity: 1,
//         Price: 50,
//         name: "Bread",
//         Detail: Details(
//             FoodDetails:
//                 "Flutter is Google's portable UI toolkit for crafting beautiful, natively compiled applications for mobile, web, and desktop from a single codebase. Flutter works with existing code, is used by developers and organizations around the world, and is free and open source.")),
//     FoodList(
//         imgUrl:
//             "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ414U6Ak7pE00Fq01RwnZ_-xFgPXvEE4Gdf5Kyi4JKWA&s",
//         Id: 3,
//         quantity: 1,
//         Price: 500,
//         name: "Fruit",
//         Detail: Details(
//             FoodDetails:
//                 "Flutter is Google's portable UI toolkit for crafting beautiful, natively compiled applications for mobile, web, and desktop from a single codebase. Flutter works with existing code, is used by developers and organizations around the world, and is free and open source.")),
//     FoodList(
//         imgUrl:
//             "https://www.allrecipes.com/thmb/5JVfA7MxfTUPfRerQMdF-nGKsLY=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/25473-the-perfect-basic-burger-DDMFS-4x3-56eaba3833fd4a26a82755bcd0be0c54.jpg",
//         Id: 4,
//         quantity: 1,
//         Price: 200,
//         name: "Burger",
//         Detail: Details(
//             FoodDetails:
//                 "Flutter is Google's portable UI toolkit for crafting beautiful, natively compiled applications for mobile, web, and desktop from a single codebase. Flutter works with existing code, is used by developers and organizations around the world, and is free and open source.")),
//     FoodList(
//         imgUrl:
//             "https://images.herzindagi.info/image/2022/May/cold-drink-hacks-to-know.jpg",
//         Id: 5,
//         quantity: 1,
//         Price: 100,
//         name: "ColdDrink",
//         Detail: Details(
//             FoodDetails:
//                 "Flutter is Google's portable UI toolkit for crafting beautiful, natively compiled applications for mobile, web, and desktop from a single codebase. Flutter works with existing code, is used by developers and organizations around the world, and is free and open source."))
//   ].obs;

//   var Cart = [].obs;
//   addItems(item) {
//     print("check");
//     var data = FoodListCart(
//         imgUrl: item.imgUrl,
//         Id: item.id,
//         Price: item.price,
//         name: item.name,
//         quantity: item.quantity);
//     // ];
//     Cart.add(data);
//     print(Cart);
//   }

//   IncAndDecQuantity(v, index) {
//     if (v == "Increment") {
//       Cart[index].quantity++;
//     } else if (Cart[index].quantity >= 2) {
//       Cart[index].quantity--;
//     } else {
//       return;
//     }
//     TotalPrice();
//   }

//   TotalPrice() {
//     print("Total price");
//     num sum = 0;
//     // for loop runs from 0 to cart length - 1
//     for (int i = 0; i < Cart.length; i++) {
//       sum = sum + Cart[i].quantity * Cart[i].Price;
//     }
//     // print(sum);
//     Total.value = sum.toString();
//     update();
//   }

//   Removedata(index) {
//     print(index);
//     Cart.removeAt(index);
//     TotalPrice();
//   }

//   setUserpassword(data) {
//     print("password:$data");
//     Userpassword.value = data;
//   }

//   setUsername(data) {
//     print("username:$data");
//     Username.value = data;
//   }

//   Future<http.Response> BuyProduct() {
//     var details = new Map();
//     details["TotalPrice"] = Total.value;
//     details["ProductDetails"] = Cart.toJson();
//     // var totalp = Total.value;
//     // checkoutdata.value = [Cart, totalp];
//     print("calling");
//     var url =
//         'https://foodapp-b31b9-default-rtdb.asia-southeast1.firebasedatabase.app/Cart.json';
//     return http.post(
//       Uri.parse(url),
//       headers: <String, String>{
//         'Content-Type': 'application/json; charset=UTF-8',
//       },
//       body: jsonEncode(details),
//     );
//   }

//   @override
//   void onInit() {
//     // TODO: implement onInit
//     Fetchdata();
//     super.onInit();
//   }
// }
