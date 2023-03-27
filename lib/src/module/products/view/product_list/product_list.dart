import 'package:bloc_architecture/src/module/products/cubit/products_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../../constant/app_constants.dart';
import '../../../../constant/material/dimens.dart';
import '../../model/product.dart';
import 'product_tile.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final PagingController<int, Product> _pagingController = PagingController(firstPageKey: 0);

  @override
  initState() {
    super.initState();
    _pagingController.addPageRequestListener((_) {
      context.read<ProductsCubit>().fetchProducts(context);
    });
    _pagingController.refresh();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: BlocConsumer<ProductsCubit, ProductState>(
                listener: (context, state) {
                  if (state.products.isEmpty) {
                    // TODO show error message
                    return;
                  }
                  final int currentSize = state.products.length + (_pagingController.itemList?.length ?? 0);
                  final isLastPage = currentSize >= AppConstants.productListSize;
                  if (isLastPage) {
                    _pagingController.appendLastPage(state.products);
                  } else {
                    _pagingController.appendPage(state.products, state.products.length);
                  }
                },
                builder: (context, state) {
                  return PagedGridView<int, Product>(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: defaultPadding,
                      crossAxisSpacing: defaultPadding,
                      childAspectRatio: 0.75,
                    ),
                    showNewPageErrorIndicatorAsGridChild: false,
                    showNewPageProgressIndicatorAsGridChild: false,
                    showNoMoreItemsIndicatorAsGridChild: false,
                    pagingController: _pagingController,
                    builderDelegate: PagedChildBuilderDelegate<Product>(
                      itemBuilder: (context, item, index) {
                        return ProductTile(item);
                      },
                      newPageProgressIndicatorBuilder: (_) => Container(),
                      firstPageProgressIndicatorBuilder: (_) => Container(),
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

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }
}
