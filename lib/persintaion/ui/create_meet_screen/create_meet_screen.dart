import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mohafez_elwaheen_teacher/bloc/table_cubit/table_cubit.dart';
import 'package:mohafez_elwaheen_teacher/core/helpers/helper_functions.dart';
import 'package:mohafez_elwaheen_teacher/core/widgets/loading_widget.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'dart:ui' as ui;
import '../../../core/enums.dart';
import '../../../core/widgets/texts.dart';

class CreateMeetScreen extends StatefulWidget {
  @override
  State<CreateMeetScreen> createState() => _CreateMeetScreenState();
}

class _CreateMeetScreenState extends State<CreateMeetScreen> {
  final _controllerLink = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: true,
        backgroundColor: Colors.green,
        title: const Texts(
            title: "انشاء  موعد  جديد",
            family: "tra",
            textColor: Colors.white,
            fontSize: 25,
            weight: FontWeight.bold,
            align: TextAlign.center),
      ),
      body: BlocBuilder<TableCubit, TableState>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: Directionality(
              textDirection: ui.TextDirection.rtl,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(children: [
                  sizedHeight(25),
                  const TextTitle(text: "اختار التاريخ "),
                  Row(
                    children: [
                      Expanded(
                        child: ContainerField(
                            text: state.date != null
                                ? state.date!.split(" ")[0]
                                : "اختار التاريخ ",
                            onTap: () {
                              pickDateWidget(
                                context: context,
                                onSubmit: (date) {
                                  TableCubit.get(context)
                                      .changeSelectData(1, date.toString());
                                  String day =
                                      DateFormat('EEEE', "ar").format(date);
                                  TableCubit.get(context)
                                      .changeSelectData(2, day);
                                },
                              );
                            }),
                      ),
                      sizedWidth(10),
                      ContainerField(
                          text: state.day != null ? state.day! : "اليوم",
                          onTap: () {})
                    ],
                  ),
                  const TextTitle(text: "اختار الوقت "),
                  Row(
                    children: [
                      Expanded(
                        child: ContainerField(
                            text: state.fromHour != null
                                ? state.fromHour!
                                : "مــن",
                            onTap: () {
                              pickTimeWidget(
                                context: context,
                                onSubmit: (time) {
                                  TableCubit.get(context)
                                      .changeSelectData(3, formatTime(time));
                                },
                              );
                            }),
                      ),
                      sizedWidth(10),
                      Expanded(
                        child: ContainerField(
                            text: state.toHour != null
                                ? state.toHour!
                                : "إلــــى",
                            onTap: () {
                              pickTimeWidget(
                                context: context,
                                onSubmit: (time) {
                                  TableCubit.get(context)
                                      .changeSelectData(4, formatTime(time));
                                },
                              );
                            }),
                      )
                    ],
                  ),
                  const TextTitle(text: "رابط zoom"),
                  Container(
                    height: 60,
                    margin: const EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: .8),
                        borderRadius: BorderRadius.circular(15)),
                    child: TextField(
                     
                      controller: _controllerLink,
                      cursorColor: Colors.grey,
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: "رابط zoom",
                        hintStyle: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.normal,
                          color: Colors.black.withOpacity(.5),
                        ),
                        border: InputBorder.none,

                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        // prefixIcon: Icon(
                        //   prefixIcon,
                        //   color: Color(0xffDBDBDB),
                        // )
                      ),
                    ),
                  ),
                  sizedHeight(60),
                state.addMeetState== RequestState.loading? 
                
                const LoadingWidget(height: 50, color: Colors.green)
                 :GestureDetector(
                    onTap: () {
                      if (validate(context, state)) {
                        TableCubit.get(context).addMeet(
                          context: context,
                          date: state.date,
                          day: state.day,
                          from: state.fromHour,
                          to: state.toHour,
                          link: _controllerLink.text,
                          note: "note"
                        );
                      }
                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: const Color(0x330d7f43),
                        borderRadius: BorderRadius.circular(21.0),
                      ),
                      child: const Center(
                        child: Texts(
                            title: "انشاء",
                            family: "tra",
                            textColor: Color(0xff0D7F43),
                            fontSize: 30,
                            weight: FontWeight.bold,
                            align: TextAlign.center),
                      ),
                    ),
                  )
                ]),
              ),
            ),
          );
        },
      ),
    );
  }

  bool validate(BuildContext context, TableState state) {
    if (state.date == null) {
      showTopMessage(
          context: context,
          customBar: const CustomSnackBar.error(
            backgroundColor: Colors.red,
            message: "اختار تاريخ الموعد",
            textStyle: TextStyle(
                fontFamily: "font", fontSize: 16, color: Colors.white),
          ));

      return false;
    } else if (state.fromHour == null) {
      showTopMessage(
          context: context,
          customBar: const CustomSnackBar.error(
            backgroundColor: Colors.red,
            message: "اختار بداية الدرس",
            textStyle: TextStyle(
                fontFamily: "font", fontSize: 16, color: Colors.white),
          ));

      return false;
    } else if (state.toHour == null) {
      showTopMessage(
          context: context,
          customBar: const CustomSnackBar.error(
            backgroundColor: Colors.red,
            message: "اختار نهاية الدرس",
            textStyle: TextStyle(
                fontFamily: "font", fontSize: 16, color: Colors.white),
          ));

      return false;
    } else if (_controllerLink.text.isEmpty) {
      showTopMessage(
          context: context,
          customBar: const CustomSnackBar.error(
            backgroundColor: Colors.red,
            message: "أدخل رابط Zoom",
            textStyle: TextStyle(
                fontFamily: "font", fontSize: 16, color: Colors.white),
          ));

      return false;
    } else {
      return true;
    }
  }
}

class ContainerField extends StatelessWidget {
  final String text;
  final void Function() onTap;
  const ContainerField({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(top: 10, bottom: 20),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: .8),
            borderRadius: BorderRadius.circular(15)),
        child: Center(
            child: Row(
          children: [
            Text(
              text,
              style: const TextStyle(color: Colors.black, fontSize: 25),
            ),
          ],
        )),
      ),
    );
  }
}

class TextTitle extends StatelessWidget {
  final String text;
  const TextTitle({required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Texts(
            title: text,
            family: "tra",
            textColor: Colors.black,
            fontSize: 25,
            weight: FontWeight.bold,
            align: TextAlign.center),
      ],
    );
  }
}
