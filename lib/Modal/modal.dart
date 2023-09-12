class FoodList {
  var imgUrl;
  var Id;
  var quantity;
  var Price;
  String name = "";
  var Detail = Details(FoodDetails: "");
  FoodList(
      {required this.imgUrl,
      required this.Id,
      required this.name,
      required this.Detail,
      required this.Price,
      required this.quantity});
}

class Details {
  var FoodDetails;
  Details({required this.FoodDetails});
}

class FoodListCart {
  var imgUrl;
  var Id;
  var quantity;
  var Price;
  String name = "";
  FoodListCart(
      {required this.imgUrl,
      required this.Id,
      required this.name,
      required this.Price,
      required this.quantity});

  Map<String, dynamic> toJson() => {
        "imgUrl": imgUrl,
        "Id": Id,
        "quantity": quantity,
        "Price": Price,
        "name": name,
      };
}
