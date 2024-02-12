import 'package:farmworld_2/routes/app_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MyApp extends ConsumerWidget {
  MyApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      title: 'Farm World',
      routerConfig: _appRouter.config(),
      debugShowCheckedModeBanner: false,
    );
  }
}
