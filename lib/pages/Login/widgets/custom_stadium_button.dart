import 'package:flutter/material.dart';

class CustomStadiumButton extends StatelessWidget {
  final VoidCallback onPress;
  final Color backgroundColor = Colors.white;
  final double height = 70;
  final double width = double.infinity;
  final String buttonText;
  const CustomStadiumButton(
      {super.key, required this.onPress, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        width: double.infinity,
        height: 70,
        decoration: const ShapeDecoration(shadows: [
          BoxShadow(
              blurRadius: 3,
              spreadRadius: 3,
              offset: Offset(-1, -1),
              color: Colors.grey),
          BoxShadow(
              blurRadius: 3,
              spreadRadius: 3,
              offset: Offset(1, 1),
              color: Color(0xff14141d))
        ], shape: StadiumBorder(), color: Colors.grey),
        child: Center(
            child: Text(
          buttonText,
          style: const TextStyle(
              fontFamily: 'Rubik_Medium', fontSize: 25, color: Colors.black),
        )),
      ),
    );
  }
}
