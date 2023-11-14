import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import '../question_page/question_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarContrastEnforced: true,
        statusBarColor: Theme.of(context).colorScheme.secondary));
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
              child: Image.asset(
            'assets/images/login_page.jpg',
            fit: BoxFit.cover,
          )),
          Positioned(
            bottom: 50,
            right: 20,
            left: 20,
            child: GestureDetector(
              onTap: () => Navigator.push(
                  context,
                  Theme.of(context).platform == TargetPlatform.android
                      ? PageRouteBuilder(
                          barrierDismissible: true,
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  QuestionScreen(),
                          transitionsBuilder:
                              (context, animation, secondaryAnimation, child) {
                            final offsetTween = Tween(
                                    begin: const Offset(1.0, 0.0),
                                    end: Offset.zero)
                                .chain(CurveTween(curve: Curves.easeIn));
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
                            return QuestionScreen();
                          },
                        )),
              child: BackdropFilter(
                filter: ColorFilter.mode(Colors.white, BlendMode.saturation),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: [
                      SvgPicture.asset('assets/images/google.svg'),
                      const SizedBox(
                        width: 20,
                      ),
                      const Text(
                        'Sign In with Google',
                        style: TextStyle(
                            fontFamily: 'Rubik_Medium', color: Colors.black),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
