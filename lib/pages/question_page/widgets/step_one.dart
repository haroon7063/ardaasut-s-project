import 'package:flutter/material.dart';

import 'dashed_border_container.dart';

class StepOne extends StatefulWidget {
  final String question;
  final String question2;
  final String question3;

  const StepOne(
      {Key? key,
      required this.question,
      required this.question2,
      required this.question3})
      : super(key: key);

  @override
  _StepOneState createState() => _StepOneState();
}

class _StepOneState extends State<StepOne> {
  TextEditingController answerController = TextEditingController();
  TextEditingController answerController2 = TextEditingController();
  TextEditingController answerController3 = TextEditingController();
  List<String> moods = ['Happy', 'Sad', 'Excited', 'Calm', 'Angry'];
  String selectedMood = 'Happy';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DashedBorderContainer(
          borderWidth: 2,
          child: const Text(
            'Which one describes your situation best?',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          widget.question,
          style: const TextStyle(fontSize: 18),
        ),
        TextFormField(
          controller: answerController,
          decoration: const InputDecoration(labelText: 'Your answer'),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          widget.question2,
          style: const TextStyle(fontSize: 18),
        ),
        TextFormField(
          controller: answerController2,
          decoration: const InputDecoration(labelText: 'Your answer'),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          widget.question2,
          style: const TextStyle(fontSize: 18),
        ),
        DropdownButton<String>(
          value: selectedMood,
          onChanged: (String? newValue) {
            setState(() {
              selectedMood = newValue!;
            });
          },
          borderRadius: BorderRadius.circular(20),
          padding: const EdgeInsetsDirectional.symmetric(horizontal: 20),
          items: moods.map((String mood) {
            return DropdownMenuItem<String>(
              value: mood,
              child: Text(mood),
            );
          }).toList(),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          widget.question3,
          style: const TextStyle(fontSize: 18),
        ),
        TextFormField(
          controller: answerController3,
          decoration: const InputDecoration(labelText: 'Your answer'),
        ),
      ],
    );
  }
}
