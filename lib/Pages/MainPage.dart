import 'package:flutter/material.dart';

import 'package:socdoc_flutter/Pages/MainSubPages/HomePage.dart';
import 'package:socdoc_flutter/Pages/MainSubPages/SettingPage.dart';
import 'package:socdoc_flutter/Pages/SearchPage.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<StatefulWidget> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final _pageList = [SizedBox.shrink(), HomePage(), SettingPage()];
  int _pageIdx = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _pageList[_pageIdx],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _pageIdx,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: "Search"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "My Page"
          )
        ],
        onTap: (int idx) {
          setState(() {
            if(idx == 0){
              Navigator.push(context, MaterialPageRoute(builder: (context) => SearchPage()));
            }else{
              _pageIdx = idx;
            }
          });
        },
      ),
    );
  }
}