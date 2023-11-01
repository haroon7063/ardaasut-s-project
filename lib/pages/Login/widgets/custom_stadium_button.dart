import 'package:fiverr_project_ardaasut/utils/constants.dart';
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
      onTap: () {},
      child: Container(
        width: double.infinity,
        height: 70,
        decoration:
            const ShapeDecoration(shape: StadiumBorder(), color: Colors.white),
        child: Center(
            child: Text(
          buttonText,
          style: Utils.mediumTextStyle,
        )),
      ),
    );
  }
}
