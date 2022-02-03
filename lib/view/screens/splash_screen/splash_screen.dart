import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_app/core/constants/app_colors.dart';
import 'package:todo_app/core/constants/sizeconfig.dart';
import 'package:todo_app/view/screens/home_page/home_page.dart';
import 'package:todo_app/view/widgets/cubit/bottom_navbar_cubit/bottom_nav_bar_view.dart';

class SplashSceenPage extends StatelessWidget {
  const SplashSceenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      // backgroundColor: AppColors.splashScaffoldColor,
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(
              top: getHeight(181),
              left: getWidth(100),
              right: getWidth(94),
            ),
            child: SvgPicture.asset(
              "assets/images/splash_screen.svg",
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: getHeight(125),
              left: getWidth(62),
              right: getWidth(60),
            ),
            child: Text(
              "Reminders made simple",
              style: TextStyle(
                fontSize: getHeight(22),
                fontWeight: FontWeight.w500,
                color: AppColors.textColor,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: getHeight(171),
              left: getWidth(62),
              right: getWidth(55),
            ),
            height: getHeight(56),
            width: getWidth(258),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(getWidth(10)),
              gradient: const LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Color(0xff5DE61A),
                  Color(0xff39A801),
                ],
              ),
            ),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: Size(getWidth(258), getWidth(58)),
                primary: Colors.transparent,
                elevation: 0,
              ),
              child: Text(
                "Get Started",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: getHeight(15),
                  fontWeight: FontWeight.w400,
                ),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/home');
              },
            ),
          ),
        ],
      ),
    );
  }
}
