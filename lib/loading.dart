import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

var main_color = const Color(0xfffa9b70);

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: SpinKitChasingDots(
          color: main_color,
          size: 50.0,
        ),
      ),
    );
  }
}
