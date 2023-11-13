// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_route.dart';

abstract class _$AppRoute extends RootStackRouter {
  // ignore: unused_element
  _$AppRoute({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AddPersonRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AddPersonPage(),
      );
    },
    PersonRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PersonPage(),
      );
    },
    SplashRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SplashPage(),
      );
    },
    UpdatePersonRoute.name: (routeData) {
      final args = routeData.argsAs<UpdatePersonRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: UpdatePersonPage(
          args.person,
          key: args.key,
        ),
      );
    },
  };
}

/// generated route for
/// [AddPersonPage]
class AddPersonRoute extends PageRouteInfo<void> {
  const AddPersonRoute({List<PageRouteInfo>? children})
      : super(
          AddPersonRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddPersonRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PersonPage]
class PersonRoute extends PageRouteInfo<void> {
  const PersonRoute({List<PageRouteInfo>? children})
      : super(
          PersonRoute.name,
          initialChildren: children,
        );

  static const String name = 'PersonRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SplashPage]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [UpdatePersonPage]
class UpdatePersonRoute extends PageRouteInfo<UpdatePersonRouteArgs> {
  UpdatePersonRoute({
    required Person person,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          UpdatePersonRoute.name,
          args: UpdatePersonRouteArgs(
            person: person,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'UpdatePersonRoute';

  static const PageInfo<UpdatePersonRouteArgs> page =
      PageInfo<UpdatePersonRouteArgs>(name);
}

class UpdatePersonRouteArgs {
  const UpdatePersonRouteArgs({
    required this.person,
    this.key,
  });

  final Person person;

  final Key? key;

  @override
  String toString() {
    return 'UpdatePersonRouteArgs{person: $person, key: $key}';
  }
}
