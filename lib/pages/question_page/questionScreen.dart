import 'package:fiverr_project_ardaasut/pages/question_page/widgets/dashed_border_container.dart';
import 'package:fiverr_project_ardaasut/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  List<Map<String, dynamic>> storyData = [
    {
      'text':
          'Once upon a time, you find yourself in a magical forest. What do you do?',
      'choices': [
        {'text': 'Explore the forest', 'nextStoryIndex': 1},
        {'text': 'Run away', 'nextStoryIndex': 2},
      ],
    },
    {
      'text':
          'You discover a hidden treasure chest. What would you like to do?',
      'choices': [
        {'text': 'Open the chest', 'nextStoryIndex': 3},
        {'text': 'Leave it and keep exploring', 'nextStoryIndex': 4},
      ],
    },
    {
      'text': 'You run away from the forest in fear. The end.',
      'choices': [],
    },
    {
      'text':
          'You opened the chest and found a pile of gold! You became rich. The end.',
      'choices': [],
    },
    {
      'text':
          'You continue exploring the forest and have more adventures. The end.',
      'choices': [],
    },
  ];
  int index = 0;

  void incrementIndex() {
    setState(() {
      if (index < 4) {
        index++;
      }
    });
  }

  void decrementIndex() {
    setState(() {
      if (index > 0) {
        index--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Introduce Yourself!',
                      style: Utils.mediumTextStyle.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                    ),
                    SizedBox(
                      width: double.maxFinite,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Divider(
                          height: 1,
                          thickness: 1.5,
                          endIndent: 50,
                          color: Theme.of(context).colorScheme.outline,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              DashedBorderContainer(
                borderWidth: 2,
                child: Text(
                  'Which one describes your situation best?',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Expanded(
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      return Container(
                        height: 70,
                        width: MediaQuery.of(context).size.width * 0.9,
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.background,
                            borderRadius: BorderRadius.circular(14),
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 3,
                                  spreadRadius: 2,
                                  offset: Offset(1, 1),
                                  color: Colors.black87),
                              BoxShadow(
                                  blurRadius: 3,
                                  spreadRadius: 1,
                                  offset: Offset(-1, -1),
                                  color: Colors.grey.shade500)
                            ]
                            ),
                        child: Center(
                            child: Text(
                          '${storyData[index]['text']}',
                          style: TextStyle(fontSize: 16),
                        )),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: 20,
                      );
                    },
                    itemCount: storyData.length),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButton.icon(
                    icon: Icon(Icons.arrow_back,
                        color: Theme.of(context).colorScheme.onBackground),
                    onPressed: () => decrementIndex(),
                    label: Text(
                      'Back',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onBackground),
                    ),
                  ),
                  FilledButton(
                    onPressed: () => incrementIndex(),
                    style: FilledButton.styleFrom(
                        backgroundColor:
                            Theme.of(context).colorScheme.onBackground),
                    child: Text('Next'),
                  )
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: AnimatedSmoothIndicator(
                  activeIndex: index,
                  curve: Curves.easeInOutSine,
                  duration: Duration(seconds: 1),
                  effect: SwapEffect(
                    type: SwapType.yRotation,
                    dotColor: Colors.white,
                    activeDotColor: Theme.of(context).colorScheme.secondary,
                  ),
                  count: 5,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
