import 'package:emberald/controller/signin.controller.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/get_instance/src/extension_instance.dart';

class Signinbinding extends Bindings{
    @override
  void dependencies() {
    Get.lazyPut(() => Signincontroller());
  }

}