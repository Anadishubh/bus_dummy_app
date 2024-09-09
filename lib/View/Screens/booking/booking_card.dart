import 'package:bms/utils/color_constant.dart';
import 'package:bms/utils/font_constant.dart';
import 'package:flutter/material.dart';
import '../../../utils/images_constant.dart';

class BookingCard extends StatelessWidget {
  final bool isRideCompleted; // Controls the visibility of "Cancel Ticket"
  final String boardingLocation;
  final String dropLocation;
  final String bookingID;
  final String time;
  final String priceDetails;
  final String totalPrice;
  final int passengers;

  const BookingCard({
    super.key,
    required this.isRideCompleted,
    required this.boardingLocation,
    required this.dropLocation,
    required this.bookingID,
    required this.time,
    required this.priceDetails,
    required this.totalPrice,
    required this.passengers,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          color: Colors.white,
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Boarding at',
                      style: FontConstant.styleRegular(fontSize: 12, color: Colors.grey),
                    ),
                    const Spacer(),
                    Text(
                      'Drop at',
                      style: FontConstant.styleRegular(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      boardingLocation,
                      style: FontConstant.styleSemiBold(fontSize: 14, color: Colors.black),
                    ),
                    const Spacer(),
                    Text(
                      dropLocation,
                      style: FontConstant.styleSemiBold(fontSize: 14, color: Colors.black),
                    ),
                  ],
                ),
                SizedBox(
                  width: 100,
                  height: 18,
                  child: Center(
                    child: Text(
                      time,
                      style: FontConstant.styleRegular(fontSize: 12, color: Colors.green),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Image(
                    image: AssetImage(Images.arrow),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      'Booking ID: $bookingID',
                      style: FontConstant.styleRegular(fontSize: 12, color: Colors.grey),
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        Text(
                          priceDetails,
                          style: FontConstant.styleRegular(fontSize: 14, color: Colors.black),
                        ),
                        Text(
                          totalPrice,
                          style: FontConstant.styleSemiBold(fontSize: 14, color: Colors.black),
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.group_outlined,
                            size: 20,
                            color: Colors.grey,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            '$passengers Passengers',
                            style: FontConstant.styleRegular(fontSize: 12, color: Colors.grey),
                          ),
                        ],
                      ),
                      // Show "Cancel Ticket" only if the ride is not completed
                      if (!isRideCompleted)
                        GestureDetector(
                          onTap: () {
                            // Add your cancellation logic here
                          },
                          child: Text(
                            'Cancel Ticket',
                            style: FontConstant.styleMedium(
                              fontSize: 12,
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}