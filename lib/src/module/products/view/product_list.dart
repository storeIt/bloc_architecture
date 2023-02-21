import 'package:bloc_architecture/src/module/products/cubit/products_cubit.dart';
import 'package:bloc_architecture/src/module/products/view/product_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../constant/ui_constants.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  Widget build(BuildContext context) {
    context.read<ProductsCubit>().fetchProducts();

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: BlocConsumer<ProductsCubit, ProductState>(
                listener: (context, state) {
                  state.products.isNotEmpty;
                },
                builder: (context, state) {
                  return GridView.builder(
                    itemCount: state.products.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: defaultPadding,
                      crossAxisSpacing: defaultPadding,
                      childAspectRatio: 0.75,
                    ),
                    itemBuilder: (context, index) => ProductBox(
                      state.products[index],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
