import 'package:bms/View/Screens/search/bus_card.dart';
import 'package:bms/utils/color_constant.dart';
import 'package:bms/utils/font_constant.dart';
import 'package:bms/utils/images_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  DateTime selectedDate = DateTime.now();
  final DateTime initialDate = DateTime.now();
  final DateTime firstDate = DateTime(2000);
  final DateTime lastDate = DateTime(2101);

  void onDateChanged(DateTime newDate) {
    setState(() {
      selectedDate = newDate;
    });
  }

  void _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
    );
    if (picked != null && picked != selectedDate) {
      onDateChanged(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('d MMM, EEE').format(selectedDate);
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.background,
        drawer: const CustomDrawer(),
        body: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: 60,
                  width: double.infinity,
                  padding: const EdgeInsets.only(left: 16.0),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset: Offset(0, 1),
                      ),
                    ],
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: const Icon(Icons.arrow_back),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Majnu Ka Tilla, Delhi',
                            style: FontConstant.styleMedium(
                              fontSize: 12,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            'Jaipur (Rajasthan)',
                            style: FontConstant.styleMedium(
                              fontSize: 12,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () => _selectDate(context),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Row(
                            children: [
                              Text(
                                formattedDate,
                                style: FontConstant.styleMedium(
                                  fontSize: 14,
                                  color: Colors.grey.shade600,
                                ),
                              ),
                              const Icon(
                                Icons.arrow_drop_down,
                                color: AppColors.primaryColor,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'From Delhi to Jaipur (Rajasthan)',
                  style: FontConstant.styleMedium(
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  '104 Buses are available on this pickup point',
                  style: FontConstant.styleRegular(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return  BusCard(
                        money: '1599',
                        description: 'PRTC Tours and Travels',
                        seatsLeft: 20,
                        subHeading: 'Bharat Benz A/C Seater / Sleeper',
                        showFlashOffer: true,
                      );
                    },
                  ),
                ),
              ],
            ),
            const Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: SearchBar(),
            ),
          ],
        ),
      ),
    );
  }
}

class SearchBar extends StatefulWidget {
  const SearchBar({super.key});

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      height: 55,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade400,
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, 1),
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.grey,
            size: 20,
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.wb_sunny_outlined,
                        color: Colors.grey,
                        size: 20,
                      ),
                      Text(
                        'Day Time',
                        style: FontConstant.styleRegular(
                            fontSize: 12, color: Colors.grey),
                      )
                    ],
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.nightlight_round,
                        color: Colors.grey,
                        size: 20,
                      ),
                      Text(
                        'Night Time',
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        Images.ac,
                        height: 20,
                      ),
                      const Text(
                        'A/C',
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        Images.ac,
                        height: 20,
                      ),
                      const Text(
                        'Non A/C',
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.bed,
                        color: Colors.grey,
                        size: 20,
                      ),
                      Text(
                        'Sleeper',
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.event_seat,
                        color: Colors.grey,
                        size: 20,
                      ),
                      Text(
                        'Seater',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const Icon(
            Icons.arrow_forward_ios,
            color: Colors.grey,
            size: 20,
          ),
          GestureDetector(
            onTap: () {
              Scaffold.of(context).openDrawer();
            },
            child: Container(
              height: 45,
              width: 60,
              decoration: const BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: const Icon(
                Icons.filter_list_alt,
                color: Colors.white,
                size: 25,
              ),
            ),
          ),
          const SizedBox(
            width: 5,
          )
        ],
      ),
    );
  }
}

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  final List<String> items = List<String>.generate(8, (index) => 'Item $index');
  final List<String> items2 = List<String>.generate(4, (index) => 'Item $index');

  double _currentValue = 0;

  final double _minValue = 0;

  final double _maxValue = 2000;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      width: 350,
      backgroundColor: Colors.white,
      child: ListView(
        padding: const EdgeInsets.only(top: 70, left: 10, right: 10),
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Filter Result',
                    style: FontConstant.styleRegular(
                        fontSize: 18, color: Colors.black),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    '(74 Services found)',
                    style: FontConstant.styleRegular(
                        fontSize: 12, color: Colors.black),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Sort by',
                style: FontConstant.styleRegular(
                    fontSize: 14, color: Colors.black),
              ),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 10,
              ),
              const DepartureRow(
                labelText: 'Departure Time:',
                dynamicText: 'Earliest First',
              ),
              const DepartureRow(
                labelText: 'Departure Time:',
                dynamicText: 'Latest First',
              ),
              const DepartureRow(
                labelText: 'Price:',
                dynamicText: 'High to Low',
              ),
              const DepartureRow(
                labelText: 'Price:',
                dynamicText: 'Low to High',
              ),
              const DepartureRow(
                labelText: 'Seat Availability:',
                dynamicText: 'High to Low',
              ),
              const DepartureRow(
                labelText: 'Seat Availability:',
                dynamicText: 'Low to High',
              ),
              const DepartureRow(
                labelText: 'Popularity:',
                dynamicText: 'Rating',
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                'Bus Type',
                style: FontConstant.styleRegular(
                    fontSize: 14, color: Colors.black),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 180,
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 0,
                    mainAxisSpacing: 0,
                    childAspectRatio: 1.0,
                  ),
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return GridTile(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Center(
                          child: Text(
                            items[index],
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Text(
                'Bus Partner & Location',
                style: FontConstant.styleRegular(
                    fontSize: 14, color: Colors.black),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                color: Colors.grey.withOpacity(0.3),
                height: 40,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 5),
                  child: Row(
                    children: [
                      Text(
                        'Bus Partner',
                        style: FontConstant.styleRegular(
                            fontSize: 12, color: Colors.black),
                      ),
                      const Spacer(),
                      const Icon(Icons.arrow_forward_ios, size: 20)
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                color: Colors.grey.withOpacity(0.3),
                height: 40,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 5),
                  child: Row(
                    children: [
                      Text(
                        'Boarding Point',
                        style: FontConstant.styleRegular(
                            fontSize: 12, color: Colors.black),
                      ),
                      const Spacer(),
                      const Icon(Icons.arrow_forward_ios, size: 20)
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                color: Colors.grey.withOpacity(0.3),
                height: 40,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 5),
                  child: Row(
                    children: [
                      Text(
                        'Dropping Point',
                        style: FontConstant.styleRegular(
                            fontSize: 12, color: Colors.black),
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.arrow_forward_ios,
                        size: 20,
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Price',
                style: FontConstant.styleRegular(
                    fontSize: 14, color: Colors.black),
              ),
              const SizedBox(
                height: 10,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('500'),
                  Text('2000'),
                ],
              ),
              Slider(
                value: _currentValue,
                min: _minValue,
                max: _maxValue,
                divisions: _maxValue.toInt(),
                label: _currentValue.round().toString(),
                onChanged: (double value) {
                  setState(
                    () {
                      _currentValue = value;
                    },
                  );
                },
              ),
              Text(
                'Departure Time',
                style: FontConstant.styleRegular(
                    fontSize: 14, color: Colors.black),
              ),
              SizedBox(
                height: 180,
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 0,
                    mainAxisSpacing: 0,
                    childAspectRatio: 1.0,
                  ),
                  itemCount: items2.length,
                  itemBuilder: (context, index) {
                    return GridTile(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Center(
                          child: Text(
                            items2[index],
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class DepartureRow extends StatefulWidget {
  final String labelText;
  final String dynamicText;

  const DepartureRow({
    super.key,
    required this.labelText,
    required this.dynamicText,
  });

  @override
  DepartureRowState createState() => DepartureRowState();
}

class DepartureRowState extends State<DepartureRow> {
  bool _isSelected = false;

  void _toggleSelection() {
    setState(() {
      _isSelected = !_isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleSelection,
      child: Column(
        children: [
          Row(
            children: [
              Text(
                widget.labelText,
                style:
                    FontConstant.styleRegular(fontSize: 12, color: Colors.grey),
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                widget.dynamicText,
                style: FontConstant.styleRegular(
                    fontSize: 12, color: Colors.black),
              ),
              const Spacer(),
              _isSelected
                  ? const Icon(Icons.check_circle,
                      color: AppColors.primaryColor)
                  : const Icon(Icons.radio_button_off, color: Colors.grey)
            ],
          ),
          const SizedBox(
            height: 6,
          ),
          Container(
            height: 1,
            width: double.infinity,
            color: Colors.grey.shade300,
          ),
          const SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }
}
