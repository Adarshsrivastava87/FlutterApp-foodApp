// To parse this JSON data, do
//
//     final products = productsFromJson(jsonString);

import 'dart:convert';

import 'package:my_app/Modal/modal.dart';

List<Products> productsFromJson(String str) =>
    List<Products>.from(json.decode(str).map((x) => Products.fromJson(x)));

String productsToJson(List<Products> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Products {
  String imgUrl;
  int id;
  int quantity;
  int price;
  String name;
  Detail detail;

  Products({
    required this.imgUrl,
    required this.id,
    required this.quantity,
    required this.price,
    required this.name,
    required this.detail,
  });

  factory Products.fromJson(Map<String, dynamic> json) => Products(
        imgUrl: json["imgUrl"],
        id: json["Id"],
        quantity: json["quantity"],
        price: json["Price"],
        name: json["name"],
        detail: Detail.fromJson(json["Detail"]),
      );

  Map<String, dynamic> toJson() => {
        "imgUrl": imgUrl,
        "Id": id,
        "quantity": quantity,
        "Price": price,
        "name": name,
        "Detail": detail.toJson(),
      };
}

class Detail {
  String foodDetails;

  Detail({
    required this.foodDetails,
  });

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
        foodDetails: json["FoodDetails"],
      );

  Map<String, dynamic> toJson() => {
        "FoodDetails": foodDetails,
      };
}
