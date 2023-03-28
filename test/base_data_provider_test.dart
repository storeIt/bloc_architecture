import 'package:bloc_architecture/src/util/helper/base_data_provider.dart';
import 'package:bloc_architecture/src/util/helper/logger_helper.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';

void main() {
  late BaseDataProvider baseDataProvider;

  setUp(() {
    baseDataProvider = BaseDataProvider();
  });

  group('BaseDataProvider - ', () {
    group('executeRequest function', () {
      // description naming convention: given when then
      test(
          'given BaseDataProvider class when executeRequest() function is called '
              'and then Right is returned as a successful request', () async {
        // arrange
        const mockResponse = 'mock response';
        final mockRequest = Future.value(mockResponse);
        // act
        final result = await baseDataProvider.executeRequest(request: mockRequest);
        // assert
        expect(result, isA<Right>());
      });

      test(
          'given BaseDataProvider class when executeRequest() function is called '
              'and then Left is returned as a failed request', () async {
        // arrange
        const mockError = 'mock error';
        final mockRequest = Future.error(mockError);
        GetIt.instance.registerFactory<LoggerHelper>(() => LoggerHelper());
        // act
        final result = await baseDataProvider.executeRequest(request: mockRequest);
        // assert
        expect(result, isA<Left>());
      });
    });
  });
}