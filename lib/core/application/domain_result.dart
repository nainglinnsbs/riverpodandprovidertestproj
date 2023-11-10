import 'package:freezed_annotation/freezed_annotation.dart';

part 'domain_result.freezed.dart';

@freezed
class DomainResult<T> with _$DomainResult<T> {
  const factory DomainResult.noInternet() = _NoInternet<T>;
  const factory DomainResult.data(T entity) = _Data<T>;
}
