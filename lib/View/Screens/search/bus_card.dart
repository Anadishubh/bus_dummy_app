import 'package:bms/utils/color_constant.dart';
import 'package:bms/utils/font_constant.dart';
import 'package:flutter/material.dart';
import '../../../utils/images_constant.dart';

class BusCard extends StatelessWidget {
  String? imagePath;
  final String money;
  final String subHeading;
  final String description;
  final int seatsLeft;
  final bool showFlashOffer;

    BusCard({
    super.key,
    this.imagePath,
    required this.money,
    required this.description,
    required this.seatsLeft,
    required this.subHeading,
    this.showFlashOffer = false,
  });

  @override
  Widget build(BuildContext context) {
    Color backgroundColor;
    Color textColor;
    if (seatsLeft < 10) {
      backgroundColor = AppColors.redLight;
      textColor = Colors.red;
    } else if (seatsLeft >= 10 && seatsLeft < 15) {
      backgroundColor = Colors.yellow.shade100;
      textColor = Colors.yellow.shade700;
    } else {
      backgroundColor = AppColors.greenLight;
      textColor = Colors.green;
    }
    return Column(
      children: [
        Card(
          color: Colors.white,
          margin: const EdgeInsets.symmetric(horizontal: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 2,
          child: Padding(
            padding:
                const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      '23:59',
                      style: FontConstant.styleSemiBold(
                          fontSize: 16, color: Colors.black),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const Text(
                      '<- - -',
                      style: TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Container(
                      width: 60,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(5)),
                      child: Center(
                          child: Text(
                        '5h. 20m',
                        style: FontConstant.styleRegular(
                            fontSize: 11, color: Colors.grey.shade600),
                      )),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const Text(
                      '- - ->',
                      style: TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      '05:20',
                      style: FontConstant.styleSemiBold(
                          fontSize: 16, color: Colors.black),
                    ),
                    const Spacer(),
                    Text(
                      '₹$money',
                      style: FontConstant.styleBold(
                          fontSize: 16, color: Colors.black),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Container(
                    width: 100,
                    height: 20,
                    decoration: BoxDecoration(
                      color: backgroundColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: Text(
                        '$seatsLeft seats left',
                        style: FontConstant.styleRegular(
                          fontSize: 11,
                          color: textColor,
                        ),
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Image(
                    image: AssetImage(Images.arrow),
                  ),
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          description,
                          textAlign: TextAlign.left,
                          style: FontConstant.styleSemiBold(
                              fontSize: 14, color: Colors.black),
                        ),
                        Text(
                          subHeading,
                          style: FontConstant.styleRegular(
                              fontSize: 12, color: Colors.grey),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          width: 45,
                          height: 15,
                          decoration: const BoxDecoration(
                            color: AppColors.greenLight2,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(5),
                              topRight: Radius.circular(5),
                            ),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.star,
                                color: Colors.white,
                                size: 14,
                              ),
                              Text(
                                '4.2',
                                style: FontConstant.styleSemiBold(
                                    fontSize: 12, color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 45,
                          height: 15,
                          decoration: const BoxDecoration(
                            color: AppColors.greyLight,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(5),
                              bottomRight: Radius.circular(5),
                            ),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.person_outline,
                                color: Colors.black,
                                size: 14,
                              ),
                              Text(
                                '152',
                                style: FontConstant.styleSemiBold(
                                    fontSize: 12, color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.location_on_outlined,
                                  size: 20,
                                  color: Colors.grey,
                                ),
                                Text(
                                  'Bus Tracking',
                                  style: FontConstant.styleRegular(
                                      fontSize: 12, color: Colors.grey),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          // Handle tap
                        },
                        child: Text(
                          'View Details...',
                          style: FontConstant.styleSemiBold(
                              fontSize: 12, color: AppColors.primaryColor),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        if (showFlashOffer)
          Container(
            height: 20,
            width: 340,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xfff85b46),
                  Color(0xffca3f2c),
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(Images.light),
                Text(
                  'Save min 914 with Flash offer !',
                  style: FontConstant.styleRegular(
                      fontSize: 12, color: Colors.white),
                )
              ],
            ),
          ),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }
}
