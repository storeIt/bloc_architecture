import 'package:bloc_architecture/src/util/helper/base_data_provider.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../util/helper/logger_helper.dart';

abstract class BaseCubit<BaseState> extends Cubit<BaseState> {
  final BaseDataProvider dataProvider;
  final LoggerHelper logger;

  BaseCubit(BaseState initialState)
      : dataProvider = BaseDataProvider(),
        logger = LoggerHelper(),
        super(initialState);

  void executeRequest<T>({required Future<T> request, required Function success}) async {
    return await Task(() => dataProvider.executeRequest(request: request))
        .attempt()
        .run()
        .then(
          (either) => either.fold(
            (failure) {
              onError(failure, StackTrace.current);
            },
            (value) {
              success(value);
            },
          ),
        );
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    logger.e('BaseCubit onError()', error, stackTrace);
    super.onError(error, stackTrace);
  }
}
