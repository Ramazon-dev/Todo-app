import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_body_state.dart';

class HomeBodyCubit extends Cubit<HomeBodyState> {
  final _items = List.generate(10, (int index) => index);
  int value = 1;

  HomeBodyCubit() : super(HomeBodyInitial());

  onChaningPoint(v) {
    value = v;
    emit(HomeBodyInitial());
  }

  deleteDismis(int index) {
    _items.removeAt(index);
    emit(HomeBodyInitial());
  }

  List get items => _items;
}
