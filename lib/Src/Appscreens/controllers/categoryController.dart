import 'package:alice/alice.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:my_app/Src/Appscreens/Modals/category.dart';
import 'package:my_app/Src/Appscreens/inspector.dart';
import 'package:my_app/main.dart';

class categoryController extends GetxController {
  var inspector = Get.put(Apiinspector());
  List CategoryData = [].obs;

  fetchCategoryData() async {
    var url =
        'https://foodapp-b31b9-default-rtdb.asia-southeast1.firebasedatabase.app/commonItems.json';
    var res = await http.get(Uri.parse(url));
    if (res.statusCode == 200) {
      CategoryData = categorymodalFromJson(res.body);
    }
    inspector.AddApiresponse(res);
    print("=====>${CategoryData[0].name}");
  }
}
