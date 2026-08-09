
import 'package:emberald/controller/signup.controller.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/get_instance/src/extension_instance.dart';

class Signupbinding extends Bindings{
    @override
  void dependencies() {
    Get.lazyPut(() => Signupcontroller());
  }
}