import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import 'package:todo_app/view/screens/home_page/home_page.dart';
import 'package:todo_app/view/screens/task_page/task_page.dart';

part 'bottom_nav_bar_state.dart';

class BottomNavBarCubit extends Cubit<BottomNavBarState> {
  int pageIndex = 0;
  BottomNavBarCubit() : super(BottomNavBarInitial());
  List listOfPages = [
    HomePage(),
    TaskPage(),
  ];

  changePages(int tappedindex) async{
  await Hive.openBox('remindersBox');

    pageIndex = tappedindex;
    emit(BottomNavBarInitial());
  }
}
