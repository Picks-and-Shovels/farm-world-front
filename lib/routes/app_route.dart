import 'package:auto_route/auto_route.dart';
import 'package:farmworld_2/first_page.dart';
import 'package:farmworld_2/second_page.dart';

part 'app_route.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: FirstRoute.page, initial: true),
        AutoRoute(page: SecondRoute.page),
      ];
}
