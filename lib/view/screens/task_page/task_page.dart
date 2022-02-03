import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_app/core/constants/list_model.dart';
import 'package:todo_app/core/constants/sizeconfig.dart';
import 'package:todo_app/view/widgets/appbar_widget/appbar_widget_bigger.dart';

class TaskPage extends StatelessWidget {
  const TaskPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const AppBarWidgetBigger(),
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(
              top: getHeight(13),
              left: getWidth(18),
            ),
            child: Text(
              "Projects",
              style: TextStyle(
                fontSize: getHeight(13),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: getHeight(10),
            ),
            height: getHeight(450),
            child: GridView.builder(
              padding: EdgeInsets.all(getWidth(18)),
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                maxCrossAxisExtent: 159,
                mainAxisExtent: 180,
                childAspectRatio: 2,
              ),
              itemCount: 4,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 7,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 35,
                        backgroundColor: Listofcontexts.colorOFcircle[index],
                        child: SvgPicture.asset(
                          Listofcontexts.icons[index],
                        ),
                      ),
                      Text(
                        Listofcontexts.nameOfprojects[index],
                        style: TextStyle(
                          fontSize: getHeight(17),
                          fontWeight: FontWeight.w500,
                          color: const Color(0xff686868),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: getHeight(20)),
                        child: Text(
                          Listofcontexts.taskOfprojects[index],
                          style: TextStyle(
                            fontSize: getHeight(8),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
