import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/images_constant.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _iconController;
  late AnimationController _mapController;

  late Animation<double> _scaleAnimation;
  late Animation<double> _mapAnimation;

  @override
  void initState() {
    super.initState();
    _iconController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    _mapController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _scaleAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(parent: _iconController, curve: Curves.easeInOut),
    );

    _mapAnimation = Tween<double>(begin: -1, end: 0).animate(
      CurvedAnimation(parent: _mapController, curve: Curves.easeInOut),
    );

    _mapController.forward();

    Timer(const Duration(seconds: 2), () {
      Get.offAndToNamed('/start');
    });
  }

  @override
  void dispose() {
    _iconController.dispose();
    _mapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          AnimatedBuilder(
            animation: _mapController,
            builder: (context, child) {
              return Transform.translate(
                offset: Offset(0, _mapAnimation.value * screenHeight * 0.47),
                child: Container(
                  height: screenHeight * 0.47,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      opacity: 0.4,
                      image: AssetImage(Images.map),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              );
            },
          ),
          Center(
            child: AnimatedBuilder(
              animation: _iconController,
              builder: (context, child) {
                return Transform.scale(
                  scale: _scaleAnimation.value,
                  child: Container(
                    width: screenWidth * 0.5,
                    height: screenWidth * 0.5,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(Images.logo),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}