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
                margin: EdgeInsets.only(top: 16, right: 14),
                decoration: BoxDecoration(
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
                child: Icon(Icons.person_3_outlined),
              ),
            ),
          ),
          Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0),
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
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  width: 40,
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Utils.backgroundColor,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: dates[index] == now
                          ? [
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
                            ]
                          : []),
                  child: Column(
                    children: [
                      Text(
                        dayFormat.format(dates[index]),
                        style: TextStyle(fontFamily: 'Rubik_Regular'),
                      ),
                      Text(
                        format.format(dates[index]),
                        style: TextStyle(fontFamily: 'Rubik_Regular'),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Divider(),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
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
                });
              }
            },
            onStepContinue: () {
              if (_index <= 0) {
                setState(() {
                  _index += 1;
                });
              }
            },
            onStepTapped: (int index) {
              setState(() {
                _index = index;
              });
            },
            steps: [
              Step(
                  title: Text(
                    'Building RoadMap',
                    style: TextStyle(fontFamily: 'Rubik_italic'),
                  ),
                  isActive: true,
                  state: StepState.indexed,
                  content: Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    decoration: BoxDecoration(
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
                        DecoratedBox(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Wed 08',
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontFamily: 'Rubik_Regular'),
                              ),
                            ),
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(20)))),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 8.0, left: 10, right: 10),
                          child: Text('Building our roadmap for flutter app'),
                        ),
                        Divider(),
                        Row(
                          children: [
                            Checkbox(
                              value: checkValue,
                              checkColor: Colors.black87,
                              fillColor: MaterialStatePropertyAll(Colors.grey),
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
                  title: Text(
                    'Building RoadMap',
                    style: TextStyle(fontFamily: 'Rubik_italic'),
                  ),
                  isActive: false,
                  state: StepState.indexed,
                  content: Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    decoration: BoxDecoration(
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
                        DecoratedBox(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
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
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 8.0, left: 10, right: 10),
                          child: Text('Building our roadmap for flutter app'),
                        ),
                        Divider(),
                        Row(
                          children: [
                            Checkbox(
                              value: checkValue,
                              checkColor: Colors.black87,
                              fillColor: MaterialStatePropertyAll(Colors.grey),
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
                  title: Text(
                    'Building RoadMap',
                    style: TextStyle(fontFamily: 'Rubik_italic'),
                  ),
                  isActive: false,
                  state: StepState.indexed,
                  content: Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    decoration: BoxDecoration(
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
                        DecoratedBox(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
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
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 8.0, left: 10, right: 10),
                          child: Text('Building our roadmap for flutter app'),
                        ),
                        Divider(),
                        Row(
                          children: [
                            Checkbox(
                              value: checkValue,
                              checkColor: Colors.black87,
                              fillColor: MaterialStatePropertyAll(Colors.grey),
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
                  title: Text(
                    'Building RoadMap',
                    style: TextStyle(fontFamily: 'Rubik_italic'),
                  ),
                  isActive: false,
                  state: StepState.indexed,
                  content: Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    decoration: BoxDecoration(
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
                        DecoratedBox(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Sat 11',
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontFamily: 'Rubik_Regular'),
                              ),
                            ),
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(20)))),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 8.0, left: 10, right: 10),
                          child: Text('Building our roadmap for flutter app'),
                        ),
                        Divider(),
                        Row(
                          children: [
                            Checkbox(
                              value: checkValue,
                              checkColor: Colors.black87,
                              fillColor: MaterialStatePropertyAll(Colors.grey),
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
                decoration: BoxDecoration(
                  color: Utils.backgroundColor,
                  shape: BoxShape.circle,
                ),
                child: Text(
                  stepIndex.toString(),
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey),
                ),
              );
            },
          ))
        ],
      ),
    );
  }
}
