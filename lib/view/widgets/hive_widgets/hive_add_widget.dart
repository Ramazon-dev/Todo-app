// import 'package:flutter/material.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:todo_app/model/reminders.dart';

// class AddHiveWidget extends StatefulWidget {
//   const AddHiveWidget({Key? key}) : super(key: key);

//   @override
//   _AddHiveWidgetState createState() => _AddHiveWidgetState();
// }

// class _AddHiveWidgetState extends State<AddHiveWidget> {
//   final _hiveFormKey = GlobalKey<FormState>();
//   final _nameController = TextEditingController();

//   late final Box box;

//   String? _fieldValidator(String? value) {
//     if (value == null || value.isEmpty) {
//       return "Field can't be empty";
//     } else {
//       return null;
//     }
//   }

//   _addInfo() async {
//     Reminders newReminder = Reminders(
//       name: _nameController.text,
//       type: "srochna",
//       dateTime: DateTime.now(),
//     );
//     box.add(newReminder);
//     print("Data saqlandi");
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }
