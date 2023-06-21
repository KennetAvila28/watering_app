import 'package:auto_route/auto_route.dart';
import 'package:watering_system/infrastructure/routing/route_paths.dart';
import 'app_router.gr.dart';

///Will hold all the routes in our app
@AutoRouterConfig(
  replaceInRouteName: 'Page,Route',
)
// extend the generated private router
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
            page: MainScreen.page, path: RoutePaths.mainScreen, initial: true),
        AutoRoute(
            page: DeviceScreen.page,
            path: RoutePaths.DeviceScreen,
            initial: false),
      ];
}
