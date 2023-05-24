import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../products/cubit/products_cubit.dart';
import '../../products/repository/products_repository.dart';
import '../../products/view/product_list/product_list.dart';
import '../bloc/app_bloc.dart';

class AppView extends StatefulWidget {
  const AppView({super.key});

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppBloc(context),
      child: RepositoryProvider(
        create: (context) => ProductsRepository(),
        child: BlocProvider(
          create: (context) => ProductsCubit(context.read<ProductsRepository>()),
          child: const ProductList(),
        ),
      ),
    );
  }
}
