import 'package:flutter/material.dart';
import 'package:serviceproject/main.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height - (size.height * 0.2));
    path.quadraticBezierTo(size.width / 2, size.height, size.width, size.height - (size.height * 0.2));
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class LinePainter extends CustomPainter {
  final int selectedIndex;
  final int iconCount;

  LinePainter({required this.selectedIndex, required this.iconCount});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 5.0
      ..style = PaintingStyle.fill;

    final iconWidth = size.width / iconCount;
    final lineStart = Offset(iconWidth * selectedIndex, 0);
    final lineEnd = Offset(iconWidth * (selectedIndex + 1), 0);

    canvas.drawLine(lineStart, lineEnd, paint);
  }

  @override
  bool shouldRepaint(LinePainter oldDelegate) {
    return oldDelegate.selectedIndex != selectedIndex;
  }
}

class GettingStarted extends StatefulWidget {
  @override
  _GettingStartedState createState() => _GettingStartedState();
}

class _GettingStartedState extends State<GettingStarted> {
  int _selectedIndex = 0;

  final List<String> serviceIcons = [
    'icons/ac.svg',
    'icons/lights.svg',
    'icons/water.svg',
    'icons/bugs.svg',
    'icons/cleans.svg',
    'icons/saw.svg',
    'icons/settingsLarge.svg',
    'icons/cleans.svg',
    'icons/saw.svg',
    'icons/ac.svg',
    'icons/lights.svg',
    'icons/water.svg',
  ];

  List<String> getServiceNames(BuildContext context) {
    final AppLocalizations localizations = AppLocalizations.of(context)!;
    return [
      localizations.ac,
      localizations.lights,
      localizations.water,
      localizations.bugs,
      localizations.cleans,
      localizations.saw,
      localizations.settings,
      localizations.cleans,
      localizations.saw,
      localizations.ac,
      localizations.lights,
      localizations.water,
    ];
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      // Determine the language direction and set the initial selectedIndex accordingly
      if (Directionality.of(context) == TextDirection.rtl) {
        setState(() {
          _selectedIndex = 3; // Set to 3 for Arabic language
        });
      } else {
        setState(() {
          _selectedIndex = 0; // Set to 0 for English language
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    List<String> serviceNames = getServiceNames(context);
    // final isRTL = Directionality.of(context) == TextDirection.rtl;

    return Scaffold(
      body: Stack(
        children: [
          ClipPath(
            clipper: MyClipper(),
            child: Container(
              color: Colors.blue,
              height: 270,
            ),
          ),
          Positioned(
            top: screenHeight * 0.06,
            right: screenHeight * 0.02,
            child: SvgPicture.asset(
              'icons/bell.svg',
              color: Colors.white,
              width: screenHeight * 0.04,
              height: screenHeight * 0.04,
            ),
          ),

          Positioned(
            top: screenHeight * 0.05,
            left: screenHeight * 0.01,
            child: Transform.scale(
              scale: 1.3, // Adjust the scale factor as needed
              child: IconButton(
                icon: Icon(Icons.language),
                color: Colors.white,
                onPressed: () {
                  showLanguageSelectionDialog(context);
                },
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.05,
              left: MediaQuery.of(context).size.width * 0.22,
              right: MediaQuery.of(context).size.width * 0.2,
            ),
            child: Image(
              image: AssetImage('images/home.png'),
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.1,
            ),
          ),
          Positioned(
            top: 110,
            left: screenHeight * 0.04,
            right: screenHeight * 0.04,
            child: Container(
              width: double.infinity,
              height: 90,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 3,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.5 - 125),
            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.5 - 155),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Container(
                    width: double.infinity,
                    child: Transform.translate(
                      offset: Offset(-5, 5),
                      child: Text(
                        AppLocalizations.of(context)!.selectService,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Expanded(
                  child: SingleChildScrollView(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Wrap(
                        spacing: 20.0,
                        runSpacing: 15.0,
                        children: List.generate(serviceIcons.length, (index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/choicecard');
                            },
                            child: Column(
                              children: [
                                Container(
                                  width: 90,
                                  height: 85,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8.0),
                                    border: Border.all(
                                      color: Colors.pink[200]!,
                                      width: 1.0,
                                    ),
                                  ),
                                  child: Column(
                                    children: [
                                      SizedBox(height: 12),
                                      SvgPicture.asset(
                                        serviceIcons[index],
                                        width: 40.0,
                                        height: 40.0,
                                      ),
                                      SizedBox(height: 3),
                                      Text(
                                        serviceNames[index],
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Color(0xE20130D2),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomPaint(
        painter: LinePainter(
          selectedIndex: _selectedIndex,
          iconCount: 4,
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex < 0 || _selectedIndex >= 3 ? 0 : _selectedIndex,
          onTap: (int index) {
            List<String> routes;

            routes = ['', '/itemdetails', '/profile', '/more'];

            final String route = routes[index];
            if (route.isNotEmpty) {
              Navigator.pushNamed(context, route);
            }
          },
          backgroundColor: Colors.lightBlueAccent,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white,
          selectedLabelStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          unselectedLabelStyle: TextStyle(fontSize: 12),
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Column(
                children: [
                  SvgPicture.asset(
                    'icons/home.svg',
                    width: 24,
                    height: 24,
                  ),
                ],
              ),
              label: AppLocalizations.of(context)!.home,
            ),
            BottomNavigationBarItem(
              icon: Column(
                children: [
                  SvgPicture.asset(
                    'icons/receipt.svg',
                    width: 24,
                    height: 24,
                  ),
                ],
              ),
              label: AppLocalizations.of(context)!.orders,
            ),
            BottomNavigationBarItem(
              icon: Column(
                children: [
                  SvgPicture.asset(
                    'icons/user.svg',
                    width: 24,
                    height: 24,
                  ),
                ],
              ),
              label: AppLocalizations.of(context)!.user,
            ),
            BottomNavigationBarItem(
              icon: Column(
                children: [
                  SvgPicture.asset(
                    'icons/more.svg',
                    width: 24,
                    height: 24,
                  ),
                ],
              ),
              label: AppLocalizations.of(context)!.more,
            ),
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
                    setState(() {
                      _selectedIndex = 3; // Set to 0 for English language
                    });

                  },
                ),
                ListTile(
                  title: Text(AppLocalizations.of(context)!.english),
                  onTap: () {
                    _changeLanguage(context, Locale('en', ''));
                    Navigator.pop(context);
                    setState(() {
                      _selectedIndex = 0; // Set to 0 for English language
                    });
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
