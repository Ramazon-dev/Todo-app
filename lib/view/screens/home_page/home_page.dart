import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/core/constants/app_colors.dart';
import 'package:todo_app/core/constants/sizeconfig.dart';
import 'package:todo_app/view/screens/home_page/is_empty.dart';
import 'package:todo_app/view/screens/home_page/list_today_part.dart';
import 'package:todo_app/view/widgets/appbar_widget/appbar_widget_bigger.dart';
import 'package:todo_app/view/widgets/appbar_widget/appbar_widget_smaller.dart';
import 'package:todo_app/view/widgets/cubit/home_body_cubit/home_body_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final Box contactBox;

  _deleteInfo(int index) {
    contactBox.deleteAt(index);
  }

  @override
  void initState() {
    super.initState();
    contactBox = Hive.box('remindersBox');
  }

  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return ValueListenableBuilder(
      valueListenable: contactBox.listenable(),
      builder: (context, Box box, widget) {
        return Scaffold(
          body: Column(
            children: [
              const AppBarWidgetSmaller(),
              Expanded(
                child: box.isNotEmpty
                    ? Column(children: [
                        // AppBarWidgetBigger(),
                        Padding(
                          padding: EdgeInsets.only(
                            left: getWidth(18.0),
                            top: getHeight(10.0),
                            bottom: getHeight(10),
                          ),
                          child: Text(
                            "Today",
                            style: TextStyle(
                              color: AppColors.textColor,
                              fontSize: getHeight(15.0),
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: getHeight(320),
                          width: MediaQuery.of(context).size.width,
                          child: ListPage(),
                        ),
                      ])
                    : const HomePageIsEmpty(),
              ),
            ],
          ),
        );

        // Padding(
        //   padding: EdgeInsets.only(
        //     left: getWidth(18.0),
        //     top: getHeight(10.0),
        //     bottom: getHeight(10),
        //   ),
        //   child: Text(
        //     "Tomorrow",
        //     style: TextStyle(
        //       color: AppColors.textColor,
        //       fontSize: getHeight(15.0),
        //       fontWeight: FontWeight.w700,
        //     ),
        //   ),
        // ),
        // SizedBox(
        //   height: getHeight(320),
        //   width: MediaQuery.of(context).size.width,
        //   child: ListPage(),
        // ),
      },
    );
  }
}
