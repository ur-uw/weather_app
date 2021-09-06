import 'package:get/get.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  final RxBool _switchVal = false.obs;

  set switchVal(bool? val) {
    print('test');
    _switchVal.value = val!;
  }

  bool get switchVal => _switchVal.value;
}
