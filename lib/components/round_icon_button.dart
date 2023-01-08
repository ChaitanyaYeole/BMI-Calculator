import 'package:flutter/material.dart';

class RoundiconButton extends StatelessWidget {
  final IconData icondata;
  final Function onPress;
  const RoundiconButton(
      {super.key, required this.icondata, required this.onPress});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () {
        onPress();
      },
      elevation: 0.0,
      constraints: const BoxConstraints.tightFor(height: 50, width: 50),
      shape: const CircleBorder(),
      fillColor: const Color(0xff1C2033),
      child: Icon(icondata),
    );
  }
}
