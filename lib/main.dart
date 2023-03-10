import 'package:crypto_simple/crypto_simple.dart';
import 'package:flutter/material.dart';
import 'package:dvp_test/navigator.dart';
import 'package:flutter/services.dart';
import 'injection_container.dart' as di;

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  CryptoSimple(superKey: 2022, subKey: 99);
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
        primarySwatch: Colors.purple,
      ),
      onGenerateRoute: AppNavigator.generateRoute,
      locale: const Locale('es', 'ES'),
    );
  }
}
