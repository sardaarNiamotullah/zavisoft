import 'package:flutter/material.dart';
import 'package:zavisoft/features/home/data/product_model.dart';

class CustomListTile extends StatelessWidget {
  final ProductModel product;
  final int index;

  const CustomListTile({super.key, required this.product, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      margin: EdgeInsets.only(
        bottom: 10,
        top: index == 0 ? 10 : 0,
        left: 16,
        right: 16,
      ),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: Image.network(
            product.imageUrl,
            width: 48,
            height: 48,
            fit: BoxFit.contain,
            errorBuilder: (_, _, _) => const Icon(Icons.broken_image),
          ),
        ),
        title: Text(
          '${index + 1}. ${product.name}',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.deepPurple,
          ),
        ),
        subtitle: Text(
          product.description,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: Text(
          '\$${product.price.toStringAsFixed(2)}',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.deepPurple,
          ),
        ),
      ),
    );
  }
}
