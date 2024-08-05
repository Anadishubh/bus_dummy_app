import 'package:bms/utils/color_constant.dart';
import 'package:bms/utils/font_constant.dart';
import 'package:flutter/material.dart';

class AgenciesListview extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;

  const AgenciesListview({
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
                padding: const EdgeInsets.only(left: 15.0),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.fill,
                  height: 50,
                ),
              ),
              const SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: FontConstant.styleSemiBold(
                        fontSize: 12, color: Colors.black),
                  ),
                  const SizedBox(height: 4),
                  Container(
                    height: 15,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.star,
                          size: 10,
                          color: Colors.white,
                        ),
                        Text(
                          '3.54',
                          style: FontConstant.styleBold(
                              fontSize: 10, color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Container(
              width: 290,
              height: 1,
              color: Colors.grey.shade300,
            ),
          ),
          const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Text(
              description,
              textAlign: TextAlign.left,
              style:
                  FontConstant.styleRegular(fontSize: 11, color: Colors.black),
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(left: 215, bottom: 10),
            child: GestureDetector(
              onTap: () {
                // Handle tap
              },
              child: Text(
                'More Details +',
                style: FontConstant.styleSemiBold(
                    fontSize: 10, color: AppColors.primaryColor),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
