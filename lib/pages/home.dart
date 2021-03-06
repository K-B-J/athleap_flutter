import 'package:athleap/pages/index.dart';
import 'package:athleap/pages/shop.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

var main_color = const Color(0xfffa9b70);

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: (MediaQuery.of(context).size.height) / 2.5,
            decoration: BoxDecoration(
              color: main_color,
              image: DecorationImage(
                scale: 1.5,
                image: AssetImage("assets/images/splash_screen.png"),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10.0),
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Wrap(
                alignment: WrapAlignment.spaceEvenly,
                direction: Axis.horizontal,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.all(5),
                    child: InkWell(
                      onTap: () {
                        streamController.add(0);
                      },
                      child: SizedBox(
                        width: 112,
                        height: 112,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                spreadRadius: 4,
                                color: Color(0x18000000),
                                offset: Offset(0, 0),
                                blurRadius: 10,
                              )
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                SvgPicture.asset(
                                  "assets/icons/Running.svg",
                                  height: 40,
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
                                  child: Text(
                                    "Running",
                                    style: TextStyle(color: Color(0xff707070)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(5),
                    child: InkWell(
                      onTap: () {
                        streamController.add(1);
                      },
                      child: SizedBox(
                        width: 112,
                        height: 112,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                spreadRadius: 4,
                                color: Color(0x18000000),
                                offset: Offset(0, 0),
                                blurRadius: 10,
                              )
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                SvgPicture.asset(
                                  "assets/icons/Yoga.svg",
                                  height: 40,
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
                                  child: Text(
                                    "Yoga",
                                    style: TextStyle(color: Color(0xff707070)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(5),
                    child: InkWell(
                      onTap: () {
                        streamController.add(3);
                      },
                      child: SizedBox(
                        width: 112,
                        height: 112,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                spreadRadius: 4,
                                color: Color(0x18000000),
                                offset: Offset(0, 0),
                                blurRadius: 10,
                              )
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                SvgPicture.asset(
                                  "assets/icons/Gym.svg",
                                  height: 40,
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
                                  child: Text(
                                    "Gym",
                                    style: TextStyle(color: Color(0xff707070)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(5),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Shop()));
                      },
                      child: SizedBox(
                        width: 112,
                        height: 112,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                spreadRadius: 4,
                                color: Color(0x18000000),
                                offset: Offset(0, 0),
                                blurRadius: 10,
                              )
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  Icons.shopping_cart,
                                  size: 40,
                                  color: Color(0xaa707070),
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
                                  child: Text(
                                    "Shop",
                                    style: TextStyle(color: Color(0xff707070)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(5),
                    child: InkWell(
                      onTap: () {
                        streamController.add(4);
                      },
                      child: SizedBox(
                        width: 112,
                        height: 112,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                spreadRadius: 4,
                                color: Color(0x18000000),
                                offset: Offset(0, 0),
                                blurRadius: 10,
                              )
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  Icons.account_circle,
                                  size: 40,
                                  color: Color(0xaa707070),
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
                                  child: Text(
                                    "Profile",
                                    style: TextStyle(color: Color(0xff707070)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
