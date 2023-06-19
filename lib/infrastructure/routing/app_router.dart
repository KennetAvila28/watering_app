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
            page: HomeScreen.page, path: RoutePaths.homeScreen, initial: false),
        AutoRoute(
            page: ProductsScreen.page,
            path: RoutePaths.productScreen,
            initial: false),
        AutoRoute(
            page: PromosScreen.page,
            path: RoutePaths.promosScreen,
            initial: false),
        AutoRoute(
            page: FavoritesScreen.page,
            path: RoutePaths.favoritesScreen,
            initial: false),
        AutoRoute(
            page: ProfileScreen.page,
            path: RoutePaths.profileScreen,
            initial: false),
        AutoRoute(
            page: ScannerScreen.page,
            path: RoutePaths.scannerScreen,
            initial: false),
      ];
}
