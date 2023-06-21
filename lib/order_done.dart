import 'package:flutter/material.dart';
import 'getting_started.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OrderDone extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/gettingstarted');
                      },
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Container(
                  alignment: AlignmentDirectional.topStart,
                  child: Image.asset(
                    'images/img3.png',
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(height: 50),
                Text.rich(
                  TextSpan(
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    children: [
                      TextSpan(
                        text: AppLocalizations.of(context)!.order,
                        style: TextStyle(color: Colors.black),
                      ),
                      TextSpan(
                        text: AppLocalizations.of(context)!.done,
                        style: TextStyle(color: Colors.blue),
                      ),
                      TextSpan(
                        text: '!',
                        style: TextStyle(color: Colors.brown),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  AppLocalizations.of(context)!.orderSent,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                Text(
                  AppLocalizations.of(context)!.orderSentContact,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: 300,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/gettingstarted');
                    },
                    child: Text(
                      AppLocalizations.of(context)!.goToHome,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
