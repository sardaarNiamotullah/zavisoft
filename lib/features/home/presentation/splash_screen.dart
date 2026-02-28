import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zavisoft/features/home/data/product_controller.dart';
import 'package:zavisoft/features/home/presentation/home_page.dart';
import 'package:zavisoft/features/home/presentation/widgets/logo_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _initAndNavigate();
  }

  Future<void> _initAndNavigate() async {
    final controller = Get.find<ProductController>();
    await controller.fetchProducts();
    await Future.delayed(const Duration(milliseconds: 1000));
    Get.off(() => const HomePage());
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Center(child: LogoWidget(isLargeLogo: true)),
    );
  }
}
