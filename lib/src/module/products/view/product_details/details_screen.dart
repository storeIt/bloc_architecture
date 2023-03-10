import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../constant/material/dimens.dart';
import '../../model/product.dart';
import 'body.dart';

class DetailsScreen extends StatelessWidget {
  final Product product;

  const DetailsScreen({required this.product, super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // each product have a color
      backgroundColor: product.dominantColor,
      appBar: buildAppBar(context),
      body: Body(product: product),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: product.dominantColor,
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset(
          'assets/icons/back.svg',
          color: Colors.white,
        ),
        onPressed: () => Navigator.pop(context),
      ),
      actions: <Widget>[
        IconButton(
          icon: SvgPicture.asset("assets/icons/search.svg"),
          onPressed: () {},
        ),
        IconButton(
          icon: SvgPicture.asset("assets/icons/cart.svg"),
          onPressed: () {},
        ),
        const SizedBox(width: defaultPadding / 2)
      ],
    );
  }
}
