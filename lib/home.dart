// ignore_for_file: avoid_print, avoid_types_as_parameter_names

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_kullanimi/graph.dart';
import 'package:getx_kullanimi/history.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentTab = 0;
  Widget _currentScreen = GraphScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _currentScreen,
      floatingActionButton: const FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: null,
        backgroundColor: Colors.black,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
          height: Get.height / 12,
          activeColor: Colors.red,
          inactiveColor: Colors.red[100],
          gapLocation: GapLocation.center,
          backgroundColor: Colors.black,
          icons: const [Icons.show_chart, Icons.history],
          iconSize: 30,
          activeIndex: _currentTab,
          onTap: (int) {
            setState(() {
              _currentTab = int;
              _currentScreen =
                  (int == 0) ? const GraphScreen() : const HistoryScreen();
            });
            print(int);
          }),
    );
  }
}
