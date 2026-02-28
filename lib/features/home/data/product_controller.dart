import 'package:get/get.dart';
import 'package:zavisoft/features/home/data/product_model.dart';
import 'package:zavisoft/features/home/data/product_repo.dart';

class ProductController extends GetxController {
  final ProductRepo _repo = Get.find<ProductRepo>();

  bool isLoading = false;
  void setLoading(bool value) {
    isLoading = value;
    update();
  }
  String error = '';

  List<ProductModel> allProducts = [];
  List<ProductModel> get mensProducts =>
      allProducts.where((p) => p.category == "men's clothing").toList();
  List<ProductModel> get womensProducts =>
      allProducts.where((p) => p.category == "women's clothing").toList();
  List<ProductModel> get othersProducts =>
      allProducts.where((p) =>
          p.category == "jewelery" || p.category == "electronics").toList();

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    error = '';
    setLoading(true);

    try {
      final products = await _repo.fetchAllProducts();
      allProducts = products;
    } catch (e) {
      error = e.toString();
    } finally {
      setLoading(false);
      update();
    }
  }
}