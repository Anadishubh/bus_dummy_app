import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../utils/color_constant.dart';


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
    _visibleDates = List.generate(
      31,
          (index) {
        return DateTime(baseDate.year, baseDate.month, 1).add(
          Duration(days: index),
        );
      },
    );
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
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      height: screenHeight * 0.08,
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
              width: 33,
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
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () => _selectMonth(context),
      child: Container(
        padding: EdgeInsets.only(
            left: screenWidth * 0.025, top: screenHeight * 0.002),
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