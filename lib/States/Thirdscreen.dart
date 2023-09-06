import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';

class ValueGetx extends GetxController {
  var count = 0.obs;

  increment() {
    count++;
    update(); // STATE KO UPDATE KARNE KE LIYE.
  }

  @override
  void onInit() {
    // TODO: implement onInit
    print("implement onInit");
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    print(" implement onClose");
    super.onClose();
  }
}
