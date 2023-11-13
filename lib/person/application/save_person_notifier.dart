import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpodandprovidertestproj/core/domain/response_info_error.dart';
import 'package:riverpodandprovidertestproj/person/domain/person.dart';
import 'package:riverpodandprovidertestproj/person/infarcturature/peerson_remote_service.dart';

part 'save_person_notifier.freezed.dart';

@freezed
class SavePersonState with _$SavePersonState {
  const factory SavePersonState.initial() = _Initial;
  const factory SavePersonState.loading() = _Loading;
  const factory SavePersonState.noConnection() = _NoConnection;
  const factory SavePersonState.success(String success) = _Success;
  const factory SavePersonState.error(ResponseInfoError error) = _Error;
}

class SavePersonNotifier extends StateNotifier<SavePersonState> {
  final PersonRemoteService _remoteService;

  SavePersonNotifier(this._remoteService)
      : super(const SavePersonState.initial());

  Future<void> addPerson(String name, String phone) async {
    state = const SavePersonState.loading();
    final result = await _remoteService.addPerson(name, phone);
    state = result.fold(
      (l) => SavePersonState.error(l),
      (r) => r.when(
        noConnection: SavePersonState.noConnection,
        result: (data) => SavePersonState.success(data),
      ),
    );
  }

  Future<void> updatePerson(Person person) async {
    state = const SavePersonState.loading();
    final result = await _remoteService.updatePerson(person);
    state = result.fold(
      (l) => SavePersonState.error(l),
      (r) => r.when(
        noConnection: SavePersonState.noConnection,
        result: (data) => SavePersonState.success(data),
      ),
    );
  }

  Future<void> deletePerson(String id) async {
    state = const SavePersonState.loading();
    final result = await _remoteService.deletePerson(id);
    state = result.fold(
      (l) => SavePersonState.error(l),
      (r) => r.when(
        noConnection: SavePersonState.noConnection,
        result: (data) => SavePersonState.success(data),
      ),
    );
  }
}
