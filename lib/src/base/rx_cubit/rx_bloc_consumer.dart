import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:remix/search/cubit/base_state.dart';

class RxBlocConsumer<C extends Cubit<BaseState>> extends StatelessWidget {
  const RxBlocConsumer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<C, BaseState>(
      listener: (context, state) {

      },
      builder: (context, state) {
        return const SizedBox.shrink();
      }
    );
  }
}
