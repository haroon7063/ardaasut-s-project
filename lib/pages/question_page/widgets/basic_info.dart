import 'package:flutter/material.dart';
import '../../../utils/constants.dart';
import '../../../utils/demo_data.dart';
import 'dashed_border_container.dart';

class BasicInfoStep extends StatefulWidget {
  @override
  _BasicInfoStepState createState() => _BasicInfoStepState();
}

class _BasicInfoStepState extends State<BasicInfoStep> {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 500,
      child: Column(
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
          Expanded(
            child: ListView.builder(
              itemCount: storyData.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: Container(
                    height: 70,
                    width: 230,
                    clipBehavior: Clip.hardEdge,
                    margin:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      color: selectedIndex == index
                          ? Colors.blue.withOpacity(0.2)
                          : Utils.backgroundColor,
                      borderRadius: BorderRadius.circular(14),
                      boxShadow: Utils.myBoxShadow,
                    ),
                    child: Center(
                      child: Wrap(
                        direction: Axis.horizontal,
                        children: [
                          Text(
                            storyData[index]['text'],
                            style: TextStyle(
                              fontSize: 16,
                              color: selectedIndex == index
                                  ? Colors.blue
                                  : Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
