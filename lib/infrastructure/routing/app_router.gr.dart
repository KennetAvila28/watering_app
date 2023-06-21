// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i8;
import 'package:watering_system/presentation/device_screen/device_screen.dart'
    as _i2;
import 'package:watering_system/presentation/main_screen/main_screen.dart'
    as _i3;

abstract class $AppRouter extends _i8.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i8.PageFactory> pagesMap = {
    DeviceScreen.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.DeviceScreen(),
      );
    },
    MainScreen.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.MainScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.FavoritesScreen]
class FavoritesScreen extends _i8.PageRouteInfo<void> {
  const FavoritesScreen({List<_i8.PageRouteInfo>? children})
      : super(
          FavoritesScreen.name,
          initialChildren: children,
        );

  static const String name = 'FavoritesScreen';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i2.DeviceScreen]
class DeviceScreen extends _i8.PageRouteInfo<void> {
  const DeviceScreen({List<_i8.PageRouteInfo>? children})
      : super(
          DeviceScreen.name,
          initialChildren: children,
        );

  static const String name = 'DeviceScreen';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i3.MainScreen]
class MainScreen extends _i8.PageRouteInfo<void> {
  const MainScreen({List<_i8.PageRouteInfo>? children})
      : super(
          MainScreen.name,
          initialChildren: children,
        );

  static const String name = 'MainScreen';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i4.ProductsScreen]
class ProductsScreen extends _i8.PageRouteInfo<void> {
  const ProductsScreen({List<_i8.PageRouteInfo>? children})
      : super(
          ProductsScreen.name,
          initialChildren: children,
        );

  static const String name = 'ProductsScreen';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i5.ProfileScreen]
class ProfileScreen extends _i8.PageRouteInfo<void> {
  const ProfileScreen({List<_i8.PageRouteInfo>? children})
      : super(
          ProfileScreen.name,
          initialChildren: children,
        );

  static const String name = 'ProfileScreen';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i6.PromosScreen]
class PromosScreen extends _i8.PageRouteInfo<void> {
  const PromosScreen({List<_i8.PageRouteInfo>? children})
      : super(
          PromosScreen.name,
          initialChildren: children,
        );

  static const String name = 'PromosScreen';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i7.ScannerScreen]
class ScannerScreen extends _i8.PageRouteInfo<void> {
  const ScannerScreen({List<_i8.PageRouteInfo>? children})
      : super(
          ScannerScreen.name,
          initialChildren: children,
        );

  static const String name = 'ScannerScreen';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}
