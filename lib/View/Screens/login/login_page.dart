import 'package:bms/utils/font_constant.dart';
import 'package:bms/utils/textfield_constant.dart';
import 'package:flutter/material.dart';

import '../../../utils/images_constant.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController mobileno = TextEditingController();

    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: screenHeight * 0.3,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(Images.grp1),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Text(
            'Enter Mobile Number or Email ID',
            style: FontConstant.styleMedium(fontSize: 16, color: Colors.black),
          ),
          CustomTextField(
            controller: mobileno,
            hintText: 'Enter Mobile Number or Email ID',
            color: Colors.black,
            fillcolor: Colors.white,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                color: Colors.grey,
                width: 100,
                height: 1,
              ),
              const SizedBox(
                width: 10,
              ),
              const Text('OR'),
              const SizedBox(
                width: 10,
              ),
              Container(
                color: Colors.grey,
                width: 100,
                height: 1,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton.icon(
                onPressed: () {},
                label: Image.asset(Images.google,height: 30,),
              ),
              TextButton.icon(
                onPressed: () {},
                label: Image.asset(Images.facebook,height: 30,),
              ),
            ],
          ),

        ],
      ),
    );
  }
}
