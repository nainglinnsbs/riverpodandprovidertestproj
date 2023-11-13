import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpodandprovidertestproj/core/shared/api_service_provider.dart';
import 'package:riverpodandprovidertestproj/person/application/person_notifier.dart';
import 'package:riverpodandprovidertestproj/person/application/save_person_notifier.dart';
import 'package:riverpodandprovidertestproj/person/infarcturature/peerson_remote_service.dart';

final personRemoteServiceProvider =
    Provider((ref) => PersonRemoteService(ref.watch(dioProvider)));

final personNotifierProvider =
    StateNotifierProvider<PersonNotifier, PersonState>(
  (ref) => PersonNotifier(ref.watch(personRemoteServiceProvider)),
);

final savePersonNotifierProvider =
    StateNotifierProvider<SavePersonNotifier, SavePersonState>(
  (ref) => SavePersonNotifier(ref.watch(personRemoteServiceProvider)),
);
