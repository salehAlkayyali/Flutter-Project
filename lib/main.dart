import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:serviceproject/profile.dart';
import 'package:serviceproject/signup_page.dart';
import 'package:serviceproject/splash.dart';
import 'package:serviceproject/start_one.dart';
import 'package:serviceproject/start_two.dart';
import 'package:serviceproject/start_three.dart';
import 'card_info.dart';
import 'choice_card.dart';
import 'getting_started.dart';
import 'item_details.dart';
import 'login_page.dart';
import 'more.dart';
import 'order_done.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  static void setLocale(BuildContext context, Locale newLocale) {
    final state = context.findAncestorStateOfType<_MyAppState>();
    state?.setLocale(newLocale);
  }

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _locale = Locale('ar', '');

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: _locale,

      routes: {
        '/': (context) => SplashScreen(),
        '/gettingstarted': (context) => GettingStarted(),
        '/screen1': (context) => Screen1(),
        '/screen2': (context) => Screen2(),
        '/screen3': (context) => Screen3(),
        '/login': (context) => LoginPage(),
        '/signup': (context) => SignUp(),
        '/choicecard': (context) => ChoiceCard(),
        '/cardinfo': (context) => CardInfo(),
        '/orderdone': (context) => OrderDone(),
        '/itemdetails': (context) => ItemDetails(),
        '/more': (context) => More(),
        '/profile': (context) => Profile(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}


