import 'dart:math';
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

  // Base filtered lists
  List<ProductModel> get _baseMens =>
      allProducts.where((p) => p.category == "men's clothing").toList();
  List<ProductModel> get _baseWomens =>
      allProducts.where((p) => p.category == "women's clothing").toList();
  List<ProductModel> get _baseOthers => allProducts
      .where((p) => p.category == "jewelery" || p.category == "electronics")
      .toList();

  List<ProductModel> mensProducts = [];
  List<ProductModel> womensProducts = [];
  List<ProductModel> othersProducts = [];

  Future<void> fetchProducts() async {
    error = '';
    setLoading(true);
    try {
      final products = await _repo.fetchAllProducts();
      allProducts = products;
      mensProducts = List.from(_baseMens);
      womensProducts = List.from(_baseWomens);
      othersProducts = List.from(_baseOthers);
    } catch (e) {
      error = e.toString();
    } finally {
      setLoading(false);
      update();
    }
  }

  void _appendAndShuffle(
    List<ProductModel> displayList,
    List<ProductModel> baseList, {
    int count = 1,
  }) {
    final random = Random();
    displayList.addAll(
      List.generate(count, (_) => baseList[random.nextInt(baseList.length)]),
    );
    displayList.shuffle(random);
  }

  Future<void> refreshMens() async {
    _appendAndShuffle(mensProducts, _baseMens);
    update();
  }

  Future<void> refreshWomens() async {
    _appendAndShuffle(womensProducts, _baseWomens);
    update();
  }

  Future<void> refreshOthers() async {
    _appendAndShuffle(othersProducts, _baseOthers);
    update();
  }
}
