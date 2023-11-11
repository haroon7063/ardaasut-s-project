import 'package:fiverr_project_ardaasut/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyJourneyScreen extends StatefulWidget {
  const MyJourneyScreen({super.key});

  @override
  State<MyJourneyScreen> createState() => _MyJourneyScreenState();
}

class _MyJourneyScreenState extends State<MyJourneyScreen> {
  final now = DateTime.now();
  final format = DateFormat.d(); // Date format
  final dayFormat = DateFormat.E(); // Date format

  List<String> days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
  List<DateTime> dates = [];
  int _index = 0;
  bool checkValue = false;
  static List<bool> _completed = [false, false, false, false];

  @override
  void initState() {
    // Calculate dates 3 days before and after today
    for (int i = -3; i <= 3; i++) {
      final date = now.add(Duration(days: i));
      dates.add(date);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Utils.backgroundColor,
      body: Column(
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: () {},
              child: Container(
                width: 40,
                height: 40,
                margin: const EdgeInsets.only(top: 16, right: 14),
                decoration: const BoxDecoration(
                    color: Utils.backgroundColor,
                    shape: BoxShape.circle,
                    boxShadow: [
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
                    ]),
                child: const Icon(Icons.person_3_outlined),
              ),
            ),
          ),
          const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 16.0),
                child: Text(
                  'My Journey',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Rubik_Bold',
                      fontSize: 26),
                ),
              )),
          Container(
            height: 70,
            child: ListView.builder(
              itemCount: dates.length,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  width: 40,
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Utils.backgroundColor,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: dates[index] == now
                          ? [
                              const BoxShadow(
                                  blurRadius: 3,
                                  spreadRadius: 1,
                                  offset: Offset(-1, -1),
                                  color: Colors.grey),
                              const BoxShadow(
                                  blurRadius: 3,
                                  spreadRadius: 3,
                                  offset: Offset(1, 1),
                                  color: Color(0xff14141d))
                            ]
                          : []),
                  child: Column(
                    children: [
                      Text(
                        dayFormat.format(dates[index]),
                        style: const TextStyle(fontFamily: 'Rubik_Regular'),
                      ),
                      Text(
                        format.format(dates[index]),
                        style: const TextStyle(fontFamily: 'Rubik_Regular'),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          const Divider(),
          const SizedBox(
            height: 10,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              'You have Accomplished so Far \n Never Understimate your Work.',
              style: TextStyle(fontFamily: 'Rubik_Regular', fontSize: 20),
            ),
          ),
          Expanded(
              child: Stepper(
            currentStep: _index,
            onStepCancel: () {
              if (_index > 0) {
                setState(() {
                  _index -= 1;
                  _completed[_index - 1] = false;
                });
              }
            },
            onStepContinue: () {
              if (_index < 3) {
                setState(() {
                  _index += 1;
                  _completed[_index - 1] = true;
                });
              } else {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  shape: StadiumBorder(),
                  duration: Duration(seconds: 1),
                  backgroundColor: Colors.grey,
                  content: Text('You are all Done. Very Good    🙌'),
                ));
              }
            },
            onStepTapped: (int index) {
              setState(() {
                _index = index;
              });
            },
            steps: [
              Step(
                  title: const Text(
                    'Building RoadMap',
                    style: TextStyle(fontFamily: 'Rubik_italic'),
                  ),
                  isActive: _completed[0],
                  state: StepState.indexed,
                  content: Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    decoration: const BoxDecoration(
                        color: Utils.backgroundColor,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20)),
                        boxShadow: [
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
                        ]),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const DecoratedBox(
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(20))),
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Wed 08',
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontFamily: 'Rubik_Regular'),
                              ),
                            )),
                        const SizedBox(
                          height: 10,
                        ),
                        const Padding(
                          padding:
                              EdgeInsets.only(top: 8.0, left: 10, right: 10),
                          child: Text('Building our roadmap for flutter app'),
                        ),
                        const Divider(),
                        Row(
                          children: [
                            Checkbox(
                              value: checkValue,
                              checkColor: Colors.black87,
                              fillColor:
                                  const MaterialStatePropertyAll(Colors.grey),
                              activeColor: Colors.grey.shade900,
                              onChanged: (value) {
                                setState(() {
                                  checkValue = !checkValue;
                                });
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  )),
              Step(
                  title: const Text(
                    'Building RoadMap',
                    style: TextStyle(fontFamily: 'Rubik_italic'),
                  ),
                  isActive: _completed[1],
                  state: StepState.indexed,
                  content: Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    decoration: const BoxDecoration(
                        color: Utils.backgroundColor,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20)),
                        boxShadow: [
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
                        ]),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const DecoratedBox(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Thu 09',
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontFamily: 'Rubik_Regular'),
                              ),
                            ),
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(20)))),
                        const SizedBox(
                          height: 10,
                        ),
                        const Padding(
                          padding:
                              EdgeInsets.only(top: 8.0, left: 10, right: 10),
                          child: Text('Building our roadmap for flutter app'),
                        ),
                        const Divider(),
                        Row(
                          children: [
                            Checkbox(
                              value: checkValue,
                              checkColor: Colors.black87,
                              fillColor:
                                  const MaterialStatePropertyAll(Colors.grey),
                              activeColor: Colors.grey.shade900,
                              onChanged: (value) {
                                setState(() {
                                  checkValue = !checkValue;
                                });
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  )),
              Step(
                  title: const Text(
                    'Building RoadMap',
                    style: TextStyle(fontFamily: 'Rubik_italic'),
                  ),
                  isActive: _completed[2],
                  state: StepState.indexed,
                  content: Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    decoration: const BoxDecoration(
                        color: Utils.backgroundColor,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20)),
                        boxShadow: [
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
                        ]),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const DecoratedBox(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Fri 10',
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontFamily: 'Rubik_Regular'),
                              ),
                            ),
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(20)))),
                        const SizedBox(
                          height: 10,
                        ),
                        const Padding(
                          padding:
                              EdgeInsets.only(top: 8.0, left: 10, right: 10),
                          child: Text('Building our roadmap for flutter app'),
                        ),
                        const Divider(),
                        Row(
                          children: [
                            Checkbox(
                              value: checkValue,
                              checkColor: Colors.black87,
                              fillColor:
                                  const MaterialStatePropertyAll(Colors.grey),
                              activeColor: Colors.grey.shade900,
                              onChanged: (value) {
                                setState(() {
                                  checkValue = !checkValue;
                                });
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  )),
              Step(
                  title: const Text(
                    'Building RoadMap',
                    style: TextStyle(fontFamily: 'Rubik_italic'),
                  ),
                  isActive: _completed[3],
                  state: StepState.indexed,
                  content: Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    decoration: const BoxDecoration(
                        color: Utils.backgroundColor,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20)),
                        boxShadow: [
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
                        ]),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const DecoratedBox(
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(20))),
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Sat 11',
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontFamily: 'Rubik_Regular'),
                              ),
                            )),
                        const SizedBox(
                          height: 10,
                        ),
                        const Padding(
                          padding:
                              EdgeInsets.only(top: 8.0, left: 10, right: 10),
                          child: Text('Building our roadmap for flutter app'),
                        ),
                        const Divider(),
                        Row(
                          children: [
                            Checkbox(
                              value: checkValue,
                              checkColor: Colors.black87,
                              fillColor:
                                  const MaterialStatePropertyAll(Colors.grey),
                              activeColor: Colors.grey.shade900,
                              onChanged: (value) {
                                setState(() {
                                  checkValue = !checkValue;
                                });
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  )),
            ],
            type: StepperType.vertical,
            stepIconBuilder: (stepIndex, stepState) {
              return Container(
                width: 20,
                height: 20,
                decoration: const BoxDecoration(
                  color: Utils.backgroundColor,
                  shape: BoxShape.circle,
                ),
                child: Text(
                  stepIndex.toString(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.grey),
                ),
              );
            },
          ))
        ],
      ),
    );
  }
}
