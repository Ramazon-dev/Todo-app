import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/core/constants/list_model.dart';
import 'package:todo_app/core/constants/sizeconfig.dart';
import 'package:todo_app/view/widgets/cubit/home_body_cubit/home_body_cubit.dart';

class ListPage extends StatefulWidget {
  ListPage({Key? key}) : super(key: key);

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  int? value;

  late final Box contactBox;

  // delete info from people box
  _deleteInfo(int index) {
    contactBox.deleteAt(index);
  }

  @override
  void initState() {
    super.initState();
    // get reference to an already opened box
    contactBox = Hive.box('remindersBox');
  }

  @override
  void dispose() {
    // close all Hive boxes
    Hive.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return ValueListenableBuilder(
      valueListenable: contactBox.listenable(),
      builder: (context, Box box, widget) {
        if (box.isEmpty) {
          return Container();
        } else {
          return BlocProvider(
            create: (_) => HomeBodyCubit(),
            child: BlocBuilder<HomeBodyCubit, HomeBodyState>(
              builder: (context, state) {
                var _context = context.watch<HomeBodyCubit>();
                return Scaffold(
                  body: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    itemCount: box.length,
                    itemBuilder: (context, index) {
                      var currentBox = box;
                      var personDada = currentBox.getAt(index)!;
                      return dismissiblePart(
                        _context,
                        index,
                        context,
                        personDada,
                      );
                    },
                  ),
                );
              },
            ),
          );
        }
      },
    );
  }

  Dismissible dismissiblePart(
      HomeBodyCubit _context, int index, BuildContext context, personData) {
    bool _color = false;
    return Dismissible(
      background: Container(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SvgPicture.asset("assets/images/comment.svg"),
            SizedBox(width: getWidth(6)),
            SvgPicture.asset("assets/images/trash.svg"),
            SizedBox(width: getWidth(6)),
          ],
        ),
      ),
      key: ValueKey<int>(_context.items[index]),
      onDismissed: (DismissDirection direction) {
        _context.deleteDismis(index);
        _deleteInfo(index);
      },
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: const Color(0xffBBBBBB).withOpacity(0.05),
                offset: const Offset(-5, 5),
                blurRadius: 0.8)
          ],
        ),
        child: Card(
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.only(
                  top: getHeight(100.0),
                ),
                height: getHeight(55.0),
                width: getWidth(4.0),
                decoration: BoxDecoration(
                  color: Listofcontexts.colors[index],
                  borderRadius: BorderRadius.circular(
                    getWidth(5.0),
                  ),
                ),
              ),
              Radio(
                  value: Listofcontexts.radioValue[index],
                  groupValue: _context.value,
                  onChanged: (v) {
                    context.read<HomeBodyCubit>().onChaningPoint(v);
                    // context.read<HomebodyCubit>().onchangeingPoint(v);
                  }),
              Text(
                personData.day,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: getHeight(13.0),
                ),
              ),
              SizedBox(
                width: getWidth(10.0),
              ),
              SizedBox(
                width: getWidth(248.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      personData.name,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: getHeight(16.0),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      width: getWidth(20.0),
                    ),
                    SvgPicture.asset(
                      "assets/images/bell2.svg",
                      height: getHeight(20.0),
                      width: getWidth(30.0),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
