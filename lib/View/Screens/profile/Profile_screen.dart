import 'package:bms/utils/color_constant.dart';
import 'package:bms/utils/font_constant.dart';
import 'package:bms/utils/images_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              // Background image
              Image.asset(
                Images.cyber,
                fit: BoxFit.cover,
                height: screenHeight * 0.25,
                width: double.infinity,
              ),
              // Overlaying text
              Positioned(
                bottom: 20.0,
                left: 15.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hello Ken!', // Static name
                      style: FontConstant.styleMedium(
                        fontSize: 17,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      '+914123498761', // Static number
                      style: FontConstant.styleRegular(
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'Member since Jan 2023', // Static member since
                      style: FontConstant.styleRegular(
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            width: double.infinity,
            height: screenHeight * 0.08,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [AppColors.pink, AppColors.darkPink],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text(
                        '02',
                        style: FontConstant.styleSemiBold(
                          fontSize: 17,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        'Total trips',
                        style: FontConstant.styleMedium(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        '10',
                        style: FontConstant.styleSemiBold(
                          fontSize: 17,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        'Trip this month',
                        style: FontConstant.styleMedium(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        '05',
                        style: FontConstant.styleBold(
                          fontSize: 17,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        'Buses on route',
                        style: FontConstant.styleMedium(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Text(
              'My details',
              style: FontConstant.styleMedium(
                fontSize: 18,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.toNamed('/booking');
                    },
                    child: const BookingRow(
                      text: 'Booking',
                      image: Image(
                        image: AssetImage(Images.line),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const GreyLine(),
                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed('/personal');
                    },
                    child: const BookingRow(
                      text: 'Personal information',
                      image: Image(
                        image: AssetImage(Images.user),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const GreyLine(),
                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed('/passenger');
                    },
                    child: const BookingRow(
                      text: 'Passengers',
                      image: Image(
                        image: AssetImage(Images.user2),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const GreyLine(),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: Text(
                      'Payments',
                      style: FontConstant.styleMedium(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed('/wallet');
                    },
                    child: const BookingRow(
                      text: 'Book My Sewa Wallet',
                      image: Image(
                        image: AssetImage(Images.wallet),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const GreyLine(),
                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: const BookingRow(
                      text: 'Payment methods',
                      image: Image(
                        image: AssetImage(Images.card),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const GreyLine(),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: Text(
                      'More',
                      style: FontConstant.styleMedium(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed('/offer');
                    },
                    child: const BookingRow(
                      text: 'Offers',
                      image: Image(
                        image: AssetImage(Images.offer),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const GreyLine(),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed('/refer');
                    },
                    child: const BookingRow(
                      text: 'Referrals',
                      image: Image(
                        image: AssetImage(Images.share),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const GreyLine(),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: const BookingRow(
                      text: 'News & Blogs',
                      image: Image(
                        image: AssetImage(Images.news),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const GreyLine(),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: const BookingRow(
                      text: 'Know About Book My Sewa',
                      image: Image(
                        image: AssetImage(Images.info),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const GreyLine(),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: const BookingRow(
                      text: 'Rate App',
                      image: Image(
                        image: AssetImage(Images.rate),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const GreyLine(),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: const BookingRow(
                      text: 'Help',
                      image: Image(
                        image: AssetImage(Images.question),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const GreyLine(),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: const BookingRow(
                      text: 'Account Setting',
                      image: Image(
                        image: AssetImage(Images.setting),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const GreyLine(),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class GreyLine extends StatelessWidget {
  const GreyLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      width: double.infinity,
      color: Colors.grey.shade400,
    );
  }
}

class BookingRow extends StatelessWidget {
  final String text;
  final Image image;

  const BookingRow({super.key, required this.text, required this.image});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12),
      child: Row(
        children: [
          SizedBox(
            width: 20,
            height: 20,
            child: image,
          ),
          const SizedBox(
            width: 20,
          ),
          Text(
            text,
            style: FontConstant.styleMedium(
              fontSize: 14,
              color: Colors.black,
            ),
          ),
          const Spacer(),
          const Icon(
            Icons.arrow_forward_ios,
            size: 16,
          ),
        ],
      ),
    );
  }
}
