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
        return RefreshIndicator(
          onRefresh: pc.refreshMens,
          child: ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: pc.mensProducts.length,
            itemBuilder: (context, index) =>
                CustomListTile(product: pc.mensProducts[index], index: index),
          ),
        );
      },
    );
  }
}