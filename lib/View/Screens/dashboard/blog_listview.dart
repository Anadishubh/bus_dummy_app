import 'package:bms/utils/color_constant.dart';
import 'package:bms/utils/font_constant.dart';
import 'package:flutter/material.dart';

class BlogListview extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;

  const BlogListview({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 10),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.fill,
                  height: 110,
                ),
              ),
              const SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: FontConstant.styleSemiBold(
                        fontSize: 13, color: Colors.black),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.calendar_month,
                        size: 20,
                        color: AppColors.primaryColor,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        '28 July 24',
                        style: FontConstant.styleBold(
                            fontSize: 10, color: AppColors.primaryColor),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 18.0),
                    child: Text(
                      description,
                      textAlign: TextAlign.left,
                      style: FontConstant.styleRegular(
                          fontSize: 11, color: Colors.black),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
