import 'package:flutter/material.dart';
import '../constants.dart';

class CommonButton extends StatelessWidget {
  const CommonButton({super.key, required this.text, required this.onPress});
  final String text;
  final Function onPress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPress(),
      child: Container(
        color: kBottomButtonColor,
        width: double.infinity,
        alignment: Alignment.center,
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}
