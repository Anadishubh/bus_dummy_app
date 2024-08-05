import 'package:bms/utils/button_constant.dart';
import 'package:bms/utils/color_constant.dart';
import 'package:bms/utils/font_constant.dart';
import 'package:bms/utils/textfield_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/images_constant.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isOtpRequested = false;
  final TextEditingController mobileNo = TextEditingController();
  final List<TextEditingController> _otpControllers =
  List.generate(4, (index) => TextEditingController());
  final _mobileNoKey = GlobalKey<FormState>();
  final _otpKey = GlobalKey<FormState>();

  @override
  void dispose() {
    for (var controller in _otpControllers) {
      controller.dispose();
    }
    mobileNo.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
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
            Padding(
              padding: EdgeInsets.only(
                left: screenWidth * 0.06,
                top: screenHeight * 0.04,
              ),
              child: Text(
                'Enter Mobile Number or Email ID',
                style:
                FontConstant.styleMedium(fontSize: 16, color: Colors.black),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: screenWidth * 0.06,
                right: screenWidth * 0.06,
                top: screenHeight * 0.015,
              ),
              child: Form(
                key: _mobileNoKey,
                child: CustomTextField(
                  controller: mobileNo,
                  hintText: 'Enter Mobile Number or Email ID',
                  color: Colors.black,
                  fillcolor: Colors.white,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter mobile number or email ID';
                    }
                    if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
                      return 'Invalid phone number';
                    }
                    return null;
                  },
                ),
              ),
            ),
            if (_isOtpRequested) ...[
              Padding(
                padding: EdgeInsets.only(
                  left: screenWidth * 0.06,
                  top: screenHeight * 0.015,
                ),
                child: Text(
                  'Verify OTP',
                  style: FontConstant.styleMedium(
                      fontSize: 16, color: Colors.black),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: screenWidth * 0.07,
                  right: screenWidth * 0.07,
                  top: screenHeight * 0.015,
                ),
                child: Form(
                  key: _otpKey,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(
                      4,
                          (index) => _buildOtpTextField(index),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: screenHeight * 0.03,
              )
            ],
            if (!_isOtpRequested) ...[
              Padding(
                padding: EdgeInsets.only(
                  top: screenHeight * 0.03,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      color: Colors.grey,
                      width: screenWidth * 0.3,
                      height: screenHeight * 0.001,
                    ),
                    SizedBox(width: screenWidth * 0.02),
                    const Text('OR'),
                    SizedBox(width: screenWidth * 0.02),
                    Container(
                      color: Colors.grey,
                      width: screenWidth * 0.3,
                      height: screenHeight * 0.001,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: screenHeight * 0.03,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton.icon(
                      onPressed: () {},
                      label: Image.asset(
                        Images.google,
                        height: screenHeight * 0.04,
                      ),
                    ),
                    TextButton.icon(
                      onPressed: () {},
                      label: Image.asset(
                        Images.facebook,
                        height: screenHeight * 0.04,
                      ),
                    ),
                  ],
                ),
              ),
            ],
            Stack(
              children: [
                Center(
                  child: Image.asset(
                    Images.vector,
                    fit: BoxFit.fill,
                    height: screenHeight * 0.41,
                    width: double.infinity,
                  ),
                ),
                if (_isOtpRequested) ...[
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Don’t received OTP?',
                            style: FontConstant.styleRegular(
                                fontSize: 16, color: Colors.black),
                          ),
                          SizedBox(
                            width: screenWidth * 0.01,
                          ),
                          Text(
                            'Send Again',
                            style: FontConstant.styleRegular(
                                fontSize: 16, color: AppColors.primaryColor),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: screenHeight * 0.01,
                      ),
                      Text(
                        'Code in 00:15s',
                        style: FontConstant.styleRegular(
                            fontSize: 16, color: Colors.black),
                      )
                    ],
                  ),
                ],
                Positioned(
                  bottom: screenHeight * 0.1,
                  left: screenWidth * 0.1,
                  right: screenWidth * 0.1,
                  child: CustomButton(
                    text: _isOtpRequested ? 'Submit OTP' : 'Get OTP',
                    onPressed: () {
                      if (_isOtpRequested) {
                        // Validate OTP
                        if (_otpKey.currentState?.validate() ?? false) {
                          Get.offAndToNamed('/bottom');
                        }
                      } else {
                        // Validate Mobile Number
                        if (_mobileNoKey.currentState?.validate() ?? false) {
                          setState(() {
                            _isOtpRequested = true; // Show OTP input fields
                          });
                        }
                      }
                    },
                    color: AppColors.buttonColor,
                    textStyle: FontConstant.styleRegular(
                        fontSize: 18, color: Colors.white),
                  ),
                ),
                Positioned(
                  bottom: screenHeight * 0.035,
                  left: screenWidth * 0.14,
                  right: screenWidth * 0.14,
                  child: Text(
                    textAlign: TextAlign.center,
                    'By pressing this you agree to our privacy policy and Terms and Conditions',
                    style: FontConstant.styleRegular(
                        fontSize: 12, color: Colors.black),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOtpTextField(int index) {
    return SizedBox(
      width: 60,
      child: TextFormField(
        controller: _otpControllers[index],
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        maxLength: 1,
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          counter: const Offstage(),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(color: AppColors.primaryColor),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          contentPadding: const EdgeInsets.symmetric(),
        ),
        onChanged: (value) {
          if (value.length == 1 && index < 3) {
            FocusScope.of(context).nextFocus();
          } else if (value.isEmpty && index > 0) {
            FocusScope.of(context).previousFocus();
          }
        },
        validator: (value) {
          if (value == null || value.isEmpty) {
            return '';
          }
          return null;
        },
      ),
    );
  }
}