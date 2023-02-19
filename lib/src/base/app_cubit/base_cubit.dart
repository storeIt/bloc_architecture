import 'package:bloc_architecture/src/util/helper/base_data_provider.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../util/exception/failure.dart';
import '../../util/helper/logger_helper.dart';

abstract class BaseCubit<BaseState> extends Cubit<BaseState> {
  final BaseDataProvider dataProvider;
  final LoggerHelper logger;

  BaseCubit(BaseState initialState)
      : dataProvider = BaseDataProvider(),
        logger = LoggerHelper(),
        super(initialState);

  void executeRequest<T>({required Future<T> request}) async {
    return await Task(() => dataProvider.executeRequest(request: request))
        .attempt()
        .run()
        .then((value) => print('value ${value.isLeft()}'));
  }
}
