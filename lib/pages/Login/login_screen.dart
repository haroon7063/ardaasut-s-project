import 'package:fiverr_project_ardaasut/pages/Login/widgets/custom_stadium_button.dart';
import 'package:fiverr_project_ardaasut/utils/constants.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.purple.shade100.withOpacity(0.7),
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
                    style: Utils.mediumTextStyle.copyWith(color: Colors.white),
                  ),
                  Spacer(
                    flex: 2,
                  ),
                  Column(
                    children: [
                      CustomStadiumButton(
                        onPress: () {},
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
