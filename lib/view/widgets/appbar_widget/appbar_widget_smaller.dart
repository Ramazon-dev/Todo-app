import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_app/core/constants/app_colors.dart';
import 'package:todo_app/core/constants/sizeconfig.dart';

class AppBarWidgetSmaller extends StatelessWidget {
  const AppBarWidgetSmaller({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Stack(
      children: [
        Positioned(
          child: Container(
            height: getHeight(106.0),
            width: getWidth(375.0),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  "assets/images/appbarBack.png",
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
        Positioned(child: SvgPicture.asset("assets/images/Ellipse_big.svg")),
        Positioned(
            right: 0,
            top: 0,
            child: SvgPicture.asset("assets/images/Ellipse_small.svg")),
      ],
    );
  }
}
