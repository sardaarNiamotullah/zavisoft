import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zavisoft/features/home/data/product_controller.dart';
import 'package:zavisoft/features/home/presentation/widgets/custom_list_tile.dart';

class OthersTab extends StatelessWidget {
  const OthersTab({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(
      builder: (pc) {
        if (pc.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        return RefreshIndicator(
          onRefresh: pc.refreshOthers,
          child: CustomScrollView(
            key: const PageStorageKey<String>('others_tab'),
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
                      product: pc.othersProducts[index],
                      index: index,
                    ),
                    childCount: pc.othersProducts.length,
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