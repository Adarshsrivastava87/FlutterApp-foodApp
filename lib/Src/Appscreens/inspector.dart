import 'package:alice/alice.dart';
import 'package:get/get.dart';
import 'package:my_app/main.dart';

class Apiinspector extends GetxController {
  Alice alice = Alice();
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    alice = Alice(showNotification: false, navigatorKey: navkey);
  }

  navigateToInspector() {
    alice.showInspector();
  }

  AddApiresponse(response) {
    print("=>inspector");
    alice.onHttpResponse(response);
  }
}
