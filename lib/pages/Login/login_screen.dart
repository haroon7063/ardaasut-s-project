import 'package:fiverr_project_ardaasut/pages/Login/widgets/custom_stadium_button.dart';
import 'package:fiverr_project_ardaasut/pages/question_page/questionScreen.dart';
import 'package:fiverr_project_ardaasut/utils/constants.dart';
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
            child: Container(
              child: Column(
                children: [
                  Spacer(flex: 1),
                  Image(
                    image: AssetImage(
                      'assets/images/psychology.png',
                    ),
                    width: 200,
                    height: 200,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Self Heal App',
                    style: Utils.mediumTextStyle.copyWith(
                        color:
                            Theme.of(context).colorScheme.onPrimaryContainer),
                  ),
                  Spacer(
                    flex: 2,
                  ),
                  Column(
                    children: [
                      CustomStadiumButton(
                        onPress: () => Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder:
                                  (context, animation, secondaryAnimation) =>
                                      QuestionScreen(),
                              transitionsBuilder: (context, animation,
                                  secondaryAnimation, child) {
                                final offsetTween = Tween(
                                        begin: Offset(1.0, 0.0),
                                        end: Offset.zero)
                                    .chain(CurveTween(curve: Curves.easeIn));
                                final offsetAnimation =
                                    animation.drive(offsetTween);
                                return TweenAnimationBuilder(
                                  tween: Tween(
                                      begin: Offset(1.0, 0.0),
                                      end: Offset(0.0, 0.0)),
                                  duration: Duration(seconds: 2),
                                  child: child,
                                  builder: (context, value, child) =>
                                      SlideTransition(
                                    position: offsetAnimation,
                                    child: child,
                                  ),
                                );
                              },
                            )),
                        buttonText: 'Login',
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      CustomStadiumButton(
                        onPress: () {},
                        buttonText: 'SignUp',
                      )
                    ],
                  )
                ],
              ),
            )));
  }
}
