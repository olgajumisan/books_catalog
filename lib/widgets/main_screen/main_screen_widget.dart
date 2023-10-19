import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MainScreenWidget extends StatefulWidget {
  const MainScreenWidget({super.key});

  @override
  State<MainScreenWidget> createState() => MainScreenWidgetState();
}

class MainScreenWidgetState extends State<MainScreenWidget> {
  int _selectedTab = 1;

  final List<Widget> _listWidgets = [
    Text('Домой'),
    Text('Каталог'),
    Text('Избранное'),
  ];

  void onSelectedTab(int index) {
    if (_selectedTab != index) {
      setState(() {
        _selectedTab = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Main Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _listWidgets[_selectedTab],
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('На страницу авторизации'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        fixedColor: Color(0xFF01B4E4),
        //backgroundColor: Color.fromARGB(31, 179, 178, 178),
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_filled), label: 'Домой'),
          BottomNavigationBarItem(
            icon: Icon(Icons.book_rounded),
            label: 'Каталог',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_add_outlined),
            label: 'Избранное',
          )
        ],
        onTap: onSelectedTab,
      ),
    );
  }
}