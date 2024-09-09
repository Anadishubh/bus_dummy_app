import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import '../../../utils/color_constant.dart';
import '../../../utils/font_constant.dart';

class Offer2 extends StatefulWidget {
  const Offer2({super.key});

  @override
  State<Offer2> createState() => _Offer2State();
}

class _Offer2State extends State<Offer2> {
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DottedBorder(
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
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
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
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Terms & Conditions',
                style: FontConstant.styleMedium(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                '1. This offer is valid for new users only.\n'
                    '2. The offer can be redeemed only once per user.\n'
                    '3. The offer is applicable on bookings above Rs.500.\n'
                    '4. The offer cannot be combined with any other promotions.\n'
                    '5. The offer is valid until [expiration date].\n'
                    '6. The company reserves the right to modify or cancel the offer at any time without prior notice.\n'
                    '7. For more details, please refer to our terms and conditions on our website.',
                style: FontConstant.styleRegular(
                  fontSize: 14,
                  color: Colors.grey.shade600,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              child: Text(
                'COPY OFFER CODE',
                style: FontConstant.styleRegular(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}