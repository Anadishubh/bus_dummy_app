import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import '../../../utils/color_constant.dart';
import '../../../utils/font_constant.dart';
import '../../../utils/images_constant.dart';

class Referral extends StatefulWidget {
  const Referral({super.key});

  @override
  State<Referral> createState() => _ReferralState();
}

class _ReferralState extends State<Referral> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white.withOpacity(0.9),
        appBar: AppBar(
          actions: [
            TextButton(
              onPressed: () {},
              child: const Text(
                'FAQ',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ],
          elevation: 1,
          shadowColor: Colors.black,
          backgroundColor: Colors.white,
          title: Text(
            'Referrals',
            style: FontConstant.styleMedium(
              fontSize: 17,
              color: Colors.black,
            ),
          ),
        ),
        body: Column(
          children: [
            _buildReferralHeader(),
            const SizedBox(height: 20),
            _buildTabView(),
          ],
        ),
        bottomNavigationBar: _buildBottomAppBar(),
      ),
    );
  }

  Widget _buildReferralHeader() {
    return SizedBox(
      height: 155,
      child: Stack(
        children: [
          Container(
            height: 100,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xffedd897),
                  Color(0xfff58e90),
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 15, top: 20),
              child: Text(
                'Earn up to Rs 1000 by \nreferring friends!',
                style: FontConstant.styleSemiBold(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Positioned(
            top: 70,
            left: 15,
            right: 15,
            child: Container(
              height: 80,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    const SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          DottedBorder(
                            dashPattern: const [3, 2],
                            strokeWidth: 2,
                            borderType: BorderType.RRect,
                            radius: const Radius.circular(8),
                            child: Container(
                              height: 20,
                              width: 120,
                              decoration: BoxDecoration(
                                color: const Color(0xffd6ebff),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: const Center(
                                child: Text('book5coupon'),
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Your referral code',
                            style: FontConstant.styleMedium(
                              fontSize: 12,
                              color: Colors.grey.shade600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 25,
                      width: 90,
                      decoration: BoxDecoration(
                        color: AppColors.pink,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: Text(
                          'Copy Code',
                          style: FontConstant.styleMedium(
                            fontSize: 12,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Positioned(
            right: 0,
            bottom: 60,
            child: Image(
              image: AssetImage(Images.refer),
              height: 100,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabView() {
    return Expanded(
      child: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            TabBar(
              indicatorColor: AppColors.primaryColor,
              indicatorSize: TabBarIndicatorSize.tab,
              tabs: const [
                Tab(
                  text: 'Refer and earn',
                ),
                Tab(
                  text: 'Referral history',
                ),
              ],
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              labelStyle: FontConstant.styleMedium(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  SingleChildScrollView(
                    child: _buildHowItWorks(),
                  ),
                  SingleChildScrollView(
                    child: _history(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomAppBar() {
    return BottomAppBar(
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(5), // Makes the button rectangular
            ),
          ),
          child: Text(
            'REFER NOW',
            style: FontConstant.styleRegular(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHowItWorks() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'How it works?',
                style:
                    FontConstant.styleMedium(fontSize: 16, color: Colors.black),
              ),
              const SizedBox(height: 16),
              _buildStep(
                '01',
                'Share your code',
                'Share your unique referral code with your friends.',
              ),
              _buildStep(
                '02',
                'Ask friends to download Book My Sewa',
                'Ask your friend to download the Book My Sewa app.',
              ),
              _buildStep(
                '03',
                'Get rewarded',
                'Earn cashback when your friends register and travel with Book My Sewa.',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStep(String stepNumber, String title, String description) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            stepNumber,
            style: FontConstant.styleMedium(
              fontSize: 35,
              color: AppColors.primaryColor,
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: FontConstant.styleMedium(
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  description,
                  style: FontConstant.styleRegular(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _history() {
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      color: Colors.transparent,
      height: screenHeight * 0.53,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '₹ 0.00',
                          style: FontConstant.styleBold(
                              fontSize: 25, color: Colors.black),
                        ),
                        Text(
                          'Total rewards',
                          style: FontConstant.styleMedium(
                              fontSize: 14, color: Colors.black),
                        ),
                      ],
                    ),
                    Image.asset(
                      Images.wallet2,
                      height: 50,
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  bool isMoneyComingIn = index % 2 == 0;
                  double amount = isMoneyComingIn ? 100.0 : 50.0;
                  bool condition = index % 2 == 0;
                  String text = condition
                      ? 'Refer Cashback Received'
                      : 'Used for ticket book';
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 10,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Arrow and background color logic
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    color: isMoneyComingIn
                                        ? AppColors.greenLight
                                        : AppColors
                                            .redLight, // Conditional color
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Center(
                                    child: Image.asset(
                                      isMoneyComingIn
                                          ? Images.greendown
                                          : Images.redup,
                                      height: 20,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      text,
                                      style: FontConstant.styleMedium(
                                          fontSize: 12, color: Colors.black),
                                    ),
                                    Text(
                                      '28 july',
                                      style: FontConstant.styleRegular(
                                          fontSize: 12, color: Colors.grey),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            Text(
                              "${isMoneyComingIn ? '+' : '-'} ₹ ${amount.toStringAsFixed(2)}",
                              style: FontConstant.styleMedium(
                                fontSize: 18,
                                color:
                                    isMoneyComingIn ? Colors.green : Colors.red,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
