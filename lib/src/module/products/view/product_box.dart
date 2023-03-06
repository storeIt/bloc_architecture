import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

import '../../../constant/ui_constants.dart';
import '../model/product.dart';

class ProductBox extends StatelessWidget {
  final Product _product;
  final Color _dominantColor;

  const ProductBox(this._product, this._dominantColor, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(defaultPadding),
              // For  demo we use fixed height  and width
              // Now we don't need them
              height: 180,
              width: 160,
              decoration: BoxDecoration(
                color: const Color(0xFF3D82AE),
                borderRadius: BorderRadius.circular(16),
              ),
              // child: Hero(
              //   tag: product.id,
              //   child: Image.asset(product.image),
              // ),
              // child:  Image.asset('assets/images/splash.png'),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: CachedNetworkImage(
                  imageUrl: _product.imageUrl,
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
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
              // products is out demo list
              _product.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(color: textLightColor),
            ),
          ),
          Text(
            '${_product.price}',
            style: const TextStyle(fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }

  Future<PaletteGenerator> _getPaletteGenerator() async {
    final Completer<PaletteGenerator> completer = Completer();
    final PaletteGenerator paletteGenerator = await PaletteGenerator.fromImageProvider(
      CachedNetworkImageProvider(_product.imageUrl),
      size: const Size(50, 50),
      maximumColorCount: 20,
    );
    completer.complete(paletteGenerator);
    return completer.future;
  }

  Future<Color> _getDominantColor() async {
    Color dominantColor = Colors.white;
    PaletteGenerator paletteGenerator = await _getPaletteGenerator();
    if (paletteGenerator.dominantColor != null) {
      dominantColor = paletteGenerator.dominantColor!.color;
    }
    return dominantColor;
  }
}
