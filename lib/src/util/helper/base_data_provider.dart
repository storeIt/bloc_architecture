import 'dart:io';

import 'package:bloc_architecture/src/constant/network_constant.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../exception/failure.dart';

class BaseDataProvider {
  final List<DioErrorType> connectionTimeoutErrorTypes = [
    DioErrorType.connectionTimeout,
    DioErrorType.receiveTimeout,
    DioErrorType.sendTimeout,
  ];

  Future<Either<Failure, T>> executeRequest<T>({required Future<T> request}) async {

    try {
      return Right(await request);
    } on DioError catch (e, s) {
      return Left(ServerFailure(_mapDioErrorToMessage(e), e, s));
    } on SocketException catch (e, s) {
      return Left(ConnectionFailure(e, s));
    } on FormatException catch (e, s) {
      return Left(FormatFailure(e, s));
    } catch (e, s) {
      return Left(UnhandledFailure(e, s));
    }
  }

  String _mapDioErrorToMessage(DioError error) {
    switch (error.type) {
      case DioErrorType.connectionTimeout:
      case DioErrorType.sendTimeout:
      case DioErrorType.receiveTimeout:
      case DioErrorType.connectionError:
        return NetworkConstant.noConnection;
      case DioErrorType.badResponse:
        return NetworkConstant.badResponse;
      case DioErrorType.cancel:
        return NetworkConstant.cancelRequest;
      case DioErrorType.unknown:
        return NetworkConstant.unknownException;
      case DioErrorType.badCertificate:
        return NetworkConstant.badCertificate;
    }
  }
}
