import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpodandprovidertestproj/person/domain/person.dart';
import 'package:riverpodandprovidertestproj/person/shared/person_provider.dart';

@RoutePage()
class PersonPage extends ConsumerStatefulWidget {
  const PersonPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PersonPageState();
}

class _PersonPageState extends ConsumerState<PersonPage> {
  List<Person> personList = [];
  @override
  void initState() {
    super.initState();
    getPerson();
  }

  Future<void> getPerson() async {
    Future.microtask(
        () => ref.read(personNotifierProvider.notifier).getPerson());
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(personNotifierProvider);
    ref.listen(
      personNotifierProvider,
      (previous, next) {
        next.when(
          initial: () => debugPrint('personNotifierProvider/ initial'),
          loading: () {
            debugPrint('personNotifierProvider/ loading');
            personList.clear();
          },
          noConnection: () =>
              debugPrint('personNotifierProvider/ noConnection'),
          empty: () => debugPrint('personNotifierProvider/ empty'),
          success: (data) {
            debugPrint('personNotifierProvider/ success');
            debugPrint('personNotifierProvider/ $data');
            for (var element in data) {
              personList.add(element);
            }
          },
          error: (error) => debugPrint('personNotifierProvider/ error'),
        );
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Person Page'),
      ),
      body: state.when(
        initial: () => const SizedBox(),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        noConnection: () => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'No Connection\nCheck your internet!',
                textAlign: TextAlign.center,
              ),
              IconButton(
                  onPressed: () => getPerson(), icon: const Icon(Icons.refresh))
            ],
          ),
        ),
        empty: () => const Center(
          child: Text('No Data'),
        ),
        success: (contacts) => ListView.builder(
          itemCount: personList.length,
          itemBuilder: (context, index) => Card(
            child: ListTile(
              leading: CircleAvatar(child: Text('${index + 1}')),
              title: Text(personList[index].name),
              subtitle: Text(personList[index].phone),
            ),
          ),
        ),
        error: (error) => const Center(
          child: Text('Error/nSomething wrong'),
        ),
      ),
    );
  }
}
