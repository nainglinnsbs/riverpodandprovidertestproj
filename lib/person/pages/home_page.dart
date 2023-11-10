import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpodandprovidertestproj/core/persentation/router/app_route.dart';
import 'package:riverpodandprovidertestproj/core/shared/api_service_provider.dart';

class HomePage extends ConsumerWidget {
  HomePage({super.key});

  final _appRoute = AppRoute();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(initializationProvider, (previous, next) {});
    return MaterialApp.router(
      title: "Riverpod Test",
      debugShowCheckedModeBanner: false,
      routerConfig: _appRoute.config(),
    );
  }
}
