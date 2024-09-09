import 'package:bms/utils/color_constant.dart';
import 'package:bms/utils/font_constant.dart';
import 'package:flutter/material.dart';
import '../../../utils/images_constant.dart';

class TicketCard extends StatelessWidget {
  final String boardingLocation;
  final String dropLocation;
  final String bookingID;
  final String time;
  final String time2;
  final String priceDetails;
  final String totalPrice;
  final int passengers;

  TicketCard({
    super.key,
    required this.boardingLocation,
    required this.dropLocation,
    required this.bookingID,
    required this.time,
    required this.time2,
    required this.priceDetails,
    required this.totalPrice,
    required this.passengers,
  });

  final List<Map<String, dynamic>> passenger = [
    {
      'name': 'Ken Yuuma',
      'gender': 'Male',
      'age': '23',
      'seatNo': '4',
    },
    {
      'name': 'Alice Smith',
      'gender': 'Female',
      'age': '30',
      'seatNo': '5',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
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
                        'Booking Confirmed',
                        style: FontConstant.styleMedium(
                            fontSize: 15, color: Colors.green),
                      ),
                      const Spacer(),
                      Text(
                        '2 Tickets',
                        style: FontConstant.styleBold(
                            fontSize: 14, color: AppColors.primaryColor),
                      ),
                    ],
                  ),
                  Text(
                    'Booking ID: $bookingID',
                    style: FontConstant.styleRegular(
                      fontSize: 12,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      Text(
                        'Boarding at',
                        style: FontConstant.styleRegular(
                          fontSize: 12,
                          color: Colors.grey.shade600,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        'Drop at',
                        style: FontConstant.styleRegular(
                          fontSize: 12,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Text(
                        boardingLocation,
                        style: FontConstant.styleSemiBold(
                            fontSize: 14, color: Colors.black),
                      ),
                      const Spacer(),
                      Text(
                        dropLocation,
                        style: FontConstant.styleSemiBold(
                            fontSize: 14, color: Colors.black),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 18,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          time,
                          style: FontConstant.styleRegular(
                              fontSize: 12, color: Colors.green),
                        ),
                        Text(
                          time2,
                          style: FontConstant.styleRegular(
                              fontSize: 12, color: Colors.green),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Passenger:',
                    style: FontConstant.styleMedium(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 10),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: passenger.length,
                    itemBuilder: (context, index) {
                      final booking = passenger[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${booking['name']}',
                                  style: FontConstant.styleRegular(
                                      fontSize: 12, color: Colors.black),
                                ),
                                Text(
                                  '${booking['gender']}, Age: ${booking['age']}',
                                  style: FontConstant.styleRegular(
                                      fontSize: 11,
                                      color: Colors.grey.shade600),
                                )
                              ],
                            ),
                            Text(
                              'Seat No: ${booking['seatNo']}',
                              style: FontConstant.styleRegular(
                                  fontSize: 11, color: Colors.grey.shade600),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Toyota double decker',
                            style: FontConstant.styleSemiBold(
                                fontSize: 15, color: Colors.black),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Text(
                                'Vehicle No: ',
                                style: FontConstant.styleRegular(
                                    fontSize: 12, color: Colors.black),
                              ),
                              Text(
                                'NP01 BC 4589',
                                style: FontConstant.styleSemiBold(
                                    fontSize: 14, color: Colors.black),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Text(
                                'Volvo',
                                style: FontConstant.styleRegular(
                                    fontSize: 14, color: Colors.grey.shade600),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Container(
                                width: 70,
                                height: 20,
                                decoration: BoxDecoration(
                                  color: Colors.red.shade800,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Center(
                                  child: Text(
                                    'Premium',
                                    style: FontConstant.styleMedium(
                                        fontSize: 12, color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              // Profile picture
                              const CircleAvatar(
                                radius: 30,
                                backgroundImage: AssetImage(Images.driver),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'John Doe',
                                      style: FontConstant.styleSemiBold(
                                          fontSize: 14, color: Colors.black),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      '+91 1234567890',
                                      style: FontConstant.styleRegular(
                                          fontSize: 12, color: Colors.black),
                                    ),
                                  ],
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Image.asset(
                                  Images.call,
                                  height: 45,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment
                        .center, // Aligns the children in the center horizontally
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment
                            .start, // Aligns the text to the center
                        children: [
                          Text(
                            'Ticket Price',
                            style: FontConstant.styleRegular(
                                fontSize: 12, color: Colors.grey.shade600),
                          ),
                          Text(
                            '₹800.00',
                            style: FontConstant.styleSemiBold(
                                fontSize: 20, color: Colors.black),
                          ),
                          Text(
                            '2 x ₹800',
                            style: FontConstant.styleMedium(
                                fontSize: 12, color: Colors.green),
                          ),
                        ],
                      ),
                      const SizedBox(width: 20), // Adds space between columns
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Convenience Fee',
                            style: FontConstant.styleRegular(
                                fontSize: 12, color: Colors.grey.shade600),
                          ),
                          Text(
                            '₹80.00',
                            style: FontConstant.styleSemiBold(
                                fontSize: 20, color: Colors.black),
                          ),
                          Text(
                            '2 x ₹40',
                            style: FontConstant.styleMedium(
                                fontSize: 12, color: Colors.green),
                          ),
                        ],
                      ),
                      const SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'Discount',
                            style: FontConstant.styleRegular(
                                fontSize: 12, color: Colors.grey.shade600),
                          ),
                          Text(
                            '-₹80.00',
                            style: FontConstant.styleSemiBold(
                                fontSize: 20, color: Colors.black),
                          ),
                          Text(
                            'Coupon discount',
                            style: FontConstant.styleMedium(
                                fontSize: 12, color: Colors.green),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Total amount:',
                        style: FontConstant.styleRegular(
                          fontSize: 12,
                          color: Colors.grey.shade600,
                        ),
                      ),
                      Text(
                        ' ₹800.00',
                        style: FontConstant.styleSemiBold(
                            fontSize: 20, color: Colors.black),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Image.asset(
                      Images.qr,
                      height: 140,
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Filled button with red outline
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    label: Text(
                      'Live Track',
                      style: FontConstant.styleMedium(
                          fontSize: 14, color: AppColors.primaryColor),
                    ),
                    icon: const Icon(
                      Icons.location_on,
                      color: AppColors.primaryColor,
                    ),
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(
                        color: AppColors.primaryColor,
                        width: 2,
                      ), // Red outline
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.share,
                      color: Colors.black,
                    ),
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(
                        color: Colors.black,
                        width: 2,
                      ),
                    ),
                    label: Text(
                      'Share',
                      style: FontConstant.styleMedium(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
