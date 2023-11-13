import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpodandprovidertestproj/person/shared/person_provider.dart';

@RoutePage()
class AddPersonPage extends ConsumerStatefulWidget {
  const AddPersonPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddPersonPageState();
}

class _AddPersonPageState extends ConsumerState<AddPersonPage> {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    ref.listen(
      savePersonNotifierProvider,
      (previous, next) {
        next.when(
          initial: () => debugPrint('savePersonNotifierProvider/ initial'),
          loading: () {
            debugPrint('savePersonNotifierProvider/ loading');
          },
          noConnection: () =>
              debugPrint('savePrsonNotifierProvider/ noConnection'),
          success: (data) {
            debugPrint('savePersonNotifierProvider/ success');
            debugPrint('savePersonNotifierProvider/ $data');
            ref.read(personNotifierProvider.notifier).getPerson();
            AutoRouter.of(context).pop();
          },
          error: (error) => debugPrint('savePersonNotifierProvider/ error'),
        );
      },
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Person'),
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
                    ref
                        .read(savePersonNotifierProvider.notifier)
                        .addPerson(nameController.text, phoneController.text);
                  }
                },
                child: const Text('Save'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
