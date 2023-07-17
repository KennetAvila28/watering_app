import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';
import 'package:watering_system/infrastructure/utils/shared_preferences_manager.dart';
import 'package:watering_system/presentation/utils/resources/images.dart';

import 'package:watering_system/infrastructure/flavor/flavor_config.dart';
import 'inject_config.dart';

/// Injecting app main dependencies so can be accessed from everywhere
class AppBinding {
  ///The starting point
  ///The order of the called function is important
  static Future<void> setupInjection(Flavor flavor) async {
    ///injectable and get it configuration
    configureDependencies();

    _injectFlavor(flavor);
    await _injectNetworkingDependencies();
    // await _injectDioForNetworking();
    await _injectSharedPreferences();
    await _injectImages();
    await _injectIntl();
    await _injectAuth();
    await _injectDb();
  }

  static Future _injectImages() async {
    final images = Images();
    getIt.registerSingleton(images);
  }

  static Future _injectSharedPreferences() async {
    final sharedPreferencesManager = SharedPreferencesManager();
    getIt.registerSingleton(sharedPreferencesManager);
  }

  static Future _injectIntl() async {
    final intlNumberCurrency = NumberFormat.simpleCurrency();
    getIt.registerSingleton(intlNumberCurrency);
  }

  static Future _injectAuth() async {
    getIt.registerSingleton(FirebaseAuth.instance);
  }

  static Future _injectDb() async {
    getIt.registerSingleton(FirebaseFirestore.instance);
  }

  // Calls [_injectDioForNetworking] prepares base URL
  static Future _injectNetworkingDependencies() async {
    final baseUrl = getIt.get<FlavorConfig>().baseUrl;
    log("BaseUrl from inject: $baseUrl");
  }

  ///prepare flavor config depending on the selected passed [flavor]
  static void _injectFlavor(Flavor flavor) {
    FlavorConfig flavorConfig;
    switch (flavor) {
      case Flavor.dev:
        flavorConfig = FlavorConfig(
            flavor: Flavor.dev, baseUrl: 'https://dev.url.com/api');
        break;
      case Flavor.beta:
        flavorConfig = FlavorConfig(
            flavor: Flavor.beta, baseUrl: 'https://beta.url.com/api');
        break;
      case Flavor.production:
        flavorConfig = FlavorConfig(
            flavor: Flavor.production, baseUrl: 'https://url.com/api');

        break;
    }

    ///Register the flavor with our get it
    getIt.registerSingleton(flavorConfig);
  }
}
