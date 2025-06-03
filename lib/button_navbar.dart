import 'package:flutter/material.dart';
import 'home.dart';
import 'profil.dart';
import 'dart:io';


class ButtonNavBar extends StatefulWidget {
  final int currentIndex;
  final String userName;
  final String userImage;

  const ButtonNavBar({
    Key? key,
    required this.currentIndex,
    required this.userName,
    required this.userImage,
  }) : super(key: key);

  @override
  _ButtonNavBarState createState() => _ButtonNavBarState();
}

class _ButtonNavBarState extends State<ButtonNavBar> {
  int _selectedIndex = 0;
  late List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.currentIndex;

    _pages = [
      HomePage(userName: widget.userName, userImage: File(widget.userImage)),
      ProfilPage(userName: widget.userName, userImage: File(widget.userImage)),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
  bottomNavigationBar: BottomNavigationBar(
    currentIndex: _selectedIndex,
    selectedItemColor: Colors.red,
    unselectedItemColor: Colors.grey,
    onTap: (index) {
      if (index == 2) {
        // Logout dipilih
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: const Text('Konfirmasi Logout'),
            content: const Text('Apakah kamu yakin ingin logout?'),
            actions: [
              TextButton(
                child: const Text('Batal'),
                onPressed: () => Navigator.pop(context),
              ),
              TextButton(
                child: const Text('Logout'),
                onPressed: () {
                  Navigator.of(context).pop(); // Tutup dialog
                  Navigator.of(context).pushReplacementNamed('/Logout'); // ganti sesuai route kamu
                },
              ),
            ],
          ),
        );
      } else {
        setState(() {
          _selectedIndex = index;
        });
      }
    },
    items: const [
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.person),
        label: 'Profil',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.logout),
        label: 'Logout',
      ),
    ],
  ),
);
  }
}
