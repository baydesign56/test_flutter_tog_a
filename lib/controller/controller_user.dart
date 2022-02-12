import 'package:get/get.dart';
import 'package:test/models/model_user.dart';

class ControllerUser extends GetxController {
  List<ModelUser> listUser = [];

  addUser({required ModelUser dataUser}) {
    listUser.add(dataUser);
    Get.back();
    update();
  }

  delete({required int index}) {
    listUser.removeAt(index);
    update();
  }
}
