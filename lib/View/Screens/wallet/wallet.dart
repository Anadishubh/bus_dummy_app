import 'package:bms/utils/color_constant.dart';
import 'package:bms/utils/images_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/font_constant.dart';

class Wallet extends StatefulWidget {
  const Wallet({super.key});

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white.withOpacity(0.9),
        appBar: AppBar(
          actions: [
            TextButton(
              onPressed: () {},
              child: const Text(
                'FAQ',
                style: TextStyle(color: Colors.black),
              ),
            )
          ],
          elevation: 1,
          shadowColor: Colors.black,
          backgroundColor: Colors.white,
          title: Text(
            'Book My Sewa Wallet',
            style: FontConstant.styleMedium(fontSize: 17, color: Colors.black),
          ),
        ),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 20,
            ),
            Card(
              color: Colors.white,
              margin: const EdgeInsets.symmetric(horizontal: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Container(
                      height: 65,
                      width: 65,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xfff85b46),
                            Color(0xffca3f2c),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const ClipOval(
                        child: Image(
                          image: AssetImage(Images.walletphoto),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Total Wallet Balance',
                          style: FontConstant.styleRegular(
                              fontSize: 16, color: Colors.grey.shade600),
                        ),
                        Text(
                          '₹ 0.00',
                          style: FontConstant.styleBold(
                              fontSize: 30, color: Colors.black),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 20,
              width: screenWidth*0.87
              ,
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '  Your Cash: ₹ 0.00',
                    style: FontConstant.styleRegular(
                        fontSize: 12, color: Colors.white),
                  ),
                  Text(
                    'Offer Cash: ₹ 0.00  ',
                    style: FontConstant.styleRegular(
                        fontSize: 12, color: Colors.white),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Container(
                      height: 0.8,
                      width: 40,
                      color: Colors.grey.shade400,
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Container(
                      height: 0.8,
                      width: 40,
                      color: Colors.grey.shade400,
                    ),
                  ],
                ),
                const SizedBox(
                  width: 20,
                ),
                Container(
                  height: 15,
                  width: 15,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade400,
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  'Refer and Earn',
                  style: FontConstant.styleMedium(
                      fontSize: 16, color: Colors.black),
                ),
                const SizedBox(
                  width: 20,
                ),
                Container(
                  height: 15,
                  width: 15,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade400,
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  children: [
                    Container(
                      height: 0.8,
                      width: 40,
                      color: Colors.grey.shade400,
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Container(
                      height: 0.8,
                      width: 40,
                      color: Colors.grey.shade400,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    const SizedBox(
                      height: 85,
                      width: 145,
                      child: ClipOval(
                        child: Image(
                          image: AssetImage(Images.wallettt),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Refer friends to Book My Sewa and earn wallet money',
                            style: FontConstant.styleRegular(
                                fontSize: 12, color: Colors.grey.shade600),
                          ),
                          const SizedBox(height: 8),
                          ElevatedButton(
                            onPressed: () {
                              Get.toNamed('/refer');
                            },
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 2),
                              minimumSize: const Size(0, 28),
                              backgroundColor: AppColors.pink,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    10), // No rounded corners
                              ),
                            ),
                            child: Text(
                              'Refer Now',
                              style: FontConstant.styleMedium(
                                  fontSize: 12, color: Colors.black),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                'Recent Transaction',
                style: FontConstant.styleRegular(
                    fontSize: 16, color: Colors.black),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Card(
              color: Colors.white,
              margin: const EdgeInsets.symmetric(horizontal: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.arrow_downward,
                      color: Colors.green,
                      size: 30,
                    ),
                    const SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Refer Cashback Received',
                          style: FontConstant.styleMedium(
                              fontSize: 12, color: Colors.black),
                        ),
                        Text(
                          '28 July 24 | Expire Date: 5 Aug 24',
                          style: FontConstant.styleRegular(
                              fontSize: 12, color: Colors.grey.shade600),
                        ),
                      ],
                    ),
                    Spacer(),
                    Text(
                      '+ ₹ 50.00',
                      style: TextStyle(color: Colors.green, fontSize: 16),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
