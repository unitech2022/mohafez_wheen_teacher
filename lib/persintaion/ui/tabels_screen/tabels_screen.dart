import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mohafez_elwaheen_teacher/bloc/table_cubit/table_cubit.dart';
import 'package:mohafez_elwaheen_teacher/core/enums.dart';
import 'package:mohafez_elwaheen_teacher/core/helpers/helper_functions.dart';
import 'package:mohafez_elwaheen_teacher/core/widgets/loading_widget.dart';

import '../../../core/data/data.dart';
import '../../../core/styls/colors.dart';
import '../../../core/widgets/back_button.dart';
import '../../../core/widgets/custom_drop_down_widget.dart';
import '../../../core/widgets/texts.dart';
import '../../../models/table_model.dart';
import '../create_meet_screen/create_meet_screen.dart';

class TablesScreen extends StatefulWidget {
  const TablesScreen({super.key});

  @override
  State<TablesScreen> createState() => _TablesScreenState();
}

class _TablesScreenState extends State<TablesScreen> {
  @override
  void initState() {
    super.initState();
    TableCubit.get(context).getTables(context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffF6F6EE),
        body: Column(children: [
          SizedBox(
            height: 87,
            width: double.infinity,
            child: Stack(
              children: [
                Container(
                  height: double.infinity,
                  color: const Color(0xff0D7F43),
                  child: Image.asset(
                    "assets/images/img_back.png",
                    width: double.infinity,
                    height: 87,
                    fit: BoxFit.cover,
                  ),
                ),
                const Align(
                  alignment: Alignment.center,
                  child: Texts(
                      title: "الجـــــــدول",
                      family: "tra",
                      textColor: Colors.white,
                      fontSize: 35,
                      weight: FontWeight.bold,
                      align: TextAlign.center),
                ),
                // Align(
                //     alignment: Alignment.topLeft,
                //     child: Padding(
                //         padding: const EdgeInsets.all(15),
                //         child: IconButton(
                //           onPressed: () {
                //             pushPage(context, CreateMeetScreen());
                //           },
                //           icon: const Icon(
                //             Icons.add,
                //             color: Colors.white,size: 30, 
                //           ),
                //         )))
              ],
            ),
          ),
          BlocConsumer<TableCubit, TableState>(
            listener: (context, state) {
              if (state.getTablesState == RequestState.loaded) {
                TableCubit.get(context).tables =
                    state.tablesResponse!.teachers!;
              }
            },
            builder: (context, state) {
              return state.getTablesState == RequestState.loading
                  ? const Center(
                      child: LoadingWidget(height: 55, color: Colors.green),
                    )
                  : Expanded(
                      child: Container(
                      padding: EdgeInsets.all(12),
                      margin: EdgeInsets.all(26),
                      decoration: BoxDecoration(
                        color: const Color(0xffffffff),
                        borderRadius: BorderRadius.circular(20.0),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0x0f000000),
                            offset: Offset(0, 10),
                            blurRadius: 20,
                          ),
                        ],
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            // select time lessons
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    height: 60,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    decoration: BoxDecoration(
                                      color: const Color(0xffFF6F6EE),
                                      borderRadius: BorderRadius.circular(10.0),
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Color(0x0f000000),
                                          offset: Offset(0, 10),
                                          blurRadius: 20,
                                        ),
                                      ],
                                    ),
                                    child: CustomDropDownWidget2(
                                        currentValue: state.currentCategory,
                                        selectCar: false,
                                        textColor: const Color(0xff28436C),
                                        isTwoIcons: false,
                                        iconColor: const Color(0xff515151),
                                        list: state.tablesResponse!.categories!,
                                        onSelect: (value) {
                                          TableCubit.get(context)
                                              .changeDropDate(value: value);
                                          TableCubit.get(context).filterList(
                                              value: value,
                                              list: state
                                                  .tablesResponse!.teachers);
                                        },
                                        hint: "التاريخ"),
                                  ),
                                ),
                              ],
                            )

                            // list times

                            ,
                            ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: state.tables.length,
                                itemBuilder: (ctx, index) {
                                  TableModel table = state.tables[index];
                                  return Container(
                                    padding: EdgeInsets.all(16),
                                    margin: EdgeInsets.only(bottom: 12),
                                    decoration: BoxDecoration(
                                      color: const Color(0xffFF6F6EE),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              table.toHours!,
                                              style: const TextStyle(
                                                fontFamily: 'tra',
                                                fontSize: 20,
                                                color: Color(0xff000000),
                                                fontWeight: FontWeight.w700,
                                              ),
                                              textAlign: TextAlign.center,
                                              softWrap: false,
                                            ),
                                            sizedWidth(8),
                                            GestureDetector(
                                              onTap: () {
                                                TableCubit.get(context)
                                                    .updateStatusTable(
                                                        status:
                                                            table.status == 0
                                                                ? 1
                                                                : 0,
                                                        tableId: table.id!);
                                              },
                                              child: Transform.scale(
                                                scaleX: .65,
                                                scaleY: .55,
                                                child: CupertinoSwitch(
                                                  activeColor:
                                                      const Color(0xff22A45D),
                                                  thumbColor: Colors.white,
                                                  trackColor:
                                                      const Color.fromARGB(
                                                          255, 148, 150, 149),
                                                  onChanged: (value) {
                                                    TableCubit.get(context)
                                                        .updateStatusTable(
                                                            status:
                                                                table.status ==
                                                                        0
                                                                    ? 1
                                                                    : 0,
                                                            tableId: table.id!);
                                                  },
                                                  value: TableCubit.get(context)
                                                          .statuses
                                                          .containsValue(
                                                              table.id)
                                                      ? true
                                                      : false,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                table.link!,
                                                maxLines: 2,
                                                style: const TextStyle(
                                                  fontFamily: 'tra',
                                                  fontSize: 15,
                                                  color: Color(0xff000000),
                                                  fontWeight: FontWeight.normal,
                                                ),
                                                textAlign: TextAlign.start,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                            SizedBox(
                              height: 38,
                            )
                            // button create account
                            ,
                            GestureDetector(
                              onTap: () {
                                pop(context);
                              },
                              child: Container(
                                height: 70,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: const Color(0x330d7f43),
                                  borderRadius: BorderRadius.circular(21.0),
                                ),
                                child: Center(
                                  child: const Text(
                                    "رجوع",
                                    style: TextStyle(
                                        color: Colors.green,
                                        fontSize: 27,
                                        height: 1.1,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                        
                         SizedBox(
                              height: 15,
                            ),
                             GestureDetector(
                              onTap: () {
                                pushPage(context, CreateMeetScreen());
                              },
                              child: Container(
                                height: 70,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: const Color(0x330d7f43),
                                  borderRadius: BorderRadius.circular(21.0),
                                ),
                                child: Center(
                                  child: const Text(
                                    "اضافة موعد",
                                    style: TextStyle(
                                        color: Colors.green,
                                        fontSize: 27,
                                        height: 1.1,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                        
                        
                          ],
                        ),
                      ),
                    ));
            },
          )
        ]));
  }
}
