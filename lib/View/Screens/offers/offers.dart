import 'package:bms/utils/color_constant.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/font_constant.dart';

class Offers extends StatefulWidget {
  const Offers({super.key});

  @override
  State<Offers> createState() => _OffersState();
}

class _OffersState extends State<Offers> {
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
            'Offers',
            style: FontConstant.styleMedium(fontSize: 17, color: Colors.black),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: DottedBorder(
            dashPattern: const [3, 2],
            strokeWidth: 1,
            borderType: BorderType.RRect,
            radius: const Radius.circular(8),
            child: Container(
              padding: const EdgeInsets.all(12),
              height: 90,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Column with offer details
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Get Rs.250 Off on 1st Booking',
                          style: FontConstant.styleSemiBold(
                              fontSize: 14, color: Colors.black),
                        ),
                        const SizedBox(height: 10),
                        DottedBorder(
                          color: Colors.red,
                          dashPattern: const [3, 2],
                          strokeWidth: 2,
                          borderType: BorderType.RRect,
                          radius: const Radius.circular(8),
                          child: Container(
                            height: 20,
                            width: 100,
                            decoration: BoxDecoration(
                              color: AppColors.redLight,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'BMB250',
                                    style: FontConstant.styleMedium(
                                      fontSize: 12,
                                      color: Colors.red,
                                    ),
                                  ),
                                  const Icon(
                                    Icons.copy,
                                    color: Colors.red,
                                    size: 15,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed('/offer2');
                    },
                    child: const Icon(
                      Icons.info_outline,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
