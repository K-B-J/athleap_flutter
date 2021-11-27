import 'package:athleap/pages/gym.dart';
import 'package:athleap/pages/home.dart';
import 'package:athleap/pages/profile.dart';
import 'package:athleap/pages/running.dart';
import 'package:athleap/pages/yoga.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:async';

var main_color = const Color(0xfffa9b70);

StreamController<int> streamController = StreamController<int>.broadcast();

class Index extends StatefulWidget {
  const Index(this.stream);
  final Stream<int> stream;

  @override
  _IndexState createState() => _IndexState();
}

class _IndexState extends State<Index> {
  final tabs = [
    RunningHistory(),
    YogaHistory(),
    Home(),
    GymHistory(),
    Profile()
  ];
  int _currentIndex = 2;
  @override
  void initState() {
    super.initState();
    widget.stream.listen((index) {
      mySetState(index);
    });
  }

  void mySetState(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        selectedItemColor: main_color,
        selectedFontSize: 10,
        unselectedFontSize: 10,
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
                color: Color(0xaa707070),
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
