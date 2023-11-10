import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff23282C),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          GestureDetector(
            onTap: () {},
            child: Container(
              width: 40,
              height: 40,
              margin: const EdgeInsets.only(top: 10),
              decoration: const BoxDecoration(
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
              child: const Icon(Icons.person_3_outlined),
            ),
          ),
          const SizedBox(
            width: 10,
          )
        ],
      ),
      body: ListView(
        children: [
          const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 16.0),
                child: Text(
                  'Discover',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Rubik_Bold',
                      fontSize: 26),
                ),
              )),
          const Divider(),
          Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Paths:',
                    style: TextStyle(fontFamily: 'Rubik_SemiBold'),
                  ),
                ),
              ),
              SizedBox(
                height: 160,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                        width: 120,
                        padding: const EdgeInsets.all(8),
                        margin: const EdgeInsets.only(
                            left: 24, top: 10, bottom: 10),
                        decoration: BoxDecoration(
                          color: const Color(0xff23282C),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
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
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Focus Path'),
                            const Divider(),
                            Wrap(
                              direction: Axis.horizontal,
                              children: [
                                Text('Reminder and Guidence Path \n (14 days)'),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                    itemCount: 6),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const Divider(),
          const Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Quotes:',
                style: TextStyle(fontFamily: 'Rubik_SemiBold'),
              ),
            ),
          ),
          SizedBox(
            height: 120,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    width: 90,
                    padding: const EdgeInsets.all(8),
                    margin:
                        const EdgeInsets.only(left: 24, top: 10, bottom: 10),
                    decoration: BoxDecoration(
                        color: const Color(0xff23282C),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                                'assets/images/nature${index + 1}.jpg')),
                        gradient: RadialGradient(
                            radius: 1.5,
                            colors: [Colors.grey.shade700, Color(0xff23282C)]),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 3,
                              spreadRadius: 1,
                              offset: Offset(-1, -1),
                              color: Colors.grey.shade700),
                          const BoxShadow(
                              blurRadius: 3,
                              spreadRadius: 3,
                              offset: Offset(1, 1),
                              color: Color(0xff14141d))
                        ]),
                    child: const Wrap(children: [
                      Text(
                        '\"Be Positive, Spread Love.\"',
                        style: TextStyle(fontFamily: 'Rubik_Medium'),
                      )
                    ]),
                  );
                },
                itemCount: 5),
          ),
          const SizedBox(
            height: 10,
          ),
          const Divider(),
          const Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Articles and Shorts',
                style: TextStyle(fontFamily: 'Rubik_SemiBold'),
              ),
            ),
          ),
          SizedBox(
            height: 200,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    height: 70,
                    width: 130,
                    padding: const EdgeInsets.all(8),
                    margin:
                        const EdgeInsets.only(left: 24, top: 10, bottom: 10),
                    decoration: const BoxDecoration(
                        color: Color(0xff23282C),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 1,
                              spreadRadius: 0,
                              offset: Offset(-1, -1),
                              color: Colors.grey),
                          BoxShadow(
                              blurRadius: 1,
                              spreadRadius: 0,
                              offset: Offset(1, 1),
                              color: Color(0xff14141d))
                        ]),
                    child: ListView(children: [
                      ReadMoreText(
                        'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
                        style: TextStyle(fontFamily: 'Rubik_Regular'),
                        trimLines: 1,
                        trimLength: 90,
                        trimCollapsedText: 'Read More',
                        colorClickableText: Colors.deepPurple.shade200,
                        lessStyle: TextStyle(
                            color: Colors.deepPurple.shade200,
                            fontFamily: 'Rubik_SemiBold'),
                        moreStyle: TextStyle(
                            color: Colors.deepPurple.shade200,
                            fontFamily: 'Rubik_SemiBold'),
                      )
                    ]),
                  );
                },
                itemCount: 5),
          ),
        ],
      ),
    );
  }
}
