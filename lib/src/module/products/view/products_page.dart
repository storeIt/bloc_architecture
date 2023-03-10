// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import '../../products/cubit/products_cubit.dart';
// import '../../products/repository/products_repository.dart';
// import '../../products/view/product_list.dart';
//
// class ProductsPage extends StatelessWidget {
//   const ProductsPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return RepositoryProvider(
//       create: (context) => ProductsRepository(),
//       child: BlocProvider(
//         create: (context) => ProductsCubit(context.read<ProductsRepository>()),
//         child: const ProductList(),
//       ),
//     );
//   }
// }