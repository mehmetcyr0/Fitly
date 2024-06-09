import 'package:fitly/aikoc/aikoc.dart';
import 'package:fitly/sayfalar/vki.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

void main() => runApp(MaterialApp(
    builder: (context, child) {
      return Directionality(textDirection: TextDirection.ltr, child: child!);
    },
    theme: ThemeData(primaryColor: const Color.fromARGB(255, 255, 255, 255)
        //  Colors.grey[800],

        ),
    home: const Ekranlar()));

class Ekranlar extends StatefulWidget {
  const Ekranlar({super.key});

  @override
  _EkranlarState createState() => _EkranlarState();
}

class _EkranlarState extends State<Ekranlar> {
  int _selectedIndex = 0;
  static const TextStyle yaziTipi =
      TextStyle(fontSize: 30, fontWeight: FontWeight.w600);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      ' Koşu / AdımSayar',
      style: yaziTipi,
    ),
    VkiSayfasi(),
    Text(
      'Egzersiz',
      style: yaziTipi,
    ),
    Text(
      'Kalori Hesaplayıcı',
      style: yaziTipi,
    ),
    Text(
      'Hesap',
      style: yaziTipi,
    ),
    AiKoc(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      // appBar: AppBar(
      //   elevation: 20,
      // ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 0, 0, 0),
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: const Color.fromARGB(255, 255, 255, 255).withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              rippleColor: Colors.grey[300]!,
              hoverColor: Colors.grey[100]!,
              gap: 8,
              activeColor: const Color.fromARGB(255, 255, 255, 255),
              iconSize: 24,
              padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 12),
              duration: const Duration(milliseconds: 400),
              tabBackgroundColor: const Color.fromARGB(255, 0, 0, 0),
              color: const Color.fromARGB(255, 255, 254, 254),
              tabs: const [
                GButton(
                  icon: LineIcons.running,
                  text: 'Koşu',
                ),
                GButton(
                  icon: LineIcons.weight,
                  text: 'vki',
                ),
                GButton(
                  icon: LineIcons.dumbbell,
                  text: 'Egzersiz',
                ),
                GButton(
                  icon: LineIcons.ruler,
                  text: 'Kalori Hesaplayıcı',
                ),
                GButton(
                  icon: LineIcons.user,
                  text: 'hesap',
                ),
                GButton(
                  icon: LineIcons.robot,
                  text: 'AIKOC',
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
