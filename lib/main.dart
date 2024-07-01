import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'firebase_options.dart';
import 'splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  var delegate = await LocalizationDelegate.create(
    supportedLocales: ['af_AF', 'nf_NF', 'ae_AE', 'ne_NE'],
    fallbackLocale: 'nf_NF',
  );

  runApp(LocalizedApp(delegate, const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Force landscape orientation
/*    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
*/
    return MaterialApp(
      title: translate('app.title'),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('af', 'AF'),
        Locale('nf', 'NF'),
        Locale('ae', 'AE'),
        Locale('ne', 'NE'),
      ],
      home: const SplashScreen(),
    );
  }
}
