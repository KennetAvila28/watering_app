import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:watering_system/firebase_options.dart';
import 'package:watering_system/infrastructure/flavor/flavor_config.dart';

import 'app_binding.dart';

///Will have everything needs to be configured before the app run
class AppInitializer {
  ///Setup firebase services and handles any shared logic
  static Future setupPrerequisites(Flavor flavor) async {
    ///because binding should be initialized before calling runApp.
    WidgetsFlutterBinding.ensureInitialized();

    ///initialize firebase app to inject firebase services later
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);

    ///Lock rotation to vertical up
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    ///dependencies injection
    await AppBinding.setupInjection(flavor);
  }
}
