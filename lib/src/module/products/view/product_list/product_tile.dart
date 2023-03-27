import 'package:bloc_architecture/src/config/router/app_router.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../constant/material/color.dart';
import '../../../../constant/material/dimens.dart';
import '../../model/product.dart';

class ProductTile extends StatelessWidget {
  final Product _product;

  const ProductTile(this._product, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.go(AppRouter.productDetails, extra: _product);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(defaultPadding),
              height: productTileHeight,
              width: productTileWidth,
              decoration: BoxDecoration(
                color: const Color(0xFF3D82AE),
                borderRadius: BorderRadius.circular(16),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: CachedNetworkImage(
                  imageUrl: _product.imageUrl,
                  imageBuilder: (context, imageProvider) {
                    _product.fetchedImage = Image(image: imageProvider, fit: BoxFit.cover);
                    return Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                      ),
                    ),
                    );
                  },
                  placeholder: (context, url) => Container(
                    color: Colors.grey[200],
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding / 4),
            child: Text(
              _product.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(color: textLightColor),
            ),
          ),
          Text(
            '\$${_product.price}',
            style: const TextStyle(fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
