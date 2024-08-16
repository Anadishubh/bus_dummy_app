import 'package:bms/View/Screens/dashboard/blog_listview.dart';
import 'package:bms/utils/color_constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bms/utils/font_constant.dart';
import 'package:bms/utils/images_constant.dart';
import 'package:get/get.dart';
import 'agencies_listview.dart';
import 'calender.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  final List<String> imagePaths = [Images.price1, Images.price1, Images.price1];
  final List<String> imagePaths2 = [Images.green, Images.green, Images.green];
  final List<String> imagePaths3 = [
    Images.monsoon,
    Images.monsoon,
    Images.monsoon
  ];
  final List<String> imagePaths4 = [
    Images.manali,
    Images.katmandu,
    Images.manali
  ];

  final TextEditingController _leaving = TextEditingController();
  final TextEditingController _going = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _swapTextControllers() {
    final tempText = _leaving.text;
    _leaving.text = _going.text;
    _going.text = tempText;
  }

  @override
  void dispose() {
    _leaving.dispose();
    _going.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final screenWidth = MediaQuery.of(context).size.width;
    _animation = Tween<double>(
      begin: screenWidth,
      end: screenWidth * 0.78,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        drawer: const CustomDrawer2(),
        appBar: AppBar(
          foregroundColor: AppColors.primaryColor,
          scrolledUnderElevation: 0,
          centerTitle: true,
          backgroundColor: AppColors.primaryColor,
          leading: Builder(
            builder: (BuildContext context) {
              return GestureDetector(
                onTap: () {
                  Scaffold.of(context).openDrawer();
                },
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.menu,
                    color: Colors.white,
                  ),
                ),
              );
            },
          ),
          title: Text(
            'Dashboard',
            style:
                FontConstant.styleSemiBold(fontSize: 18, color: Colors.white),
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: Icon(
                Icons.notifications,
                color: Colors.white,
              ),
            ),
          ],
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Stack(
                  children: [
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      height: screenWidth * 0.55,
                      child: const Image(
                        fit: BoxFit.fill,
                        image: AssetImage(Images.vector),
                      ),
                    ),
                    Image(
                      image: const AssetImage(Images.rectangle),
                      fit: BoxFit.fill,
                      height: screenWidth * 0.4,
                      width: double.infinity,
                    ),
                    Stack(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  top: screenHeight * 0.01,
                                  left: screenWidth * 0.03),
                              child: Text(
                                'Search for Bus Tickets',
                                style: FontConstant.styleSemiBold(
                                    fontSize: 18, color: Colors.white),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: screenHeight * 0.01,
                                  left: screenWidth * 0.03,
                                  right: screenWidth * 0.03),
                              child: Container(
                                height: screenHeight * 0.31,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.6),
                                      spreadRadius: 1,
                                      blurRadius: 1,
                                      offset: const Offset(0, 4),
                                    ),
                                  ],
                                ),
                                child: Stack(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: screenWidth * 0.03,
                                          top: screenWidth * 0.03),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          buildLocationRow(
                                              CupertinoIcons.location,
                                              'Leaving from',
                                              _leaving),
                                          const SizedBox(height: 10),
                                          buildDividerWithIcon(),
                                          const SizedBox(height: 10),
                                          buildLocationRow(
                                            Icons.location_on_outlined,
                                            'Going to',
                                            _going,
                                          ),
                                          const SizedBox(height: 14),
                                          Text(
                                            'Departure',
                                            style: FontConstant.styleSemiBold(
                                                fontSize: 16,
                                                color: Colors.black),
                                          ),
                                          DynamicCalendar(
                                            onDateSelected: (DateTime) {},
                                          ),
                                        ],
                                      ),
                                    ),
                                    Positioned(
                                      top: screenHeight * 0.056,
                                      right: screenWidth * 0.03,
                                      child: GestureDetector(
                                        onTap: _swapTextControllers,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color:
                                                Colors.black.withOpacity(0.8),
                                          ),
                                          child: const SizedBox(
                                            height: 50,
                                            width: 50,
                                            child: Center(
                                              child: Icon(
                                                CupertinoIcons
                                                    .arrow_up_arrow_down,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: screenHeight * 0.03,
                                  left: screenWidth * 0.03,
                                  right: screenWidth * 0.03),
                              child: Container(
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                    colors: [
                                      AppColors.buttonDark2,
                                      AppColors.buttonColor
                                    ],
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    onTap: () {
                                      if (_formKey.currentState!.validate()) {
                                        Get.toNamed('/search');
                                      }
                                    },
                                    borderRadius: BorderRadius.circular(8),
                                    child: SizedBox(
                                      height: 35,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Icon(
                                            Icons.search,
                                            color: Colors.white,
                                          ),
                                          Text(
                                            'Search Bus',
                                            style: FontConstant.styleBold(
                                                fontSize: 16,
                                                color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: screenWidth * 0.03),
                              child: const Image(
                                image: AssetImage(Images.single),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: screenWidth * 0.03),
                              child: Text(
                                'Book My Sewa Guarantee',
                                style: FontConstant.styleSemiBold(
                                    fontSize: 16, color: Colors.black),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: screenWidth * 0.03),
                              child: SizedBox(
                                height: 75,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: imagePaths.length,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      margin: EdgeInsets.only(
                                          right: screenWidth * 0.03),
                                      child: Image.asset(
                                        imagePaths[index],
                                        fit: BoxFit.fill,
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: screenWidth * 0.03),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: AppColors.pink,
                                ),
                                height: 50,
                                width: double.infinity,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: screenWidth * 0.02),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Follow Us on Instagram',
                                            style: FontConstant.styleSemiBold(
                                                fontSize: 12,
                                                color: Colors.black),
                                          ),
                                          Text(
                                            'Join Book My Sewa Community',
                                            style: FontConstant.styleRegular(
                                                fontSize: 10,
                                                color: Colors.black),
                                          )
                                        ],
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {},
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            right: screenWidth * 0.01),
                                        child: Container(
                                          height: 22,
                                          padding: EdgeInsets.symmetric(
                                              horizontal: screenHeight * 0.015,
                                              vertical: screenWidth * 0.01),
                                          decoration: BoxDecoration(
                                            color: AppColors.primaryColor,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Center(
                                            child: Text(
                                              'Go to Instagram',
                                              style: FontConstant.styleSemiBold(
                                                  fontSize: 10,
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: screenWidth * 0.03),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Special Offers',
                                    style: FontConstant.styleSemiBold(
                                        fontSize: 16, color: Colors.black),
                                  ),
                                  TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      'View All',
                                      style: FontConstant.styleSemiBold(
                                          fontSize: 12,
                                          color: AppColors.primaryColor),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: screenWidth * 0.03),
                              child: SizedBox(
                                height: 140,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: imagePaths2.length,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      margin: const EdgeInsets.only(right: 8),
                                      child: Image.asset(
                                        imagePaths2[index],
                                        fit: BoxFit.fill,
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: screenWidth * 0.03),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'From The Blog',
                                    style: FontConstant.styleSemiBold(
                                        fontSize: 17, color: Colors.black),
                                  ),
                                  Text(
                                    'View All',
                                    style: FontConstant.styleSemiBold(
                                        fontSize: 12,
                                        color: AppColors.primaryColor),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 145,
                              width: double.infinity,
                              color: AppColors.primaryColor,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 3,
                                itemBuilder: (context, index) {
                                  return const BlogListview(
                                    imagePath: 'assets/images/grp2.png',
                                    title: 'Monsoon Trip',
                                    description:
                                        'Lorem ipsum simply\nis a dummy text of printing.',
                                  );
                                },
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: screenWidth * 0.03),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Routes',
                                    style: FontConstant.styleSemiBold(
                                        fontSize: 17, color: Colors.black),
                                  ),
                                  Text(
                                    'View All',
                                    style: FontConstant.styleSemiBold(
                                        fontSize: 12,
                                        color: AppColors.primaryColor),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: screenWidth * 0.03),
                              child: SizedBox(
                                height: 165,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: imagePaths2.length,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      margin: const EdgeInsets.only(right: 8),
                                      child: Image.asset(
                                        imagePaths4[index],
                                        fit: BoxFit.fill,
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: screenWidth * 0.03),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Top Agencies',
                                    style: FontConstant.styleSemiBold(
                                        fontSize: 17, color: Colors.black),
                                  ),
                                  Text(
                                    'View All',
                                    style: FontConstant.styleSemiBold(
                                        fontSize: 12,
                                        color: AppColors.primaryColor),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: screenWidth * 0.03),
                              child: SizedBox(
                                height: 140,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 3,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return const AgenciesListview(
                                      imagePath: 'assets/images/bus2.png',
                                      title: 'Nepal Tour and Travels PVT LTD',
                                      description:
                                          'We have overall 1738 services including janrath,\nsemi deluxe, fully deluxe and more...',
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: screenHeight * 1,
                        ),
                        AnimatedBuilder(
                          animation: _animation,
                          builder: (context, child) {
                            return Positioned(
                              top: screenHeight * 0.02,
                              left: _animation.value,
                              child: const Image(
                                image: AssetImage(Images.bus1),
                                height: 60,
                                fit: BoxFit.contain,
                              ),
                            );
                          },
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildLocationRow(
      IconData icon, String hint, TextEditingController controller) {
    return Row(
      children: [
        Icon(
          icon,
          size: 25,
          color: Colors.black.withOpacity(0.6),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 90),
            child: TextFormField(
              controller: controller,
              style:
                  FontConstant.styleRegular(fontSize: 16, color: Colors.black),
              decoration: InputDecoration(
                hintText: hint,
                hintStyle: FontConstant.styleRegular(
                    fontSize: 16, color: Colors.grey.withOpacity(0.8)),
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                errorStyle: const TextStyle(height: 0),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return '';
                }
                return null;
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget buildDividerWithIcon() {
    return Row(
      children: [
        Container(
          width: 270,
          color: Colors.black.withOpacity(0.2),
          height: 2,
        ),
      ],
    );
  }
}

class CustomDrawer2 extends StatelessWidget {
  const CustomDrawer2({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            height: 100,
            decoration: const BoxDecoration(
              color: AppColors.primaryDarkColor,
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 17, top: 30),
              child: Row(
                children: [
                  const Icon(
                    Icons.person_outline,
                    color: Colors.white,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text('Ken Yuuma',
                      style: FontConstant.styleMedium(
                          fontSize: 17, color: Colors.white)),
                  const SizedBox(
                    width: 10,
                  ),
                  const Icon(
                    Icons.edit_outlined,
                    size: 19,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.dashboard,
              size: 21,
            ),
            title: Text(
              'Dashboard',
              style:
                  FontConstant.styleRegular(fontSize: 14, color: Colors.black),
            ),
            onTap: () {
              Navigator.of(context).pop(); // Close the drawer
              // Navigate to Home Page
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.person_outline,
              size: 21,
            ),
            title: Text(
              'My Profile',
              style:
                  FontConstant.styleRegular(fontSize: 14, color: Colors.black),
            ),
            onTap: () {
              Navigator.of(context).pop(); // Close the drawer
              // Navigate to Search Page
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.notifications_none,
              size: 21,
            ),
            title: Text(
              'Notification',
              style:
                  FontConstant.styleRegular(fontSize: 14, color: Colors.black),
            ),
            onTap: () {
              Navigator.of(context).pop(); // Close the drawer
              // Navigate to Settings Page
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.person_add_alt_1_outlined,
              size: 21,
            ),
            title: Text(
              'My Traveller Details',
              style:
                  FontConstant.styleRegular(fontSize: 14, color: Colors.black),
            ),
            onTap: () {
              Navigator.of(context).pop(); // Close the drawer
              // Handle logout action
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.calendar_today,
              size: 21,
            ),
            title: Text(
              'Booking Details',
              style:
                  FontConstant.styleRegular(fontSize: 14, color: Colors.black),
            ),
            onTap: () {
              Navigator.of(context).pop(); // Close the drawer
              // Handle logout action
            },
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 1,
            width: double.infinity,
            color: Colors.grey,
          ),
          const SizedBox(
            height: 10,
          ),
          ListTile(
            leading: const Icon(
              Icons.share_outlined,
              size: 21,
            ),
            title: Text(
              'Refer and Earn',
              style:
                  FontConstant.styleRegular(fontSize: 14, color: Colors.black),
            ),
            onTap: () {
              Navigator.of(context).pop(); // Close the drawer
              // Handle logout action
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.settings_outlined,
              size: 21,
            ),
            title: Text(
              'Account Settings',
              style:
                  FontConstant.styleRegular(fontSize: 14, color: Colors.black),
            ),
            onTap: () {
              Navigator.of(context).pop(); // Close the drawer
              // Handle logout action
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.feedback_outlined,
              size: 21,
            ),
            title: Text(
              'Write a Feedback',
              style:
                  FontConstant.styleRegular(fontSize: 14, color: Colors.black),
            ),
            onTap: () {
              Navigator.of(context).pop(); // Close the drawer
              // Handle logout action
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.privacy_tip_outlined,
              size: 21,
            ),
            title: Text(
              'Privacy Policy',
              style:
                  FontConstant.styleRegular(fontSize: 14, color: Colors.black),
            ),
            onTap: () {
              Navigator.of(context).pop(); // Close the drawer
              // Handle logout action
            },
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: AppColors.primaryColor, width: 2),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.power_settings_new_outlined,
                    color: AppColors.primaryColor,
                  ),
                  Text(
                    'Logout',
                    style: TextStyle(color: AppColors.primaryColor),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
