// import 'package:flutter/material.dart';
// import 'package:todo_app/core/constants/sizeconfig.dart';

// class ElevatedButtonAddTask extends StatefulWidget {
//   GlobalKey<FormState> personFormKey;
//   ElevatedButtonAddTask({
//     required this.personFormKey,
//     Key? key,
//   }) : super(key: key);

//   @override
//   State<ElevatedButtonAddTask> createState() => _ElevatedButtonAddTaskState();
// }

// class _ElevatedButtonAddTaskState extends State<ElevatedButtonAddTask> {
//   @override
//   Widget build(BuildContext context) {
//     SizeConfig().init(context);
//     return Container(
//       margin: EdgeInsets.only(
//         top: getHeight(52),
//       ),
//       height: getHeight(53),
//       width: getWidth(333),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(getWidth(10)),
//         gradient: const LinearGradient(
//           begin: Alignment.centerLeft,
//           end: Alignment.centerRight,
//           colors: [
//             Color(0xff7EB6FF),
//             Color(0xff5F87E7),
//           ],
//         ),
//       ),
//       child: ElevatedButton(
//         style: ElevatedButton.styleFrom(
//           fixedSize: Size(getWidth(258), getWidth(58)),
//           primary: Colors.transparent,
//           elevation: 0,
//         ),
//         onPressed: () {
          
//           Navigator.pop(context);
//         },
//         child: const Text(
//           "Add task",
//         ),
//       ),
//     );
//   }
// }
