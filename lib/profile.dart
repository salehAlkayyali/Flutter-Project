import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'getting_started.dart';
import 'item_details.dart';
import 'login_page.dart';
import 'more.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';



class Option {
  final String title;
  final void Function()? onTap;
  final String? content;

  Option({
    required this.title,
    required this.onTap,
    this.content,
  });
}

class Profile extends StatelessWidget {
  int _selectedIndex = 2; // Starting index for BottomNavigationBar

  // final List<Option> options = [
  //   Option(title: AppLocalizations.of(context)!.language, onTap: () {}, content: AppLocalizations.of(context)!.english),
  //   Option(title: AppLocalizations.of(context)!.myRates, onTap: () {}),
  //   Option(title: AppLocalizations.of(context)!.contact, onTap: () {}),
  //   Option(title: AppLocalizations.of(context)!.shareApp, onTap: () {}),
  // ];


  @override
  Widget build(BuildContext context) {

    if (Directionality.of(context) == TextDirection.rtl) {
      _selectedIndex = 1; // Set to 1 for Arabic language
    } else {
      _selectedIndex = 2; // Set to 2 for English language
    }
    final options = [
      Option(
        title: AppLocalizations.of(context)!.language,
        onTap: () {},
        content: AppLocalizations.of(context)!.english,
      ),
      Option(
        title: AppLocalizations.of(context)!.myRates,
        onTap: () {},
      ),
      Option(
        title: AppLocalizations.of(context)!.contact,
        onTap: () {},
      ),
      Option(
        title: AppLocalizations.of(context)!.shareApp,
        onTap: () {},
      ),
    ];
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.lightBlue],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 50),
                child: SvgPicture.asset(
                  'icons/ic_setting.svg',
                  color: Colors.white,
                ),
              ),
              Stack(
                alignment: AlignmentDirectional.topCenter,
                children: [
                  Container(
                    width: double.infinity,
                    height: 160,
                    margin: EdgeInsets.only(top: 40),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(
                        color: Colors.white,
                        width: 7.0,
                      ),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          image: AssetImage('images/myself.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      width: 120,
                      height: 120,
                    ),
                  ),
                  Positioned(
                    top: 133,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.name,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          AppLocalizations.of(context)!.address,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              Container(
                color: Colors.grey[100],
                width: double.infinity,
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    for (var option in options) ...[
                      nCard(
                        title: option.title,
                        content: option.content,
                        onTap: option.onTap,
                        haveContent: option.content != null,
                      ),
                    ],
                    SizedBox(height: 10),
                    Container(
                      width: double.infinity,
                      color: Colors.white,
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.logout,
                            color: Colors.brown,
                          ),
                          SizedBox(width: 10),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/login');
                            },
                            child: Text(
                              AppLocalizations.of(context)!.signOut,
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
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

            routes = ['/gettingstarted', '/itemdetails', '', '/more'];

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

class nCard extends StatelessWidget {
  final String title;
  final String? content;
  final void Function()? onTap;
  final bool haveContent;

  const nCard({
    Key? key,
    required this.title,
    this.content,
    this.onTap,
    this.haveContent = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20), // Add top padding of 10
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            if (haveContent) ...[
              Spacer(),
              Text(
                content!,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey,
                ),
              ),
              SizedBox(width: 10),
            ],
            Icon(
              Icons.keyboard_arrow_right,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}



