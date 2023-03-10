import 'package:crypto_simple/crypto_simple.dart';
import 'package:dvp_test/core/keys/keys.dart';
import 'package:dvp_test/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:dvp_test/navigator.dart';
import 'package:flutter/services.dart';
import 'injection_container.dart' as di;

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  CryptoSimple(superKey: Keys.encryptSuperKey, subKey: Keys.encryptSubKey);
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Double V Partners test',
      debugShowCheckedModeBanner: false,
      navigatorKey: AppNavigator.navigatorKey,
      theme: ThemeData(
        primarySwatch: AppColors.primary,
      ),
      onGenerateRoute: AppNavigator.generateRoute,
      locale: const Locale('es', 'ES'),
    );
  }
}
