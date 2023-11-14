import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:guess_number/ui/root.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:guess_number/ui/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MyApp()));
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();

  static void setLocal(BuildContext context,String lang){
    _MyAppState? state= context.findAncestorStateOfType<_MyAppState>();
    state?.setLocal(lang);
  }
}

class _MyAppState extends State<MyApp> {
  String language = 'my';
  setLocal(String lang){
    setState(() {
      language=lang;
    });                                                    
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Pyidaungsu",
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(language,''),
      home:  const SplashScreen(),
    );
  }
}


