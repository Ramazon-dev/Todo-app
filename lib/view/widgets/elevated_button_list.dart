import 'package:flutter/material.dart';
import 'package:todo_app/core/constants/list_model.dart';

class ElevatedButtonWidget extends StatelessWidget {
  int index;
  ElevatedButtonWidget(this.index, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(0),
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          overlayColor:
              getColor(Colors.white, Listofcontexts.colorOFcircle[index]),
        ),
        onPressed: () {},
        child: Text(
          Listofcontexts.nameOfprojects[index],
          style: const TextStyle(
            color: Color(0xff8E8E8E),
          ),
        ),
      ),
    );
  }

  MaterialStateProperty<Color> getColor(Color color, Color colorPassed) {
    final getColor = (Set<MaterialState> state) {
      if (state.contains(MaterialState.pressed)) {
        return colorPassed;
      } else {
        return color;
      }
    };
    return MaterialStateProperty.resolveWith((getColor));
  }
}
