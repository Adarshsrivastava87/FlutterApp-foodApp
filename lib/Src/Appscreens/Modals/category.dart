// To parse this JSON data, do
//
//     final categorymodal = categorymodalFromJson(jsonString);

import 'dart:convert';

List<Categorymodal> categorymodalFromJson(String str) =>
    List<Categorymodal>.from(
        json.decode(str).map((x) => Categorymodal.fromJson(x)));

String categorymodalToJson(List<Categorymodal> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Categorymodal {
  String imgUrl;
  int id;
  int quantity;
  int price;
  String name;

  Categorymodal({
    required this.imgUrl,
    required this.id,
    required this.quantity,
    required this.price,
    required this.name,
  });

  factory Categorymodal.fromJson(Map<String, dynamic> json) => Categorymodal(
        imgUrl: json["imgUrl"],
        id: json["Id"],
        quantity: json["quantity"],
        price: json["Price"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "imgUrl": imgUrl,
        "Id": id,
        "quantity": quantity,
        "Price": price,
        "name": name,
      };
}
