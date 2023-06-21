import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:serviceproject/profile.dart';
import 'getting_started.dart';
import 'item_details.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class More extends StatefulWidget {
  @override
  _MoreState createState() => _MoreState();
}

class _MoreState extends State<More> {
  String phoneNumber = '';
  int _selectedIndex = 3; // Set the initial selected index to 3 (More)

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      // Determine the language direction and set the initial selectedIndex accordingly
      if (Directionality.of(context) == TextDirection.rtl) {
        setState(() {
          _selectedIndex = 0; // Set to 4 for Arabic language
        });
      } else {
        setState(() {
          _selectedIndex = 3; // Set to 0 for English language
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipPath(
              clipper: MyClipper(),
              child: Container(
                color: Colors.blue,
                height: 180,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.5),
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: IconButton(
                          icon: Icon(Icons.arrow_back_ios_outlined, color: Colors.white),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ),
                    Text(
                      AppLocalizations.of(context)!.more,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                      ),
                    ),
                    SizedBox(width: 60),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            OptionItem(
              text: AppLocalizations.of(context)!.changePassword,
              icon: Icons.lock,
            ),
            OptionItem(
              text: AppLocalizations.of(context)!.faqs,
              icon: Icons.question_answer,
            ),
            OptionItem(
              text: AppLocalizations.of(context)!.aboutApp,
              icon: Icons.info,
            ),
            OptionItem(
              text: AppLocalizations.of(context)!.termsConditions,
              icon: Icons.description,
            ),
            OptionItem(
              text: AppLocalizations.of(context)!.privacyPolicy,
              icon: Icons.lock,
            ),
            OptionItem(
              text: AppLocalizations.of(context)!.myRates,
              icon: Icons.star,
            ),
            OptionItem(
              text: AppLocalizations.of(context)!.deleteAccount,
              icon: Icons.delete,
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomPaint(
        painter: LinePainter(
          selectedIndex: _selectedIndex,
          iconCount: 4, // Replace with the actual number of icons in the BottomNavigationBar
        ),
        child: BottomNavigationBar(
          onTap: (int index) {
            List<String> routes;

              routes = ['/gettingstarted', '/itemdetails', '/profile', ''];

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
}

class OptionItem extends StatelessWidget {
  final String text;
  final IconData icon;

  const OptionItem({
    Key? key,
    required this.text,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(text),
      trailing: Icon(Icons.navigate_next),
      onTap: () {
        // Handle option tap
      },
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height - 50);
    path.quadraticBezierTo(size.width / 2, size.height, size.width, size.height - 50);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
