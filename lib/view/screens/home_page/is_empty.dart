import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_app/core/constants/app_colors.dart';
import 'package:todo_app/core/constants/sizeconfig.dart';

class HomePageIsEmpty extends StatelessWidget {
  const HomePageIsEmpty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: getHeight(150.0),
            bottom: getHeight(70.0),
          ),
          child: Center(
            child: SvgPicture.asset(
              "assets/images/home_page.svg",
              height: getHeight(164.0),
              width: getWidth(120.0),
            ),
          ),
        ),
        Text(
          "No Tasks ",
          style: TextStyle(
            color: AppColors.textColor,
            fontSize: getHeight(22.0),
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
