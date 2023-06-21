import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'getting_started.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String fullName = '';
  String email = '';
  String password = '';
  String mobileNumber = '';
  bool acceptTerms = false;
  bool passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final maxWidth = screenSize.width ;
    final maxHeight = screenSize.height;

    return Scaffold(
      backgroundColor: Color(0xFF57A4F0),
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            // Close the keyboard when tapped outside of a text field
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            physics: NeverScrollableScrollPhysics(),
            children: [
              SizedBox(height: 60.0),
              Container(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      margin: EdgeInsets.all(9.0),
                      padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(8.0),
                        color: Colors.white.withOpacity(0.3),
                      ),
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: maxWidth,
                    maxHeight: maxHeight,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: 40.0),
                        TextField(
                          onChanged: (value) {
                            setState(() {
                              fullName = value;
                            });
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            labelText: AppLocalizations.of(context)!.fullNameLabel,
                            filled: true,
                            fillColor: Colors.white,
                          ),
                        ),
                        SizedBox(height: 16.0),
                        TextField(
                          keyboardType: TextInputType.emailAddress,
                          onChanged: (value) {
                            setState(() {
                              email = value;
                            });
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            labelText: AppLocalizations.of(context)!.emailLabel,
                            filled: true,
                            fillColor: Colors.white,
                          ),
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12.0),
                            child: Expanded(
                              child: InternationalPhoneNumberInput(
                                onInputChanged: (PhoneNumber number) {
                                  mobileNumber = number.phoneNumber!;
                                },
                                selectorConfig: SelectorConfig(
                                  selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                                ),
                                inputDecoration: InputDecoration(
                                  border: InputBorder.none,
                                ),
                                autoValidateMode: AutovalidateMode.onUserInteraction,
                                initialValue: PhoneNumber(isoCode: 'PS'),
                                formatInput: false,
                                ignoreBlank: true,
                                keyboardType: TextInputType.numberWithOptions(signed: true),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 16.0),
                        TextField(
                          onChanged: (value) {
                            setState(() {
                              password = value;
                            });
                          },
                          textAlign: TextAlign.center,
                          obscureText: !passwordVisible,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            filled: true,
                            fillColor: Color(0xDDE8E8EF),
                            hintText: AppLocalizations.of(context)!.passwordHints,
                            hintStyle: TextStyle(
                              color: Colors.grey,
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                passwordVisible ? Icons.visibility_off : Icons.visibility,
                              ),
                              onPressed: () {
                                setState(() {
                                  passwordVisible = !passwordVisible;
                                });
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: 16.0),
                        Row(
                          children: [
                            Checkbox(
                              value: acceptTerms,
                              shape: CircleBorder(),
                              onChanged: (value) {
                                setState(() {
                                  acceptTerms = value!;
                                });
                              },
                            ),
                            Flexible(
                              child: GestureDetector(
                                onTap: () {
                                  // Handle the click on the terms and conditions
                                },
                                child: RichText(
                                  text: TextSpan(
                                    text: AppLocalizations.of(context)!.readable,
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: AppLocalizations.of(context)!.termsAndConditions,
                                        style: TextStyle(
                                          color: Colors.blue,
                                          decoration: TextDecoration.underline,
                                        ),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            // Handle the click on the terms and conditions
                                          },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20.0),
                        Row(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  AppLocalizations.of(context)!.haveAccountQuestion,
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional.centerStart,
                                  child: FractionalTranslation(
                                    translation: Offset(-0.1, -0.25), // Adjust the translation values as needed
                                    child: TextButton(
                                      onPressed: () {
                                        Navigator.pushReplacementNamed(context, '/login');
                                      },
                                      child: Text(
                                        AppLocalizations.of(context)!.signInButton,
                                        style: TextStyle(
                                          color: Color(0xFF57A4F0),
                                          fontSize: 16,
                                          decoration: TextDecoration.underline,
                                          decorationThickness: 1.5,
                                          decorationStyle: TextDecorationStyle.solid,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            Spacer(),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pushReplacementNamed(context, '/gettingstarted'); // Use route name instead of MaterialPageRoute
                              },
                              child: Text(
                                AppLocalizations.of(context)!.signUpButton,
                                style: TextStyle(fontSize: 18.0),
                              ),
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.symmetric(
                                  vertical: 16.0,
                                  horizontal: 50.0,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                primary: Color(0xFF519BE0),
                              ),
                            ),
                            SizedBox(height: 100.0),// Adjust the value to control the white space below the Sign Up button
                          ],
                        ),
                        // SizedBox(height: 200.0),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
