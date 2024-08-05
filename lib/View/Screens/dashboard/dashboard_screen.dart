import 'package:bms/utils/color_constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bms/utils/font_constant.dart';
import 'package:bms/utils/images_constant.dart';
import 'package:intl/intl.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  final List<String> imagePaths = [
    Images.price1,
    Images.price1,
  ];
  final List<String> imagePaths2 = [
    Images.green,
    Images.green,
  ];

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
      end: 240,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Image(
                    image: const AssetImage(Images.rectangle),
                    fit: BoxFit.fill,
                    height: screenWidth * 0.7,
                    width: double.infinity,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(
                          Icons.menu,
                          color: Colors.white,
                        ),
                        Text(
                          'Dashboard',
                          style: FontConstant.styleMedium(
                              fontSize: 18, color: Colors.white),
                        ),
                        const Icon(
                          Icons.notifications,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: screenHeight * 0.1, left: 20, right: 20),
                    child: Stack(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Search for Bus Tickets',
                              style: FontConstant.styleMedium(
                                  fontSize: 18, color: Colors.white),
                            ),
                            const SizedBox(height: 10),
                            Container(
                              height: 250,
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
                                    padding: const EdgeInsets.only(
                                        left: 16.0, top: 16),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        buildLocationRow(
                                            CupertinoIcons.location,
                                            'Leaving from'),
                                        const SizedBox(height: 10),
                                        buildDividerWithIcon(),
                                        const SizedBox(height: 10),
                                        buildLocationRow(
                                            Icons.location_on_outlined,
                                            'Going to'),
                                        const SizedBox(height: 14),
                                        const Text(
                                          'Departure',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        DynamicCalendar(
                                          onDateSelected: (DateTime) {},
                                        ),
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                    top: 50,
                                    right: 16,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.black.withOpacity(0.8),
                                      ),
                                      child: const SizedBox(
                                        height: 45,
                                        width: 45,
                                        child: Center(
                                          child: Icon(
                                            CupertinoIcons.arrow_up_arrow_down,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
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
                                    onTap: () {},
                                    borderRadius: BorderRadius.circular(8),
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 100, vertical: 6),
                                      child: const Row(
                                        children: [
                                          Icon(
                                            Icons.search,
                                            color: Colors.white,
                                          ),
                                          Text(
                                            'Search Bus',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                            ),
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
                            const Image(
                              image: AssetImage(Images.single),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Book My Sewa Guarantee',
                              style: FontConstant.styleMedium(
                                  fontSize: 16, color: Colors.black),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              height: 65,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: imagePaths.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                    margin: const EdgeInsets.only(right: 10),
                                    child: Image.asset(
                                      imagePaths[index],
                                      fit: BoxFit.fill,
                                    ),
                                  );
                                },
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
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
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Follow Us on Instagram',
                                          style: FontConstant.styleBold(
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
                                      padding:
                                          const EdgeInsets.only(right: 8.0),
                                      child: Container(
                                        height: 22,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 1),
                                        decoration: BoxDecoration(
                                          color: AppColors.primaryColor,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: const Center(
                                          child: Text(
                                            'Go to Instagram',
                                            style: TextStyle(
                                              fontSize: 11,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Special Offers',
                                  style: FontConstant.styleMedium(
                                      fontSize: 16, color: Colors.black),
                                ),
                                TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    'View All',
                                    style: FontConstant.styleBold(
                                        fontSize: 12,
                                        color: AppColors.primaryColor),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 120,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: imagePaths2.length,
                                itemBuilder: (context, index) {
                                  return Image.asset(
                                    imagePaths2[index],
                                    fit: BoxFit.fill,
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 1000,
                        ),
                        AnimatedBuilder(
                          animation: _animation,
                          builder: (context, child) {
                            return Positioned(
                              top: 0,
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
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildLocationRow(IconData icon, String hint) {
    return Row(
      children: [
        Icon(
          icon,
          size: 25,
          color: Colors.black.withOpacity(0.6),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: TextField(
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hint,
                hintStyle: FontConstant.styleMedium(
                    fontSize: 16, color: Colors.black)),
          ),
        ),
      ],
    );
  }

  Widget buildDividerWithIcon() {
    return Row(
      children: [
        Container(
          width: 230,
          color: Colors.black.withOpacity(0.2),
          height: 2,
        ),
      ],
    );
  }
}

class DynamicCalendar extends StatefulWidget {
  final Function(DateTime) onDateSelected;

  const DynamicCalendar({super.key, required this.onDateSelected});

  @override
  _DynamicCalendarState createState() => _DynamicCalendarState();
}

class _DynamicCalendarState extends State<DynamicCalendar> {
  late DateTime _selectedDate;
  late List<DateTime> _visibleDates;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now();
    _updateVisibleDates(_selectedDate);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _updateVisibleDates(DateTime baseDate) {
    _visibleDates = List.generate(30, (index) {
      return DateTime(baseDate.year, baseDate.month, 1)
          .add(Duration(days: index));
    });
  }

  void _selectDate(DateTime date) {
    setState(() {
      _selectedDate = date;
    });
    widget.onDateSelected(date);
  }

  Future<void> _selectMonth(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
      initialDatePickerMode: DatePickerMode.year,
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _updateVisibleDates(picked);
      });
      widget.onDateSelected(picked);
      _scrollToSelectedDate();
    }
  }

  void _scrollToSelectedDate() {
    int selectedIndex = _visibleDates.indexOf(_selectedDate);
    if (selectedIndex != -1) {
      _scrollController.animateTo(
        selectedIndex * 47.0,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: Colors.white,
      child: Row(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              scrollDirection: Axis.horizontal,
              itemCount: _visibleDates.length,
              itemBuilder: (context, index) {
                return _buildDateColumn(_visibleDates[index]);
              },
            ),
          ),
          Container(
            color: Colors.grey,
            width: 2,
            height: 50,
          ),
          _buildMonthYear(context),
        ],
      ),
    );
  }

  Widget _buildDateColumn(DateTime date) {
    bool isSelected = date.year == _selectedDate.year &&
        date.month == _selectedDate.month &&
        date.day == _selectedDate.day;

    return GestureDetector(
      onTap: () => _selectDate(date),
      child: SizedBox(
        width: 45,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSelected ? AppColors.primaryColor : Colors.transparent,
              ),
              child: Center(
                child: Text(
                  '${date.day}',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: isSelected ? Colors.white : Colors.black,
                  ),
                ),
              ),
            ),
            Text(
              DateFormat('EEE').format(date).toUpperCase(),
              style: const TextStyle(
                fontSize: 10,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMonthYear(BuildContext context) {
    return GestureDetector(
      onTap: () => _selectMonth(context),
      child: Container(
        padding: const EdgeInsets.only(left: 10, top: 5),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  DateFormat('MMM').format(_selectedDate).toUpperCase(),
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                Text(
                  '${_selectedDate.year}',
                  style: const TextStyle(
                    fontSize: 10,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            const Icon(Icons.arrow_drop_down, color: Colors.red, size: 30),
          ],
        ),
      ),
    );
  }
}
