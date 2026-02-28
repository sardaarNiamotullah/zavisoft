import 'package:get/get.dart';
import 'package:zavisoft/features/home/data/product_controller.dart';
import 'package:zavisoft/features/home/data/product_repo.dart';

Future<void> initBindings() async {
  Get.put(ProductRepo());
  Get.put(ProductController());
}
