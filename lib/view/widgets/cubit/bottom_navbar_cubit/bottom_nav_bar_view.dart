import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/core/constants/app_colors.dart';
import 'package:todo_app/core/constants/list_model.dart';
import 'package:todo_app/core/constants/sizeconfig.dart';
import 'package:todo_app/view/widgets/cubit/bottom_navbar_cubit/bottom_nav_bar_cubit.dart';
import 'package:todo_app/view/widgets/elevated_button_list.dart';
import 'package:todo_app/view/widgets/showmodalbottomsheet.dart';

class BottomNavBarView extends StatefulWidget {
  const BottomNavBarView({Key? key}) : super(key: key);

  @override
  State<BottomNavBarView> createState() => _BottomNavBarViewState();
}

class _BottomNavBarViewState extends State<BottomNavBarView> {
  late final Box box;

  @override
  void initState() {
    super.initState();
    // get reference to an already opened box
    box = Hive.box('remindersBox');
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BottomNavBarCubit(),
      child: BlocBuilder<BottomNavBarCubit, BottomNavBarState>(
          builder: (context, state) {
        var _context = context.watch<BottomNavBarCubit>();
        return Scaffold(
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: ShowModalBottomSheetWidget(),
          body: _context.listOfPages[_context.pageIndex],
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: _context.pageIndex,
            items: [
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  "assets/icons/Home.svg",
                  color: _context.pageIndex == 0
                      ? AppColors.textColor
                      : AppColors.bottomNavBarColor,
                ),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  "assets/icons/Grid.svg",
                  color: _context.pageIndex == 1
                      ? AppColors.textColor
                      : AppColors.bottomNavBarColor,
                ),
                label: "",
              ),
            ],
            onTap: (int index) {
              context.read<BottomNavBarCubit>().changePages(index);
            },
          ),
        );
      }),
    );
  }
}
