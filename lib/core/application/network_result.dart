import 'package:freezed_annotation/freezed_annotation.dart';

part 'network_result.freezed.dart';

@freezed
class NetworkResult<T> with _$NetworkResult<T> {
  const NetworkResult._();
  const factory NetworkResult.noConnection() = _NoConnection<T>;
  const factory NetworkResult.result(T data) = _Result<T>;
}
