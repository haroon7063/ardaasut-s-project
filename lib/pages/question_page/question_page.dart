import 'package:fiverr_project_ardaasut/pages/question_page/widgets/step_one.dart';
import 'package:fiverr_project_ardaasut/pages/question_page/widgets/step_three.dart';
import 'package:fiverr_project_ardaasut/pages/question_page/widgets/step_two.dart';
import 'package:fiverr_project_ardaasut/pages/tab_view/tab_Screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fiverr_project_ardaasut/pages/question_page/widgets/dashed_border_container.dart';
import 'package:fiverr_project_ardaasut/utils/demo_data.dart';
import '../../utils/constants.dart';

class QuestionScreen extends StatefulWidget {
  @override
  _QuestionScreenState createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  int _currentStep = 0;

  static List<bool> _completedSteps = [false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Utils.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
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
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: Stepper(
                  type: StepperType.horizontal,
                  steps: [
                    Step(
                      title: const Text(''),
                      content: BasicInfoStep(),
                      isActive: _completedSteps[0],
                      state: _completedSteps[0]
                          ? StepState.complete
                          : StepState.indexed,
                    ),
                    Step(
                      title: const Text(''),
                      isActive: _completedSteps[1],
                      content: const StepOne(
                        question: 'What is your favorite color?',
                        question2: 'What about your education?',
                        question3: 'dsfad sdfasd fdsf f asf as',
                      ),
                      state: _completedSteps[1]
                          ? StepState.complete
                          : StepState.indexed,
                    ),
                    Step(
                      title: const Text(''),
                      content: StepTwo(
                          question:
                              'What is your highest vision or wish? What do you want to see?'),
                      isActive: _completedSteps[2],
                      state: _completedSteps[2]
                          ? StepState.complete
                          : StepState.indexed,
                    ),
                    Step(
                      title: const Text(''),
                      content: const StepThree(),
                      isActive: _completedSteps[3],
                      state: _completedSteps[3]
                          ? StepState.complete
                          : StepState.indexed,
                    ),
                  ],
                  controlsBuilder: (context, details) {
                    return Column(
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            OutlinedButton.icon(
                              icon: Icon(
                                Icons.arrow_back,
                                color:
                                    Theme.of(context).colorScheme.onBackground,
                              ),
                              onPressed: details.onStepCancel,
                              label: Text(
                                'Back',
                                style: TextStyle(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onBackground,
                                ),
                              ),
                            ),
                            FilledButton(
                              onPressed: details.onStepContinue,
                              style: FilledButton.styleFrom(
                                backgroundColor:
                                    Theme.of(context).colorScheme.onBackground,
                              ),
                              child: const Text('Next'),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                      ],
                    );
                  },
                  currentStep: _currentStep,
                  physics: const BouncingScrollPhysics(),
                  onStepContinue: () {
                    if (_currentStep < 3) {
                      setState(() {
                        _currentStep += 1;
                        _completedSteps[_currentStep - 1] = true;
                      });
                    } else {
                      // Handle completion, for example, submit the data
                      _submitData();
                    }
                  },
                  onStepCancel: () {
                    if (_currentStep > 0) {
                      setState(() {
                        _currentStep -= 1;
                        _completedSteps[_currentStep] = false;
                      });
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _submitData() {
    Navigator.pushReplacement(
        context,
        Theme.of(context).platform == TargetPlatform.android
            ? PageRouteBuilder(
                barrierDismissible: true,
                pageBuilder: (context, animation, secondaryAnimation) =>
                    const HomePage(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  final offsetTween =
                      Tween(begin: const Offset(1.0, 0.0), end: Offset.zero)
                          .chain(CurveTween(curve: Curves.easeIn));
                  final offsetAnimation = animation.drive(offsetTween);
                  return TweenAnimationBuilder(
                    tween: Tween(
                        begin: const Offset(1.0, 0.0),
                        end: const Offset(0.0, 0.0)),
                    duration: const Duration(seconds: 2),
                    child: child,
                    builder: (context, value, child) => SlideTransition(
                      position: offsetAnimation,
                      child: child,
                    ),
                  );
                },
              )
            : CupertinoPageRoute(
                builder: (context) {
                  return const HomePage();
                },
              ));
  }
}

class BasicInfoStep extends StatefulWidget {
  @override
  _BasicInfoStepState createState() => _BasicInfoStepState();
}

class _BasicInfoStepState extends State<BasicInfoStep> {
  List<String> options = ['Option A', 'Option B', 'Option C', 'Option D'];
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
                      boxShadow: const [
                        BoxShadow(
                            blurRadius: 3,
                            spreadRadius: 1,
                            offset: Offset(-1, -1),
                            color: Colors.grey),
                        BoxShadow(
                            blurRadius: 3,
                            spreadRadius: 3,
                            offset: Offset(1, 1),
                            color: Color(0xff14141d))
                      ],
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
