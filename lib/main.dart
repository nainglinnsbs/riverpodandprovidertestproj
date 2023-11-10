import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpodandprovidertestproj/person/pages/home_page.dart';

void main() {
  runApp(ProviderScope(child: HomePage()));
}
