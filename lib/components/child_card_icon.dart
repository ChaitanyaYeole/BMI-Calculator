import 'package:flutter/material.dart';

import '../constants.dart';

class ChildCardIcon extends StatelessWidget {
  final IconData icondata;
  final String cardText;

  const ChildCardIcon(this.icondata, this.cardText, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Icon(
          icondata,
          size: 80,
        ),
        Text(
          cardText,
          style: kNormalTextStyle,
        ),
      ],
    );
  }
}
