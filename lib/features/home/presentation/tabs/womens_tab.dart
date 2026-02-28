import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:zavisoft/features/home/data/product_controller.dart';
import 'package:zavisoft/features/home/presentation/widgets/custom_list_tile.dart';

// class WomensTab extends StatelessWidget {
//   const WomensTab({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<ProductController>(
//       builder: (pc) {
//         if (pc.isLoading) {
//           return const Center(child: CircularProgressIndicator());
//         }
//         final products = pc.womensProducts;
//         return RefreshIndicator(
//           onRefresh: pc.refreshWomens,
//           child: ListView.builder(
//             padding: EdgeInsets.zero,
//             itemCount: products.length,
//             itemBuilder: (context, index) =>
//                 CustomListTile(product: products[index], index: index),
//           ),
//         );
//       },
//     );
//   }
// }


class WomensTab extends StatelessWidget {
  const WomensTab({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(
      builder: (pc) {
        if (pc.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        return RefreshIndicator(
          onRefresh: pc.refreshWomens,
          child: CustomScrollView(
            key: const PageStorageKey<String>('womens_tab'),
            slivers: [
              Builder(
                builder: (context) => SliverOverlapInjector(
                  handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                ),
              ),
              SliverPadding(
                padding: EdgeInsets.zero,
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => CustomListTile(
                      product: pc.womensProducts[index],
                      index: index,
                    ),
                    childCount: pc.womensProducts.length,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
