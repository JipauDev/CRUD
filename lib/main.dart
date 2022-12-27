import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Model/ProviderOperation.dart';
import 'Screen/SplashScreen.dart';
import 'Style/Colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(supportedLocales: const [
    Locale('en', 'US'),
    Locale('ar', 'DZ'),
    Locale('zh', 'CN'),
    Locale('id', 'ID')
  ], startLocale: Locale('en', 'US'), path: 'assets/language', child: MyApp()));
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    /// Whether dark mode is enabled.
    bool isDarkModeEnabled = false;

    /// To set orientation always portrait
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    ///Set color status bar
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.transparent, //or set color with: Color(0xFF0000FF)
    ));

    return ChangeNotifierProvider<ProviderOperation>(
      create: (_) => ProviderOperation(),
      child: Builder(builder: (BuildContext context) {
        final themeChanger = Provider.of<ProviderOperation>(context);
        return MaterialApp(
          locale: context.locale,
          supportedLocales: context.supportedLocales,
          localizationsDelegates: context.localizationDelegates,
          title: 'Prawathiyakarsa Pradipta',
          debugShowCheckedModeBanner: false,
          themeMode: themeChanger.themeMode,
          theme: ThemeData(
              primarySwatch: primaryColors,
              primaryColor: Colors.white,
              backgroundColor: Color(0xffF1F5FB),
              scaffoldBackgroundColor: Colors.white,
              buttonTheme: Theme.of(context)
                  .buttonTheme
                  .copyWith(colorScheme: ColorScheme.light()),
              // primarySwatch: Colors.white,
              appBarTheme: AppBarTheme(
                  backgroundColor: Colors.white,
                  // color: Colors.black,
                  titleTextStyle: TextStyle(color: Colors.black),
                  iconTheme: IconThemeData(color: Colors.black),
                  textTheme:
                      TextTheme(caption: TextStyle(color: Colors.black)))),
          darkTheme: ThemeData(
              brightness: Brightness.dark,
              appBarTheme: AppBarTheme(
                  backgroundColor: Colors.black,
                  // color: Colors.black,
                  titleTextStyle: TextStyle(color: Colors.white),
                  iconTheme: IconThemeData(color: Colors.white),
                  textTheme:
                      TextTheme(caption: TextStyle(color: Colors.white))),
              scaffoldBackgroundColor: Colors.black),
          home: SplashScreen(),
        );
      }),
    );
  }
}
