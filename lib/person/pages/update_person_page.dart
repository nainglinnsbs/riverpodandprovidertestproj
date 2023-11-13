import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpodandprovidertestproj/person/domain/person.dart';
import 'package:riverpodandprovidertestproj/person/shared/person_provider.dart';

@RoutePage()
class UpdatePersonPage extends ConsumerStatefulWidget {
  final Person person;
  const UpdatePersonPage(this.person, {super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _UpdatePersonPageState();
}

class _UpdatePersonPageState extends ConsumerState<UpdatePersonPage> {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    setData();
  }

  Future<void> setData() async {
    nameController.text = widget.person.name;
    phoneController.text = widget.person.phone;
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(
      savePersonNotifierProvider,
      (previous, next) {
        next.when(
          initial: () => debugPrint('savePrsonNotifierProvider/ initial'),
          loading: () {
            debugPrint('savePersonNotifierProvider/ loading');
          },
          noConnection: () =>
              debugPrint('savePersonNotifierProvider/ noConnection'),
          success: (data) {
            debugPrint('savePersonNotifierProvider/ success');
            debugPrint('savePersonNotifierProvider/ $data');
            ref.read(personNotifierProvider.notifier).getPerson();
            AutoRouter.of(context).pop();
          },
          error: (error) => debugPrint('saveContactNotifierProvider/ error'),
        );
      },
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Contact'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(hintText: 'Enter your name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please type something';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: phoneController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please type something';
                  }
                  return null;
                },
                decoration: const InputDecoration(hintText: 'Enter your phone'),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    Person person = Person(
                      id: widget.person.id,
                      name: nameController.text,
                      phone: phoneController.text,
                      createdAt: DateTime.now().toString(),
                    );
                    ref
                        .read(savePersonNotifierProvider.notifier)
                        .updatePerson(person);
                  }
                },
                child: const Text('Update'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
