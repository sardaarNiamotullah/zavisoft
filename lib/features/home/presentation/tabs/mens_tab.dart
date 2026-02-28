import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zavisoft/features/home/data/product_controller.dart';
import 'package:zavisoft/features/home/presentation/widgets/custom_list_tile.dart';

class MensTab extends StatelessWidget {
  const MensTab({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(
      builder: (pc) {
        if (pc.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        final products = pc.mensProducts;
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