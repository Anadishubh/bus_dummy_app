import 'package:bms/View/Screens/dashboard/dashboard_screen.dart';
import 'package:bms/utils/color_constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  BottomBarState createState() => BottomBarState();
}

class BottomBarState extends State<BottomBar> {
  int pageIndex = 0;

  final pages = [
    const DashboardScreen(),
    const Page2(),
    const Page3(),
    const Page4(),
    const Page5(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[pageIndex],
      bottomNavigationBar: buildMyNavBar(context),
    );
  }

  Padding buildMyNavBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 4,
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            buildNavItem(CupertinoIcons.house_fill, CupertinoIcons.house, "Home", 0),
            buildNavItem(Icons.location_on, Icons.location_on_outlined, "Track", 1),
            buildNavItem(CupertinoIcons.ticket_fill, CupertinoIcons.ticket, "Ticket", 2),
            buildNavItem(Icons.headset_mic, Icons.headset_mic_outlined, "Help", 3),
            buildNavItem(CupertinoIcons.person_alt_circle_fill, CupertinoIcons.person_alt_circle, "Account", 4),
          ],
        ),
      ),
    );
  }

  Expanded buildNavItem(IconData activeIcon, IconData inactiveIcon, String label, int index) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            pageIndex = index;
          });
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              pageIndex == index ? activeIcon : inactiveIcon,
              color: AppColors.primaryColor,
              size: 24,
            ),
            Text(
              label,
              style: TextStyle(
                color: AppColors.primaryColor,
                fontSize: 14,
                fontWeight: pageIndex == index ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffC4DFCB),
      child: Center(
        child: Text(
          "Page Number 1",
          style: TextStyle(
            color: Colors.green[900],
            fontSize: 45,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffC4DFCB),
      child: Center(
        child: Text(
          "Page Number 2",
          style: TextStyle(
            color: Colors.green[900],
            fontSize: 45,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

class Page3 extends StatelessWidget {
  const Page3({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffC4DFCB),
      child: Center(
        child: Text(
          "Page Number 3",
          style: TextStyle(
            color: Colors.green[900],
            fontSize: 45,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

class Page4 extends StatelessWidget {
  const Page4({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffC4DFCB),
      child: Center(
        child: Text(
          "Page Number 4",
          style: TextStyle(
            color: Colors.green[900],
            fontSize: 45,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

class Page5 extends StatelessWidget {
  const Page5({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffC4DFCB),
      child: Center(
        child: Text(
          "Page Number 5",
          style: TextStyle(
            color: Colors.green[900],
            fontSize: 45,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}