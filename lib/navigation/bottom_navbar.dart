import 'package:first_app/ui/add_feed.dart';
import 'package:first_app/ui/news.dart';
import 'package:flutter/material.dart';
import 'package:first_app/ui/dashboard.dart';
import 'package:first_app/ui/feed.dart';
import 'package:first_app/ui/profile.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavbar extends StatefulWidget {
  @override
  _BottomNavbarState createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    Dashboard(),
    Feed(),
    AddFeed(),
    News(),
    Profile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.deepOrange.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 100,
              offset: Offset(0, -2),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.deepOrange,
          unselectedItemColor: Colors.grey,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: _buildIcon('home', 0),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: _buildIcon('feed', 1),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: _buildIcon('add', 2),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: _buildIcon('news', 3),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: _buildIcon('profile', 4),
              label: '',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIcon(String iconName, int index) {
    bool isSelected = _selectedIndex == index;

    // Tentukan ukuran ikon berdasarkan index
    double iconSize = (index == 2) ? 40.0 : (isSelected ? 24.0 : 24.0);
    double offsetY = (index == 2) ? -5.0 : (isSelected ? -0.0 : 0.0);

    // Tentukan warna ikon
    Color iconColor = (index == 2)
        ? (isSelected ? Colors.deepOrange : Colors.black)
        : (isSelected ? Colors.deepOrange : Colors.grey);

    return Container(
      alignment: Alignment.center,
      width: 60.0,
      height: 60.0,
      child: Transform.translate(
        offset: Offset(0, offsetY),
        child: SvgPicture.asset(
          'assets/icons/$iconName.svg',
          width: iconSize,
          height: iconSize,
          color: iconColor, // Gunakan warna yang sudah ditentukan
        ),
      ),
    );
  }
}
