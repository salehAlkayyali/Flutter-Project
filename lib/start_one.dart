import 'package:flutter/material.dart';
import 'package:serviceproject/main.dart';
import 'package:serviceproject/start_two.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Screen1 extends StatefulWidget {
  @override
  _Screen1State createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  Locale _currentLocale = Locale('ar', '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.screen1Title),
        actions: [
          IconButton(
            icon: Icon(Icons.language),
            onPressed: () {
              showLanguageSelectionDialog(context);
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Transform.scale(
                    scale: 0.9, // Adjust the scale value as needed
                    child: Image.asset(
                      'images/img1.jpg',
                    ),
                  ),
                  SizedBox(height: 10),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      AppLocalizations.of(context)!.reservationText,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      AppLocalizations.of(context)!.andCraftsmenText,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50,
              width: 300,
              child: Container(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/screen2'); // Use route name instead of MaterialPageRoute
                  },
                  child: Text(
                    AppLocalizations.of(context)!.nextButton,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 50),
            // Added spacing for button
          ],
        ),
      ),
    );
  }

  void showLanguageSelectionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(AppLocalizations.of(context)!.selectLanguage),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                ListTile(
                  title: Text(AppLocalizations.of(context)!.arabic),
                  onTap: () {
                    _changeLanguage(context, Locale('ar', ''));
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Text(AppLocalizations.of(context)!.english),
                  onTap: () {
                    _changeLanguage(context, Locale('en', ''));
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
  void _changeLanguage(BuildContext context, Locale locale) {
    MyApp.setLocale(context, locale);
  }

}