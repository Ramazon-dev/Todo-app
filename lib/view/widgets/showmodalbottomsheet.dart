import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/core/constants/list_model.dart';
import 'package:todo_app/core/constants/sizeconfig.dart';
import 'package:todo_app/model/reminders.dart';
import 'package:todo_app/view/widgets/dropdown_button.dart';
import 'package:todo_app/view/widgets/elevated_button_list.dart';

class ShowModalBottomSheetWidget extends StatefulWidget {
  const ShowModalBottomSheetWidget({Key? key}) : super(key: key);

  @override
  State<ShowModalBottomSheetWidget> createState() =>
      _ShowModalBottomSheetWidgetState();
}

class _ShowModalBottomSheetWidgetState
    extends State<ShowModalBottomSheetWidget> {
  @override
  final _hiveFormKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();

  late final Box box;

  String? _fieldValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Field can't be empty";
    } else {
      return null;
    }
  }

  String? hour;
  String? minute;
  @override
  void initState() {
    super.initState();
    // get reference to an already opened box
    box = Hive.box('remindersBox');
  }

  _addInfo() async {
    Reminders newReminder = Reminders(
      name: _nameController.text,
      day: "srochna",
      dateTime: DateTime.now(),
    );
    box.add(newReminder);
    print("Data saqlandi");
  }

  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return FloatingActionButton(
      onPressed: () {
        // print("datalar: ${box.getAt(0)}, ${box.getAt(0)}");
        showModalBottomSheet(
          backgroundColor: Colors.transparent,
          context: context,
          builder: (BuildContext context) {
            return Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Positioned(
                  top: MediaQuery.of(context).size.height / 25,
                  left: 0,
                  child: Container(
                    height: getHeight(691),
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.elliptical(175, 30),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height / 2 - 415,
                  child: Form(
                    key: _hiveFormKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            width: 55,
                            height: 55,
                            decoration: BoxDecoration(
                              color: const Color(0xffE0139C),
                              borderRadius: BorderRadius.all(
                                Radius.circular(getWidth(50.0)),
                              ),
                            ),
                            child: SvgPicture.asset(
                              "assets/images/x.svg",
                            ),
                          ),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            SizedBox(height: getHeight(10)),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              alignment: Alignment.center,
                              child: Text(
                                'Add new task',
                                style: TextStyle(
                                    fontSize: getHeight(13),
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            SizedBox(height: getHeight(10)),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 1.2,
                              child: TextFormField(
                                controller: _nameController,
                                validator: _fieldValidator,
                                autofocus: true,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                            const SizedBox(height: 5),
                            Container(
                              width: getWidth(333),
                              height: getHeight(60),
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              decoration: const BoxDecoration(
                                border: Border(
                                  top: BorderSide(
                                    width: 1.0,
                                    color: Colors.grey,
                                  ),
                                  bottom: BorderSide(
                                    width: 1.0,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: EdgeInsets.only(
                                      right: getWidth(15),
                                    ),
                                    child: Container(
                                      height: getHeight(50),
                                      width: getWidth(
                                        index == 0 || index == 3 ? 100 : 90,
                                      ),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Align(
                                            alignment: Alignment.topCenter,
                                            child: CircleAvatar(
                                              backgroundColor: Listofcontexts
                                                  .colorOFcircle[index],
                                              radius: 5.0,
                                            ),
                                          ),
                                          ElevatedButtonWidget(index),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                                itemCount: 4,
                              ),
                            ),
                            const SizedBox(height: 20),
                            Container(
                              padding: EdgeInsets.only(left: getWidth(18)),
                              alignment: Alignment.topLeft,
                              width: MediaQuery.of(context).size.width,
                              // color: Colors.yellow,
                              child: DropDownButtonWidget(),
                            ),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            top: getHeight(52),
                          ),
                          height: getHeight(53),
                          width: getWidth(333),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(getWidth(10)),
                            gradient: const LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [
                                Color(0xff7EB6FF),
                                Color(0xff5F87E7),
                              ],
                            ),
                          ),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              fixedSize: Size(getWidth(258), getWidth(58)),
                              primary: Colors.transparent,
                              elevation: 0,
                            ),
                            onPressed: () {
                              if (_hiveFormKey.currentState!.validate()) {
                                _addInfo();
                                Navigator.pop(context);
                                _nameController.clear();
                              }
                            },
                            child: const Text(
                              "Add task",
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
      child: SvgPicture.asset("assets/images/add.svg"),
      backgroundColor: const Color(0xffE0139C),
    );
  }
}
