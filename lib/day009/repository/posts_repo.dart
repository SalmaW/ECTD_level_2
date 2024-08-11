import 'package:ectd2/day009/repository/call_repo.dart';

import '../model/call_result_model.dart';
import '../services/dio_services.dart';

class PostsRepo extends CallRepo {
  @override
  Future<CallResult> delete(String id, [Map<String, dynamic>? args]) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<CallResult> get([Map<String, dynamic>? args]) async {
    try {
      var response = await DioService.dio.get("posts");
      if ((response.statusCode ?? 0) >= 200 &&
          (response.statusCode ?? 0) < 299) {
        return CallResult(
            status: response.statusCode!,
            statusMsg: response.statusMessage!,
            data: response.data,
            isSuccess: true,
            error: "");
      } else {
        return CallResult(
            status: response.statusCode!,
            statusMsg: response.statusMessage!,
            data: null,
            isSuccess: false,
            error: "Error : ${response.statusMessage}");
      }
    } catch (e) {
      return CallResult(
          status: 500,
          statusMsg: '',
          data: null,
          isSuccess: false,
          error: "$e");
    }
  }

  @override
  Future<CallResult> patch(String id, Map<String, dynamic> data,
      [Map<String, dynamic>? args]) {
    // TODO: implement patch
    throw UnimplementedError();
  }

  @override
  Future<CallResult> post(Map<String, dynamic> data,
      [Map<String, dynamic>? args]) {
    // TODO: implement post
    throw UnimplementedError();
  }

  @override
  Future<CallResult> put(String id, Map<String, dynamic> data,
      [Map<String, dynamic>? args]) {
    // TODO: implement put
    throw UnimplementedError();
  }
}
