import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class userController extends GetxController {
  var IsLoading = false.obs;
  var usersList = [].obs;
  var cart = [].obs;

  Add_data(item) {
    cart.add(item);
  }

  fetchUserData() async {
    var url = 'https://jsonplaceholder.typicode.com/users';
    var res = await http.get(Uri.parse(url));
    if (res.statusCode == 200) {
      return res.body;
    } else {
      throw Exception("network error");
    }
  }

  fetchuser() async {
    try {
      IsLoading(true);
      var users = await fetchUserData();
      usersList.addAll(users);
      print("ok $users");
    } catch (e) {
      print("error");
    } finally {
      IsLoading(false);
    }
  }

  @override
  void onInit() {
    print("ooooooooooooooo");
    fetchUserData();
    super.onInit();
  }
}
