import 'package:bloc_architecture/src/constant/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../products/view/products_page.dart';
import '../bloc/app_bloc.dart';

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc Architecture'),
      ),
      body: BlocProvider(
        create: (_) => AppBloc(),
        child: BlocConsumer<AppBloc, AppState>(
          listener: (context, state) {
            if (state is AppFailureState) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text(AppConstants.unknownException)),
              );
            }
          },
          builder: (context, state) {
            if (state is AppLoadingState) {
              return _buildOverlay(context);
            } else if (state is AppFailureState) {
              return _buildOverlay(context, message: AppConstants.unknownException);
            } else if (state is AppSuccessState) {
              return const Text('Success');
            } else {
              return const ProductsPage();
            }
          },
        ),
      ),
    );
  }

  Widget _buildOverlay(BuildContext context, {String? message}) {
    return OverlayEntry(
      builder: (BuildContext context) => Stack(
        children: [
          const Opacity(
            opacity: 0.3,
            child: ModalBarrier(dismissible: false, color: Colors.grey),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircularProgressIndicator(),
                const SizedBox(height: 16),
                Text(message ?? 'Loading...'),
              ],
            ),
          ),
        ],
      ),
    ) as Widget;
  }
}
