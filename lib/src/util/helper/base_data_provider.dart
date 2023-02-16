// // TODO Remove before commit
//
// import 'dart:async';
// import 'dart:io';
//
// import 'package:dio/dio.dart';
//
// import '../../base/model/base_response.dart';
//
// class BaseDataProvider {
//   List<DioErrorType> connectionTimeout = [
//     DioErrorType.connectTimeout,
//     DioErrorType.sendTimeout,
//     DioErrorType.receiveTimeout
//   ];
//
//
//   Future<bool> executeRequest<T>({required Future<T> request,
//     required Function success,
//     Function? error,
//     bool updateState = true}) async {
//     try {
//       T response = await request;
//
//       // return processResponse<T>(response: response, model: model, success: success, error: error, updateState: updateState);
//     } on DioError catch (e) {
//       // changeState(model, ViewState.retrieved, updateState);
//
//       if (e.response?.statusCode == HttpStatus.notModified) {
//         return false;
//       }
//
//       if (connectionTimeout.contains(e.type)) {
//         errorHandler(error, 'Error message', e.response?.statusCode);
//         return false;
//       }
//
//
//       errorHandler(error, e.response?.statusMessage ?? 'backup Error message',
//           e.response?.statusCode);
//       // changeState(model, ViewState.retrieved, updateState);
//     }
//     return false;
//   }
//
//   void errorHandler(error, [String message = '', int? errorCode]) {
//     if (error == null) {
//       // model?.setError(message);
//     } else {
//       error(message);
//     }
//   }
//
//   bool processResponse<T>(
//       {required T response, required Function success, required bool updateState, Function? error}) {
//     T obj = response;
//
//     // bool isSuccess = obj is BaseResponse ? obj.success : true;
//
//     if (isSuccess) {
//       success(obj);
//       // if (isMounted(model)) {
//       //   changeState(model, ViewState.retrieved, updateState);
//       // }
//       return true;
//     } else {
//       // if (isMounted(model)) {
//       //   errorHandler(model, error, obj.getMessage());
//       //   changeState(model, ViewState.retrieved, updateState);
//       // }
//     }
//
//     return false;
//   }
//
// // void changeState(BaseViewModel? model, ViewState state, bool updateState) {
// //   if (updateState) {
// //     model?.setState(state);
// //   }
// }