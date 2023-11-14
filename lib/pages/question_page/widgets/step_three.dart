import 'package:flutter/material.dart';

import '../../../utils/demo_data.dart';
import 'dashed_border_container.dart';

class StepThree extends StatefulWidget {
  const StepThree({super.key});

  @override
  State<StepThree> createState() => _StepThreeState();
}

class _StepThreeState extends State<StepThree> {
  TextEditingController ageController = TextEditingController();
  TextEditingController educationController = TextEditingController();
  TextEditingController jobController = TextEditingController();
  TextEditingController aboutController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Sex : ',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(
              width: 20,
            ),
            DropdownButton<String>(
              value: selectedSex,
              onChanged: (String? newValue) {
                setState(() {
                  selectedSex = newValue!;
                });
              },
              borderRadius: BorderRadius.circular(20),
              padding: const EdgeInsetsDirectional.symmetric(horizontal: 20),
              items: sex.map((String sex) {
                return DropdownMenuItem<String>(
                  value: sex,
                  child: Text(sex),
                );
              }).toList(),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          controller: ageController,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(labelText: 'Age'),
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          controller: educationController,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(labelText: 'Education'),
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          controller: jobController,
          decoration: const InputDecoration(labelText: 'Job'),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Hobby : ',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(
              width: 20,
            ),
            DropdownButton<String>(
              value: selectedHobby,
              onChanged: (String? newValue) {
                setState(() {
                  selectedHobby = newValue!;
                });
              },
              borderRadius: BorderRadius.circular(20),
              padding: const EdgeInsetsDirectional.symmetric(horizontal: 20),
              items: hobby.map((String hobby) {
                return DropdownMenuItem<String>(
                  value: hobby,
                  child: Text(hobby),
                );
              }).toList(),
            ),
          ],
        ),
        TextFormField(
          controller: aboutController,
          maxLength: 200,
          decoration: const InputDecoration(labelText: 'About You'),
        ),
      ],
    );
  }
}
