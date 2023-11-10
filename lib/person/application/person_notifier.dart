import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpodandprovidertestproj/core/domain/response_info_error.dart';
import 'package:riverpodandprovidertestproj/person/domain/person.dart';
import 'package:riverpodandprovidertestproj/person/infarcturature/peerson_remote_service.dart';

part 'person_notifier.freezed.dart';

@Freezed()
class PersonState with _$PersonState {
  const factory PersonState.initial() = _Initial;
  const factory PersonState.loading() = _Loading;
  const factory PersonState.noConnection() = _NoConnection;
  const factory PersonState.empty() = _Empty;
  const factory PersonState.success(List<Person> person) = _Success;
  const factory PersonState.error(ResponseInfoError error) = _Error;
}

class PersonNotifier extends StateNotifier<PersonState> {
  final PersonRemoteService _remoteService;
  PersonNotifier(this._remoteService) : super(const PersonState.initial());

  Future<void> getPerson() async {
    state = const PersonState.loading();
    final result = await _remoteService.getPerson();
    state = result.fold(
      (l) => PersonState.error(l),
      (r) => r.when(
        noConnection: PersonState.noConnection,
        result: (data) => data.isEmpty
            ? const PersonState.empty()
            : PersonState.success(data),
      ),
    );
  }
}
