import 'package:flutter/material.dart';

import '../../../../constant/material/dimens.dart';
import '../../model/product.dart';
import 'product_title_with_image.dart';

class Body extends StatelessWidget {
  final Product product;

  const Body({required this.product, super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            child: Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.1),
                  padding: EdgeInsets.only(
                    top: size.height * 0.12,
                    left: defaultPadding,
                    right: defaultPadding,
                  ),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      ProductTitleWithImage(product: product),
                      const SizedBox(height: defaultPadding / 2),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: defaultPadding),
                        child: Text(product.details, style: const TextStyle(height: 1.5)),
                      ),
                      const SizedBox(height: defaultPadding / 2),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
