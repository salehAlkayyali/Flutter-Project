import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:serviceproject/profile.dart';
import 'getting_started.dart';
import 'more.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';



class ItemDetails extends StatefulWidget {
  @override
  _ItemDetailsState createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> {
  int _selectedIndex = 1;


  @override
  void initState() {

    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      // Determine the language direction and set the initial selectedIndex accordingly
      if (Directionality.of(context) == TextDirection.rtl) {
        setState(() {
          _selectedIndex = 2; // Set to 2 for Arabic language
        });
      } else {
        setState(() {
          _selectedIndex = 1; // Set to 1 for English language
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.itemDetails),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      backgroundColor: Colors.grey[200],
      body: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: ListView.separated(
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) {
            return Card(
              child: _buildListItem(
                '${AppLocalizations.of(context)!.orderNumber}${index + 1}',
                AppLocalizations.of(context)!.orderType,
                '${AppLocalizations.of(context)!.orderDate}${index + 1}',
              ),
            );
          },
          separatorBuilder: (context, index) {
            return SizedBox(height: 10.0);
          },
          itemCount: 6,
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

              routes = ['/gettingstarted', '', '/profile', '/more'];

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

  Widget _buildListItem(String orderNumber, String orderDate, String orderType) {
    return ListTile(
      title: Text(orderNumber),
      subtitle: Text(orderDate),
      trailing: Text(orderType),
    );
  }
}



