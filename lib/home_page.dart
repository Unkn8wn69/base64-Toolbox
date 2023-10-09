import 'package:Base64_Toolbox/pages/text/encode.dart';
import "package:flutter/material.dart";
import 'package:google_nav_bar/google_nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;


  void _navigatePage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final _pages = [
    TextEncodePage(),
    Center(
      child: Text("test"),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("BASE64 TOOLBOX", style:  TextStyle(fontWeight: FontWeight.bold, fontSize: 18),)),
        automaticallyImplyLeading: false,
        toolbarHeight: 80,
      ),

      body: _pages[_selectedIndex],
      backgroundColor: Theme.of(context).colorScheme.background,
      bottomNavigationBar: Container(
        color: Theme.of(context).colorScheme.primary,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: GNav(
            backgroundColor: Theme.of(context).colorScheme.primary,
            color:  Colors.grey[500],
            activeColor: Colors.white,
            padding: EdgeInsets.all(15),
            tabBackgroundColor: Colors.white.withOpacity(0.2),
            style: GnavStyle.google,
            gap: 10,
            selectedIndex: _selectedIndex,
            onTabChange: (index) {
              _navigatePage(index);
            },
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            tabs: [
              GButton(icon: Icons.code, text: "Encode",),
              GButton(icon: Icons.code_off, text: "Decode",),
            ],
          ),
        ),
      ),

    );
  }
}