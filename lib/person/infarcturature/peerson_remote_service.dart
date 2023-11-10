import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';
import 'package:riverpodandprovidertestproj/core/application/network_result.dart';
import 'package:riverpodandprovidertestproj/core/config/app_strings.dart';
import 'package:riverpodandprovidertestproj/core/domain/response_info_error.dart';
import 'package:riverpodandprovidertestproj/core/infrastructure/dioExtensions.dart';
import 'package:riverpodandprovidertestproj/person/domain/person.dart';

class PersonRemoteService {
  final Dio _dio;
  PersonRemoteService(this._dio);

  Future<Either<ResponseInfoError, NetworkResult<List<Person>>>>
      getPerson() async {
    try {
      final response = await _dio.get('/');
      var resData = response.data as List;
      if (response.statusCode == AppString.statusCode) {
        var jsonData = resData.map((e) => Person.fromJson(e)).toList();
        // print(jsonData);
        return right(NetworkResult.result(jsonData));
      } else {
        return left(ResponseInfoError(
            code: response.statusCode.toString(),
            message: response.statusMessage));
      }
    } on DioError catch (e) {
      if (e.isNoConnectionError) {
        return right(const NetworkResult.noConnection());
      } else if (e.error != null) {
        return left(ResponseInfoError(
            code: e.response?.statusCode.toString(),
            message: e.response?.statusMessage));
      } else {
        rethrow;
      }
    }
  }
}
