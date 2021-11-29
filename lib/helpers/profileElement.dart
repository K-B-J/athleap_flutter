import 'package:flutter/material.dart';

class ProfileElement extends StatelessWidget {
  final _textFontSize = 20.0;
  final data;
  final title;
  const ProfileElement(this.title, this.data);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              "$title",
              style: TextStyle(
                fontSize: _textFontSize,
                color: Color(0xff707070),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              "$data",
              style: TextStyle(
                fontSize: _textFontSize,
                color: Color(0xfffa9b70),
              ),
            ),
          )
        ],
      ),
    );
  }
}
