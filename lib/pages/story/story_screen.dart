import 'package:fiverr_project_ardaasut/utils/constants.dart';
import 'package:fiverr_project_ardaasut/utils/demo_data.dart';
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
          const Divider(),
          const Center(
              child: Text(
            'Story',
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontFamily: 'Rubik_Regular',
                fontSize: 26),
          )),
          const Divider(),
          Expanded(
            flex: 2,
            child: Container(
              height: 300,
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.all(30),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Utils.backgroundColor,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: Utils.myBoxShadow),
              child: Scrollbar(
                thickness: 3.0,
                thumbVisibility: true,
                interactive: true,
                child: ListView(
                  children: const [
                    Text(
                      story,
                      style: TextStyle(
                        fontFamily: 'Rubik_Medium',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Divider(),
          Expanded(
            flex: 1,
            child: Container(
              height: 100,
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.all(30),
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 15,
              ),
              decoration: BoxDecoration(
                  color: Utils.backgroundColor,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: Utils.myBoxShadow),
              child: const Column(
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
                      '\"Spread love everywhere you go.Let no one ever come to you without leaving happier.\"'),
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
