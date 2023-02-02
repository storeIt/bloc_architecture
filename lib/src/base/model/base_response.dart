import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'base_response.g.dart';

@JsonSerializable()
class BaseResponse extends Equatable {
  // final bool success;
  //
  // String? errorMessage;
  // String? messageTitle;
  // List<String>? message;
  //
  // BaseResponse(this.success);
  const BaseResponse();
  //
  // String getMessage() {
  //   if(errorMessage != null) {
  //     return errorMessage!;
  //   }
  //   if (message == null || message!.isEmpty) {
  //     return "";
  //   }
  //
  //   var sb = StringBuffer();
  //   for (var item in message!) { sb.write("$item ");}
  //   return sb.toString();
  // }
  //
  factory BaseResponse.fromJson(Map<String, dynamic> json) => _$BaseResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BaseResponseToJson(this);

  @override
  List<Object?> get props => [];
}