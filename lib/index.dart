import 'package:athleap/gym.dart';
import 'package:athleap/home.dart';
import 'package:athleap/main.dart';
import 'package:athleap/profile.dart';
import 'package:athleap/running.dart';
import 'package:athleap/yoga.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

var main_color = const Color(0xfffa9b70);

class Index extends StatefulWidget {
  const Index({Key? key}) : super(key: key);

  @override
  _IndexState createState() => _IndexState();
}

class _IndexState extends State<Index> {
  var titles = [
    "Running Records",
    "Yoga Records",
    "Home",
    "Gym Records",
    "Profile"
  ];
  final tabs = [
    RunningHistory(),
    YogaHistory(),
    Home(),
    GymHistory(),
    Profile()
  ];
  int _currentIndex = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titles[_currentIndex],
            style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: main_color,
      ),
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        selectedItemColor: main_color,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
              icon: _currentIndex == 0
                  ? SvgPicture.asset(
                      "assets/icons/Running.svg",
                      color: main_color,
                      height: 24,
                    )
                  : SvgPicture.asset(
                      "assets/icons/Running.svg",
                      height: 24,
                    ),
              title: Text('Running')),
          BottomNavigationBarItem(
              icon: _currentIndex == 1
                  ? SvgPicture.asset(
                      "assets/icons/Yoga.svg",
                      color: main_color,
                      height: 24,
                    )
                  : SvgPicture.asset(
                      "assets/icons/Yoga.svg",
                      height: 24,
                    ),
              title: Text('Yoga')),
          BottomNavigationBarItem(
              icon: _currentIndex == 2
                  ? SvgPicture.asset(
                      "assets/icons/Home.svg",
                      color: main_color,
                      height: 24,
                    )
                  : SvgPicture.asset(
                      "assets/icons/Home.svg",
                      height: 24,
                    ),
              title: Text('Home')),
          BottomNavigationBarItem(
              icon: _currentIndex == 3
                  ? SvgPicture.asset(
                      "assets/icons/Gym.svg",
                      color: main_color,
                      height: 24,
                    )
                  : SvgPicture.asset(
                      "assets/icons/Gym.svg",
                      height: 24,
                    ),
              title: Text('Gym')),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.account_circle,
                size: 28,
              ),
              title: Text('Profile')),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
