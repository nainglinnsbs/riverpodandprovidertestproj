import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:riverpodandprovidertestproj/person/domain/person.dart';
import 'package:riverpodandprovidertestproj/person/pages/add_person_page.dart';
import 'package:riverpodandprovidertestproj/person/pages/person_page.dart';
import 'package:riverpodandprovidertestproj/Splash/splash_page.dart';
import 'package:riverpodandprovidertestproj/person/pages/update_person_page.dart';

part 'app_route.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRoute extends _$AppRoute {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, path: '/', initial: true),
        AutoRoute(page: PersonRoute.page, path: '/person'),
        AutoRoute(page: AddPersonRoute.page, path: '/add'),
        AutoRoute(page: UpdatePersonRoute.page, path: '/update'),
      ];
}
