import 'package:flutter/material.dart';
import 'package:test_assignment/constants/app_constant.dart';

class SubmitButtonWidget extends StatelessWidget {
  SubmitButtonWidget({
    Key? key,
    required this.title,
    this.height = 56,
    this.width,
    this.radius = 12,
    this.color = AppConstant.primary40,
    this.textColor = Colors.white,
    this.fontWeight = FontWeight.w700,
  }) : super(key: key);

  final String title;
  final double? height;
  final double? width;
  final double radius;
  final Color color;
  final Color textColor;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // width = size.width;
    return Container(
      height: height,
      width: width == null ? size.width - 32 : width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: color,
      ),
      child: Stack(
        children: [
          Center(
            child: Text(
              title,
              style: TextStyle(
                color: textColor,
                fontWeight: fontWeight,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
