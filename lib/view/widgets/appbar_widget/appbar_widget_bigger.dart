import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_app/core/constants/sizeconfig.dart';

class AppBarWidgetBigger extends StatelessWidget {
  const AppBarWidgetBigger({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Stack(
      children: [
        Positioned(
          child: Container(
            height: getHeight(238),
            width: getWidth(375),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  "assets/images/appbarbiger.png",
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(
                top: getHeight(40.0),
                left: getWidth(25.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Hello Brenda",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: getHeight(18.0),
                            ),
                          ),
                          Text(
                            "Today you have 9 tasks",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: getHeight(18.0),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: getWidth(91.0),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: CircleAvatar(
                          radius: getHeight(19.0),
                          backgroundColor: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          child: SvgPicture.asset(
            "assets/images/Ellipse_big.svg",
          ),
        ),
        Positioned(
          right: 0,
          top: 0,
          child: SvgPicture.asset(
            "assets/images/Ellipse_small.svg",
          ),
        ),
        Positioned(
          top: getHeight(119),
          left: getWidth(18),
          right: getWidth(18),
          child: Container(
            height: getHeight(106),
            width: getWidth(339),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  "assets/images/appbarReminder.png",
                ),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(
                top: getHeight(21),
                left: getWidth(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Today Reminder",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: getHeight(20.0),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: getHeight(10)),
                    child: Text(
                      "Meeting with client",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: getHeight(11.0),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Text(
                    "13.00 PM",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: getHeight(11.0),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: getHeight(135),
          left: getWidth(275),
          child: SvgPicture.asset(
            "assets/images/bell.svg",
          ),
        ),
      ],
    );
  }
}
