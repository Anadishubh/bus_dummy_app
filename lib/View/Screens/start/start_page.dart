import 'package:flutter/material.dart';
import 'package:flutter_swipe_button/flutter_swipe_button.dart';
import 'package:get/get.dart';
import '../../../utils/color_constant.dart';
import '../../../utils/font_constant.dart';
import '../../../utils/images_constant.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> with TickerProviderStateMixin {
  late AnimationController _p1Controller;
  late AnimationController _p2Controller;
  late AnimationController _p3Controller;
  late AnimationController _busController;

  late Animation<double> _p1Animation;
  late Animation<double> _p2Animation;
  late Animation<double> _p3Animation;
  late Animation<double> _busAnimation;

  bool _showSwipeButton = false;

  @override
  void initState() {
    super.initState();

    _p1Controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _p2Controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _p3Controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _busController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _p1Controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _p2Controller.forward();
      }
    });

    _p2Controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _p3Controller.forward();
      }
    });

    _p3Controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // Optionally, restart animations or perform other actions here
      }
    });

    _busController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _p1Controller.forward();
      }
    });

    _busController.forward(); // Start the bus animation first

    Future.delayed(const Duration(seconds: 4), () {
      setState(() {
        _showSwipeButton = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    _p1Animation =
        Tween<double>(begin: -screenWidth * 1.5, end: screenWidth * -0.2)
            .animate(
      CurvedAnimation(parent: _p1Controller, curve: Curves.easeInOut),
    );
    _p2Animation =
        Tween<double>(begin: -screenWidth * 1.5, end: screenWidth * -0.5)
            .animate(
      CurvedAnimation(parent: _p2Controller, curve: Curves.easeInOut),
    );
    _p3Animation =
        Tween<double>(begin: -screenWidth * 1.5, end: screenWidth * -0.75)
            .animate(
      CurvedAnimation(parent: _p3Controller, curve: Curves.easeInOut),
    );
    _busAnimation =
        Tween<double>(begin: screenWidth * 2, end: screenWidth * 0.6).animate(
      CurvedAnimation(parent: _busController, curve: Curves.easeInOut),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            top: -20,
            left: 0,
            right: 0,
            child: Container(
              height: screenHeight * 0.5,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(Images.map2),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Positioned(
            top: 95,
            left: 10,
            right: 0,
            child: Container(
              height: screenHeight * 0.2,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(Images.logo),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          Positioned(
            top: 300,
            left: 30,
            right: 0,
            child: Text(
              'Start Your Journey With',
              style: FontConstant.styleSemiBold(
                fontSize: 25,
                color: Colors.black,
              ),
            ),
          ),
          Positioned(
            top: 340,
            left: 90,
            right: 0,
            child: Text(
              'Book My Seva',
              style: FontConstant.styleSemiBold(
                fontSize: 25,
                color: AppColors.primaryColor,
              ),
            ),
          ),
          Positioned(
            bottom: -40,
            left: 0,
            right: 0,
            child: Container(
              height: screenHeight * 0.39,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(Images.d2),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: -40,
            left: 0,
            right: 0,
            child: Container(
              height: screenHeight * 0.3,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(Images.d1),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 190,
            left: 20,
            right: 190,
            child: Container(
              height: screenHeight * 0.1,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(Images.bench),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          AnimatedBuilder(
            animation: _p1Animation,
            builder: (context, child) {
              return Positioned(
                bottom: 203,
                left: _p1Animation.value,
                right: 0,
                child: Container(
                  height: screenHeight * 0.17,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(Images.p1),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              );
            },
          ),
          AnimatedBuilder(
            animation: _p2Animation,
            builder: (context, child) {
              return Positioned(
                bottom: 203,
                left: _p2Animation.value,
                right: 0,
                child: Container(
                  height: screenHeight * 0.17,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(Images.p2),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              );
            },
          ),
          AnimatedBuilder(
            animation: _p3Animation,
            builder: (context, child) {
              return Positioned(
                bottom: 203,
                left: _p3Animation.value,
                right: 0,
                child: Container(
                  height: screenHeight * 0.17,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(Images.p3),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              );
            },
          ),
          AnimatedBuilder(
            animation: _busAnimation,
            builder: (context, child) {
              return Positioned(
                bottom: 195,
                right: -_busAnimation.value,
                left: 0,
                child: Container(
                  height: screenHeight * 0.25,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(Images.minibus),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              );
            },
          ),
          if (_showSwipeButton)
            Positioned(
              bottom: 80,
              left: 40,
              right: 40,
              child: Center(
                child: SizedBox(
                  height: screenHeight * 0.06,
                  child: SwipeButton(
                    borderRadius: BorderRadius.circular(8),
                    activeTrackColor: AppColors.buttonDark,
                    height: 60,
                    thumb: Container(
                      decoration: BoxDecoration(
                        color: AppColors.buttonDark2,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 5,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.keyboard_double_arrow_right,
                        color: Colors.white,
                      ),
                    ),
                    child: Text(
                      "Swipe to start",
                      style: FontConstant.styleRegular(
                          fontSize: 20, color: Colors.white),
                    ),
                    onSwipe: () {
                      Get.offAndToNamed('/login');
                    },
                  ),
                ),
              ),
            ),
          Positioned(
            bottom: -40,
            left: 0,
            right: 100,
            child: Container(
              height: screenHeight * 0.13,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(Images.g2),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: -40,
            left: 240,
            right: 0,
            child: Container(
              height: screenHeight * 0.12,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(Images.g1),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 270,
            right: 0,
            child: Container(
              height: screenHeight * 0.03,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(Images.blueTail),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
