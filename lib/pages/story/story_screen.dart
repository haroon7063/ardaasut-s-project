import 'package:fiverr_project_ardaasut/utils/constants.dart';
import 'package:flutter/material.dart';

class StoryScreen extends StatefulWidget {
  const StoryScreen({super.key});

  @override
  State<StoryScreen> createState() => _StoryScreenState();
}

class _StoryScreenState extends State<StoryScreen> {
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
          Divider(),
          Center(
              child: Text(
            'Story',
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontFamily: 'Rubik_Regular',
                fontSize: 26),
          )),
          Divider(),
          Expanded(
            flex: 2,
            child: Container(
              height: 300,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.all(30),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Utils.backgroundColor,
                  borderRadius: BorderRadius.circular(20),
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
              child: Scrollbar(
                thickness: 3.0,
                thumbVisibility: true,
                interactive: true,
                child: ListView(
                  children: [
                    Text(
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.' +
                          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
                      style: TextStyle(
                        fontFamily: 'Rubik_Medium',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Divider(),
          Expanded(
            flex: 1,
            child: Container(
              height: 100,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.all(30),
              padding: EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 15,
              ),
              decoration: BoxDecoration(
                  color: Utils.backgroundColor,
                  borderRadius: BorderRadius.circular(20),
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
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Quotes to inspire',
                      style: TextStyle(fontFamily: 'Rubik_SemiBold'),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                      '\"Spread love everywhere you go. Let no one ever come to you without leaving happier.\"'),
                  SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Text('- Mother Teresa'),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
