import 'package:bloc_architecture/src/module/app_home/bloc/app_bloc.dart';
import 'package:bloc_architecture/src/util/ui/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../products/cubit/products_cubit.dart';
import '../../products/repository/products_repository.dart';
import '../../products/view/product_list.dart';

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    LoadingOverlay loadingOverlay = LoadingOverlay(context);

    return BlocProvider(
      create: (context) => AppBloc(),
      child: BlocListener<AppBloc, AppState>(
        listener: (context, state) {
          if (state is AppLoadingState) {
            loadingOverlay.showLoading();
          } else {
            loadingOverlay.hideLoading();
          }
        },
        child: RepositoryProvider(
          create: (context) => ProductsRepository(),
          child: BlocProvider(
            create: (context) => ProductsCubit(context.read<ProductsRepository>()),
            child: const ProductList(),
          ),
        ),
      ),
    );
  }
}