import 'package:dotted_line/dotted_line.dart';
import 'package:fiverr_project_ardaasut/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../utils/demo_data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final now = DateTime.now();
  final format = DateFormat.d(); // Date format
  final dayFormat = DateFormat.E(); // Date format

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
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
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
                      boxShadow: Utils.myBoxShadow),
                  child: const Icon(Icons.person_3_outlined),
                ),
              ),
            ),
            const Center(
                child: Text(
              'Good Morning Ardaa',
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Rubik_Regular',
                  fontSize: 26),
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
            const Text(
              'Remember Your Goal:',
              style: TextStyle(
                fontFamily: 'Rubik_SemiBold',
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Utils.backgroundColor,
                  boxShadow: Utils.myBoxShadow),
              child: const Text(
                'Become a Billionaire',
                style: TextStyle(fontSize: 25, fontFamily: 'Rubik_Regular'),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              height: 150,
              padding: const EdgeInsets.only(left: 20, bottom: 20),
              decoration: BoxDecoration(
                  color: const Color(0xff2f3438),
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: Utils.myBoxShadow),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    top: -25,
                    left: 0,
                    child: Text(
                      'Daily Feed',
                      style: TextStyle(
                          color: Colors.grey.shade300,
                          fontFamily: 'Rubik_Bold'),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    top: -4,
                    child: DecoratedBox(
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(30)),
                            color: const Color(0xff0d0f12).withOpacity(0.5)),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'lorem ipsum',
                            style: TextStyle(fontFamily: 'Rubik_italic'),
                          ),
                        )),
                  ),
                  Positioned(
                    top: 20,
                    left: 10,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Program: or Remember',
                          style: TextStyle(
                              fontFamily: 'Rubik_Regular_Bold',
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: Colors.white70),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        RichText(
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                text: '• ',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Rubik_Regular',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey.shade300,
                                ),
                              ),
                              TextSpan(
                                text: 'Your text goes here.',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Rubik_Regular',
                                  color: Colors.grey.shade300,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        RichText(
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                text: '• ',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Rubik_Regular',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey.shade300,
                                ),
                              ),
                              TextSpan(
                                text: 'Your text goes here.',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Rubik_Regular',
                                  color: Colors.grey.shade300,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        RichText(
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                text: '• ',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Rubik_Regular',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey.shade300,
                                ),
                              ),
                              TextSpan(
                                text: 'Your text goes here.',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Rubik_Regular',
                                  color: Colors.grey.shade300,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              height: 150,
              padding: const EdgeInsets.only(left: 20, bottom: 20),
              decoration: BoxDecoration(
                  color: const Color(0xff2f3438),
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: Utils.myBoxShadow),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    top: -25,
                    left: 0,
                    child: Text(
                      'What kind of help do you need?',
                      style: TextStyle(
                          color: Colors.grey.shade300,
                          fontFamily: 'Rubik_Bold'),
                    ),
                  ),
                  Positioned(
                    top: 20,
                    left: 10,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 8,
                        ),
                        RichText(
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                text: '• ',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Rubik_Regular',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey.shade300,
                                ),
                              ),
                              TextSpan(
                                text: 'Your text goes here.',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Rubik_Regular',
                                  color: Colors.grey.shade300,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        RichText(
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                text: '• ',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Rubik_Regular',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey.shade300,
                                ),
                              ),
                              TextSpan(
                                text: 'Your text goes here.',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Rubik_Regular',
                                  color: Colors.grey.shade300,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        RichText(
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                text: '• ',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Rubik_Regular',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey.shade300,
                                ),
                              ),
                              TextSpan(
                                text: 'Your text goes here.',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Rubik_Regular',
                                  color: Colors.grey.shade300,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            DottedLine(
              alignment: WrapAlignment.center,
              direction: Axis.horizontal,
              dashColor: Colors.grey.withOpacity(0.7),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 135,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: data.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    width: 100,
                    // height: 140,
                    margin: const EdgeInsets.only(left: 20),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                              'assets/images/nature${index + 1}.jpg',
                            )),
                        color: const Color(0xff2f3438),
                        borderRadius: BorderRadius.circular(12)),
                    child: Center(
                      child: Wrap(direction: Axis.horizontal, children: [
                        Text(
                          data[index],
                          style: TextStyle(
                              color: Colors.grey.shade200,
                              fontFamily: 'Rubik_Regular'),
                        ),
                      ]),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
