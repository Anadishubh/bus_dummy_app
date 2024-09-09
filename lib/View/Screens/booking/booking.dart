import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'booking_card.dart';
import '../../../utils/color_constant.dart';
import '../../../utils/font_constant.dart';

class Booking extends StatefulWidget {
  const Booking({super.key});

  @override
  State<Booking> createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  final List<Map<String, dynamic>> upcomingBookings = [
    {
      'isRideCompleted': false,
      'boardingLocation': 'Delhi',
      'dropLocation': 'Jaipur (Rajasthan)',
      'bookingID': '#7589842H3',
      'time': '3:10 pm 21 Oct, Friday',
      'priceDetails': '400 x 2 = ',
      'totalPrice': '₹800',
      'passengers': 2,
    },
    // More upcoming bookings...
  ];

  final List<Map<String, dynamic>> completedBookings = [
    {
      'isRideCompleted': true,
      'boardingLocation': 'Mumbai',
      'dropLocation': 'Pune (Maharashtra)',
      'bookingID': '#473823B2F',
      'time': '6:00 pm 25 Oct, Monday',
      'priceDetails': '500 x 1 = ',
      'totalPrice': '₹500',
      'passengers': 1,
    },
    // More completed bookings...
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: Colors.white.withOpacity(0.9),
          appBar: AppBar(
            elevation: 1,
            shadowColor: Colors.black,
            backgroundColor: Colors.white,
            title: Text(
              'Booking',
              style: FontConstant.styleMedium(
                fontSize: 17,
                color: Colors.black,
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.filter_list_alt, color: Colors.black),
              ),
            ],
          ),
          body: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(50),
                ),
                height: 35,
                margin: const EdgeInsets.only(top: 15.0, left: 10, right: 10),
                child: TabBar(
                  labelStyle: FontConstant.styleMedium(
                      fontSize: 14, color: Colors.white),
                  dividerHeight: 0,
                  indicator: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  indicatorSize: TabBarIndicatorSize.tab,
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.black,
                  tabs: const [
                    Tab(text: "Upcoming Rides"),
                    Tab(text: "Completed Rides"),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Expanded(
                child: TabBarView(
                  children: [
                    ListView.builder(
                      itemCount: upcomingBookings.length,
                      itemBuilder: (context, index) {
                        final booking = upcomingBookings[index];
                        return GestureDetector(
                          onTap: (){
                            Get.toNamed('/bookingDetails');
                          },
                          child: BookingCard(
                            isRideCompleted: booking['isRideCompleted'],
                            boardingLocation: booking['boardingLocation'],
                            dropLocation: booking['dropLocation'],
                            bookingID: booking['bookingID'],
                            time: booking['time'],
                            priceDetails: booking['priceDetails'],
                            totalPrice: booking['totalPrice'],
                            passengers: booking['passengers'],
                          ),
                        );
                      },
                    ),
                    ListView.builder(
                      itemCount: completedBookings.length,
                      itemBuilder: (context, index) {
                        final booking = completedBookings[index];
                        return GestureDetector(
                          onTap: (){
                            Get.toNamed('/bookingDetails');
                          },
                          child: BookingCard(
                            isRideCompleted: booking['isRideCompleted'],
                            boardingLocation: booking['boardingLocation'],
                            dropLocation: booking['dropLocation'],
                            bookingID: booking['bookingID'],
                            time: booking['time'],
                            priceDetails: booking['priceDetails'],
                            totalPrice: booking['totalPrice'],
                            passengers: booking['passengers'],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}