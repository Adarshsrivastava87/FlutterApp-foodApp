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
