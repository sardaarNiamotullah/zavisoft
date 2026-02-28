import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:zavisoft/features/home/data/product_controller.dart';
import 'package:zavisoft/features/home/presentation/widgets/custom_list_tile.dart';

class WomensTab extends StatelessWidget {
  const WomensTab({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(
      builder: (controller) {
        if (controller.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (controller.error.isNotEmpty) {
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(controller.error),
                ElevatedButton(
                  onPressed: controller.fetchProducts,
                  child: const Text('Retry'),
                ),
              ],
            ),
          );
        }
        final products = controller.womensProducts;
        if (products.isEmpty) {
          return const Center(child: Text('No products found'));
        }
        return ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: products.length,
          itemBuilder: (context, index) =>
              CustomListTile(product: products[index], index: index),
        );
      },
    );
  }
}
