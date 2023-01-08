import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Color colour;
  final Widget childCard;
  final Function onPress;

  const ReusableCard(
      {super.key,
      required this.onPress,
      required this.colour,
      required this.childCard});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPress(),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5), color: colour),
        margin: const EdgeInsets.all(10.0),
        child: childCard,
      ),
    );
  }
}
