import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final now = DateTime.now();
  final format = DateFormat.d(); // Date format
  final dayFormat = DateFormat.E(); // Date format

  List<String> days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
  List<DateTime> dates = [];

  List<String> data = [
    'Why cant you focus on your work?',
    'Would you like to go for a walk?',
    'Top 50 Tips to get Rich,  Read Article. ',
    'Why cant you focus on your work?',
    'Would you like to go for a walk?',
    'Top 50 Tips to get Rich,  Read Article. '
  ];
  ScrollController scrollController = ScrollController();

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
        backgroundColor: Color(0xff23282C),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          actions: [
            Container(
              width: 40,
              height: 40,
              margin: EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                  color: Color(0xff23282C),
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
            SizedBox(
              width: 10,
            )
          ],
        ),
        body: CustomScrollView(
          controller: scrollController,
          shrinkWrap: true,
          slivers: [
            SliverToBoxAdapter(
              child: Column(children: [
                Center(
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
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                        width: 40,
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Color(0xff23282C),
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
                Text(
                  'Remember Your Goal:',
                  style: TextStyle(
                    fontFamily: 'Rubik',
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0xff23282C),
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
                  child: Text(
                    'Become a Billionaire',
                    style: TextStyle(fontSize: 25, fontFamily: 'Rubik_Regular'),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Divider(),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: 150,
                  padding: EdgeInsets.only(left: 20, bottom: 20),
                  decoration: BoxDecoration(
                      color: Color(0xff2f3438),
                      borderRadius: BorderRadius.circular(30),
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
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(30)),
                                color: Color(0xff0d0f12).withOpacity(0.5)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'lorem ipsum',
                                style: TextStyle(fontFamily: 'Rubik_Regular'),
                              ),
                            )),
                      ),
                      Positioned(
                        top: 20,
                        left: 10,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Program: or Remember',
                              style: TextStyle(
                                  fontFamily: 'Rubik_Regular_Bold',
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white70),
                            ),
                            SizedBox(
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
                SizedBox(
                  height: 10,
                ),
                Divider(),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: 150,
                  padding: EdgeInsets.only(left: 20, bottom: 20),
                  decoration: BoxDecoration(
                      color: Color(0xff2f3438),
                      borderRadius: BorderRadius.circular(30),
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
                            Text(
                              'Program: or Remember',
                              style: TextStyle(
                                  fontFamily: 'Rubik_Regular_Bold',
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white70),
                            ),
                            SizedBox(
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
                SizedBox(
                  height: 10,
                ),
                DottedLine(
                  alignment: WrapAlignment.center,
                  direction: Axis.horizontal,
                  dashColor: Colors.grey.withOpacity(0.7),
                ),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: ListView.separated(
                    itemCount: data.length,
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        width: 20,
                      );
                    },
                    itemBuilder: (context, index) {
                      return Container(
                        width: 100,
                        height: 100,
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: Color(0xff2f3438),
                            borderRadius: BorderRadius.circular(12)),
                        child: Wrap(
                          children: [
                            Text(
                              data[index],
                              style: TextStyle(color: Colors.grey.shade300),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                )
              ]),
            )
          ],
        ));
  }
}
