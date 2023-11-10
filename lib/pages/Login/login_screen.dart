import 'dart:io';

import 'package:fiverr_project_ardaasut/pages/Login/widgets/custom_stadium_button.dart';
import 'package:fiverr_project_ardaasut/pages/question_page/questionScreen.dart';
import 'package:fiverr_project_ardaasut/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
        systemNavigationBarColor: Theme.of(context).colorScheme.secondary,
        systemNavigationBarDividerColor:
            Theme.of(context).colorScheme.onSecondary,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarContrastEnforced: true,
        statusBarColor: Theme.of(context).colorScheme.secondary));
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              children: [
                const Spacer(flex: 1),
                const Image(
                  image: AssetImage(
                    'assets/images/psychology.png',
                  ),
                  width: 200,
                  height: 200,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Self Heal App',
                  style: Utils.mediumTextStyle.copyWith(
                      color: Theme.of(context).colorScheme.onPrimaryContainer),
                ),
                const Spacer(
                  flex: 2,
                ),
                Column(
                  children: [
                    CustomStadiumButton(
                      onPress: () => Navigator.push(
                          context,
                          Theme.of(context).platform == TargetPlatform.android
                              ? PageRouteBuilder(
                                  barrierDismissible: true,
                                  pageBuilder: (context, animation,
                                          secondaryAnimation) =>
                                      const QuestionScreen(),
                                  transitionsBuilder: (context, animation,
                                      secondaryAnimation, child) {
                                    final offsetTween = Tween(
                                            begin: const Offset(1.0, 0.0),
                                            end: Offset.zero)
                                        .chain(
                                            CurveTween(curve: Curves.easeIn));
                                    final offsetAnimation =
                                        animation.drive(offsetTween);
                                    return TweenAnimationBuilder(
                                      tween: Tween(
                                          begin: const Offset(1.0, 0.0),
                                          end: const Offset(0.0, 0.0)),
                                      duration: const Duration(seconds: 2),
                                      child: child,
                                      builder: (context, value, child) =>
                                          SlideTransition(
                                        position: offsetAnimation,
                                        child: child,
                                      ),
                                    );
                                  },
                                )
                              : CupertinoPageRoute(
                                  builder: (context) {
                                    return const QuestionScreen();
                                  },
                                )),
                      buttonText: 'Login',
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    CustomStadiumButton(
                      onPress: () {},
                      buttonText: 'SignUp',
                    )
                  ],
                )
              ],
            )));
  }
}
