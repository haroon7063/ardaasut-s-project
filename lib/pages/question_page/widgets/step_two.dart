import 'package:flutter/material.dart';

class StepTwo extends StatelessWidget {
  StepTwo({super.key, required this.question});

  final String question;
  final answerController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          question,
          style: TextStyle(fontSize: 18),
        ),
        TextFormField(
          controller: answerController,
          maxLength: 200,
          decoration: InputDecoration(labelText: 'Your answer'),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
    ;
  }
}
