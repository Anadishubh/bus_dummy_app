import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'color_constant.dart';
import 'font_constant.dart';

class DropdownWidget extends StatefulWidget {
  final String? title;
  final List<String> items;
  final Function(String?) onChanged;
  final String? hintText;
  final Color borderColor;
  final int initialIndex;

  const DropdownWidget({
    super.key,
    this.title,
    required this.items,
    required this.onChanged,
    this.hintText,
    this.borderColor = Colors.black,
    this.initialIndex = 0,
  });

  @override
  DropdownWidgetState createState() => DropdownWidgetState();
}

class DropdownWidgetState extends State<DropdownWidget> {
  late String? selectedValue;

  @override
  void initState() {
    super.initState();
    if (widget.initialIndex >= 0 && widget.initialIndex < widget.items.length) {
      selectedValue = widget.items[widget.initialIndex];
    } else {
      selectedValue = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.title != null && widget.title!.isNotEmpty)
          Text(
            widget.title!,
            style: FontConstant.styleRegular(fontSize: 16, color: Colors.black),
          ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: CustomDropdown(
            decoration: CustomDropdownDecoration(
              closedBorderRadius: BorderRadius.circular(23),
              closedBorder: Border.all(color: widget.borderColor),
              expandedFillColor: AppColors.primaryColor,
              listItemDecoration: const ListItemDecoration(
                splashColor: Colors.white,
              ),
              listItemStyle: const TextStyle(color: Colors.black),
            ),
            hintText: widget.hintText ?? '',
            items: widget.items,
            onChanged: (newValue) {
              setState(() {
                selectedValue = newValue;
              });
              widget.onChanged(newValue);
            },
            // Use the selectedValue here if needed
          ),
        ),
      ],
    );
  }
}
