import 'package:bms/utils/button_constant.dart';
import 'package:bms/utils/color_constant.dart';
import 'package:bms/utils/custom_drop.dart';
import 'package:bms/utils/font_constant.dart';
import 'package:bms/utils/textfield_constant.dart';
import 'package:flutter/material.dart';

class PersonalInfo extends StatefulWidget {
  const PersonalInfo({super.key});

  @override
  State<PersonalInfo> createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {
  TextEditingController name = TextEditingController();
  bool isChecked1 = false;
  bool isChecked2 = false;

  void _handleGenderSelection(bool isMaleSelected) {
    setState(() {
      if (isMaleSelected) {
        isChecked1 = true;
        isChecked2 = false;
      } else {
        isChecked1 = false;
        isChecked2 = true;
      }
    });
  }

  final List<String> _data = ['Dog', 'Cat', 'Rabbit'];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white.withOpacity(0.9),
        appBar: AppBar(
          elevation: 1,
          shadowColor: Colors.black,
          backgroundColor: Colors.white,
          title: Text(
            'Personal Information',
            style: FontConstant.styleMedium(fontSize: 17, color: Colors.black),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Personal Details',
                            style: FontConstant.styleMedium(
                                fontSize: 17, color: Colors.black),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            '*',
                            style: FontConstant.styleMedium(
                                fontSize: 17, color: AppColors.primaryColor),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      CustomTextField(
                        color: Colors.black,
                        hintText: 'Name',
                        fillcolor: Colors.white,
                        controller: name,
                      ),
                      const SizedBox(height: 10),
                      CustomTextField(
                        color: Colors.black,
                        hintText: 'Date of birth',
                        fillcolor: Colors.white,
                        controller: name,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Gender',
                        style: FontConstant.styleMedium(
                            fontSize: 15, color: Colors.grey),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () => _handleGenderSelection(true),
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: isChecked1
                                          ? AppColors.primaryColor
                                          : Colors.grey,
                                      width: 2.0),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Male",
                                      style: FontConstant.styleRegular(
                                          fontSize: 13, color: Colors.black),
                                    ),
                                    Checkbox(
                                      value: isChecked1,
                                      onChanged: (bool? value) {
                                        _handleGenderSelection(true);
                                      },
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      checkColor: Colors.white,
                                      activeColor:
                                          isChecked1 ? Colors.red : Colors.grey,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: GestureDetector(
                              onTap: () => _handleGenderSelection(false),
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: isChecked2
                                          ? AppColors.primaryColor
                                          : Colors.grey,
                                      width: 2.0),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Female",
                                      style: FontConstant.styleRegular(
                                          fontSize: 13, color: Colors.black),
                                    ),
                                    Checkbox(
                                      value: isChecked2,
                                      onChanged: (bool? value) {
                                        _handleGenderSelection(false);
                                      },
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      checkColor: Colors.white,
                                      activeColor:
                                          isChecked2 ? Colors.red : Colors.grey,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Contact Details',
                            style: FontConstant.styleMedium(
                              fontSize: 17,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(width: 5),
                          Text(
                            '*',
                            style: FontConstant.styleMedium(
                              fontSize: 17,
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      const Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomTextField(
                                    color: Colors.black,
                                    hintText: 'Country Code',
                                    fillcolor: Colors.white,
                                  ),
                                ]),
                          ),
                          Expanded(
                            flex: 4,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomTextField(
                                  color: Colors.black,
                                  hintText: 'Mobile',
                                  fillcolor: Colors.white,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const CustomTextField(
                        color: Colors.black,
                        fillcolor: Colors.white,
                        hintText: 'Email ID',
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15, top: 15),
                child: Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Address Details (Optional)',
                        style: FontConstant.styleMedium(
                          fontSize: 17,
                          color: Colors.black,
                        ),
                      ),
                      DropdownWidget(
                        items: _data,
                        hintText: 'Province',
                        onChanged: (String? selectedValue) {
                          print('Selected animal: $selectedValue');
                        },
                      ),
                      DropdownWidget(
                        items: _data,
                        hintText: 'District',
                        onChanged: (String? selectedValue) {
                          print('Selected animal: $selectedValue');
                        },
                      ),
                      DropdownWidget(
                        items: _data,
                        hintText: 'Municipality',
                        onChanged: (String? selectedValue) {
                          print('Selected animal: $selectedValue');
                        },
                      ),
                      DropdownWidget(
                        items: _data,
                        hintText: 'Street/Village/ward no.',
                        onChanged: (String? selectedValue) {
                          print('Selected animal: $selectedValue');
                        },
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: CustomButton(
                  text: 'Save Changes',
                  onPressed: () {},
                  color: AppColors.primaryColor,
                  textStyle: FontConstant.styleRegular(
                      fontSize: 16, color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
