import 'package:flutter/material.dart';

import '../../../../constant/material/dimens.dart';
import '../../model/product.dart';

class ProductTitleWithImage extends StatelessWidget {
  const ProductTitleWithImage({required this.product, super.key});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            "Aristocratic Hand Bag",
            style: TextStyle(color: Colors.white),
          ),
          Text(
            product.name,
          ),
          const SizedBox(height: defaultPadding),
          Row(
            children: <Widget>[
              RichText(
                text: TextSpan(
                  children: [
                    const TextSpan(text: "Price\n"),
                    TextSpan(text: "\$${product.price}"),
                  ],
                ),
              ),
              const SizedBox(width: defaultPadding),
              Expanded(
                child: Hero(
                  tag: "${product.id}",
                  child: Image(image: product.image?.image as ImageProvider, fit: BoxFit.fill),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
