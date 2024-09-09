import 'package:bms/View/Screens/booking/ticket_card.dart';
import 'package:flutter/material.dart';
import '../../../utils/font_constant.dart';

class BookingDetails extends StatefulWidget {
  const BookingDetails({super.key});

  @override
  State<BookingDetails> createState() => _BookingDetailsState();
}

class _BookingDetailsState extends State<BookingDetails> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white.withOpacity(0.9),
        appBar: AppBar(
          elevation: 1,
          shadowColor: Colors.black,
          backgroundColor: Colors.white,
          actions: [
            TextButton(
              onPressed: () {},
              child: Text(
                'Feedback',
                style: FontConstant.styleMedium(
                  fontSize: 15,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
        body:
        Padding(
          padding: const EdgeInsets.only(top: 15),
          child: TicketCard(
            boardingLocation: 'Delhi',
            dropLocation: 'Jaipur (Rajasthan)',
            bookingID: '#7589842H3',
            time: '3.10 PM 21 Oct, Friday',
            time2: '2.05 AM 22 Oct, Saturday',
            priceDetails: 'priceDetails',
            totalPrice: 'totalPrice',
            passengers:2,
          ),
        ),
      ),
    );
  }
}
