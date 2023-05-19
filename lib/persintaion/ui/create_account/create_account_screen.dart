import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mohafez_elwaheen_teacher/core/data/data.dart';
import 'package:mohafez_elwaheen_teacher/core/helpers/helper_functions.dart';
import 'package:mohafez_elwaheen_teacher/persintaion/ui/home_screen/home_screen.dart';

import '../../../core/styls/colors.dart';
import '../../../core/widgets/custom_drop_down_widget.dart';
import '../../../core/widgets/texts.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  CountryModel? currentValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        body: Column(children: [
          Expanded(
              flex: 1,
              child: Stack(
                children: [
                  Container(
                    height: double.infinity,
                    margin: const EdgeInsets.only(bottom: 50),
                    color: const Color(0xff0D7F43),
                    child: Image.asset(
                      "assets/images/img_back.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 100,
                      width: 100,
                      child: Image.asset(
                        "assets/images/logo.png",
                        height: 100,
                        width: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                ],
              )),
          Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: SingleChildScrollView(
                    child: Column(
                  children: [
                    const Texts(
                        title: "انشاء حساب جديد",
                        family: "tra",
                        textColor: Colors.black,
                        fontSize: 35,
                        weight: FontWeight.bold,
                        align: TextAlign.center),
                    sizedHeight(15),
                    //  upload Image
                    Container(
                      height: 100,
                      width: 100,
                      padding: const EdgeInsets.all(2),
                      decoration: const BoxDecoration(
                        color: Color(0xffffffff),
                        borderRadius:
                            BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x0f000000),
                            offset: Offset(0, 10),
                            blurRadius: 20,
                          ),
                        ],
                      ),
                      child: Stack(
                        children: [
                          Image.asset(
                            "assets/images/person.png",
                            height: 100,
                            width: 100,
                          ),
                          const Positioned(
                              right: 2,
                              bottom: 0,
                              child: Icon(Icons.cloud_upload))
                        ],
                      ),
                    ),
                    sizedHeight(25),
                    // field name
                    Container(
                      height: 60,
                      decoration: BoxDecoration(
                        color: const Color(0xffffffff),
                        borderRadius: BorderRadius.circular(20.0),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x0f000000),
                            offset: Offset(0, 10),
                            blurRadius: 20,
                          ),
                        ],
                      ),
                      child: TextField(
                        // controller: controller,
                        cursorColor: Colors.grey,
                        style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        // keyboardType: input,
                        decoration: InputDecoration(
                          hintText: "الاسم كاملا",
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

                    sizedHeight(15),
                    // select Gender

                    Container(
                      height: 60,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        color: const Color(0xffffffff),
                        borderRadius: BorderRadius.circular(20.0),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x0f000000),
                            offset: Offset(0, 10),
                            blurRadius: 20,
                          ),
                        ],
                      ),
                      child: CustomDropDownWidget(
                          currentValue: currentValue,
                          selectCar: false,
                          textColor: const Color(0xff28436C),
                          isTwoIcons: false,
                          iconColor: const Color(0xff515151),
                          list: countries,
                          onSelect: (value) {
                            print(value.name);
                          },
                          hint: "معلم/معلمة"),
                    ),
                    sizedHeight(15),
                    // select country

                    Container(
                      height: 60,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        color: const Color(0xffffffff),
                        borderRadius: BorderRadius.circular(20.0),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x0f000000),
                            offset: Offset(0, 10),
                            blurRadius: 20,
                          ),
                        ],
                      ),
                      child: CustomDropDownWidget(
                          currentValue: currentValue,
                          selectCar: false,
                          textColor: const Color(0xff28436C),
                          isTwoIcons: false,
                          iconColor: const Color(0xff515151),
                          list: countries,
                          onSelect: (value) {
                            print(value.name);
                          },
                          hint: "الدولة"),
                    ),
                    sizedHeight(30),

                    // button create account
                    GestureDetector(
                      onTap: () {
                        pushPage(context, const HomeScreen());
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
                 
                  ],
                )),
              ))
        ]));
  }
}

  // void showDialogWidget(BuildContext context) {
  //   int status = 1;
  //   int currentIndex = 1;
  //   showDialog<void>(
  //     context: context,
  //     barrierDismissible: false, // user must tap button!
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         titlePadding: EdgeInsets.zero,
  //         contentPadding: EdgeInsets.zero,
  //         insetPadding: EdgeInsets.all(20),
  //         shape: const RoundedRectangleBorder(
  //             borderRadius: BorderRadius.all(Radius.circular(15.0))),
  //         // contentPadding: EdgeInsets.only(top: 10.0),
  //         // title: const Text('AlertDialog Title'),
  //         content: StatefulBuilder(builder: (BuildContext context,
  //             void Function(void Function()) setStateDialog) {
  //           return Container(
  //               padding: const EdgeInsets.all(20),
  //               decoration: BoxDecoration(
  //                   color: Colors.white,
  //                   borderRadius: BorderRadius.circular(15)),
  //               child: status == 1
  //                   ? Column(
  //                       mainAxisSize: MainAxisSize.min,
  //                       children: [
  //                         const Text(
  //                           "ملاحظة",
  //                           textAlign: TextAlign.center,
  //                           style: TextStyle(
  //                               fontSize: 40,
  //                               fontWeight: FontWeight.bold,
  //                               color: Colors.black),
  //                         ),
  //                         const Text(
  //                             'تستطيع من خلال ايقونة اقرأ التسميع والحفظ مع الشيخ الذى تريده',
  //                             textAlign: TextAlign.center,
  //                             style: TextStyle(
  //                                 height: 1.2,
  //                                 fontSize: 28,
  //                                 fontWeight: FontWeight.normal,
  //                                 color: Colors.black)),
  //                         const SizedBox(
  //                           height: 10,
  //                         ),
  //                         GestureDetector(
  //                           onTap: () {
  //                             status++;
  //                             setStateDialog(
  //                               () {},
  //                             );
  //                           },
  //                           child: Container(
  //                             height: 50,
  //                             width: 200,
  //                             alignment: Alignment.center,
  //                             decoration: BoxDecoration(
  //                               color: const Color(0xffe0ddd6),
  //                               borderRadius: BorderRadius.circular(21.0),
  //                             ),
  //                             child: const Texts(
  //                                 title: "التالى",
  //                                 textColor: Colors.black,
  //                                 fontSize: 20,
  //                                 weight: FontWeight.bold,
  //                                 align: TextAlign.center),
  //                           ),
  //                         ),
  //                       ],
  //                     )
  //                   : Column(mainAxisSize: MainAxisSize.min, children: [
  //                       const Text(
  //                         "هل أنت ",
  //                         textAlign: TextAlign.center,
  //                         style: TextStyle(
  //                             fontSize: 40,
  //                             fontWeight: FontWeight.bold,
  //                             color: Colors.black),
  //                       ),
  //                       Row(
  //                         mainAxisAlignment: MainAxisAlignment.center,
  //                         children: [
  //                           GestureDetector(
  //                             onTap: () {
  //                               currentIndex = 1;
  //                               setStateDialog(
  //                                 () {},
  //                               );
  //                             },
  //                             child: Column(
  //                               children: [
  //                                 SvgPicture.asset(currentIndex == 1
  //                                     ? "assets/icons/man_s.svg"
  //                                     : "assets/icons/man.svg"),
  //                                 Texts(
  //                                     title: "طالب",
  //                                     textColor: currentIndex == 1
  //                                         ? Colors.black
  //                                         : Color(0xffA7A7A7),
  //                                     fontSize: 20,
  //                                     weight: FontWeight.bold,
  //                                     align: TextAlign.center),
  //                                 const SizedBox(
  //                                   width: 20,
  //                                 )
  //                               ],
  //                             ),
  //                           ),
  //                           const SizedBox(
  //                             width: 20,
  //                           ),
  //                           GestureDetector(
  //                             onTap: () {
  //                               currentIndex = 2;
  //                               setStateDialog(
  //                                 () {},
  //                               );
  //                             },
  //                             child: Column(
  //                               children: [
  //                                 SvgPicture.asset(currentIndex == 2
  //                                     ? "assets/icons/woman_s.svg"
  //                                     : "assets/icons/woman.svg"),
  //                                 Texts(
  //                                     title: "طالبة",
  //                                     textColor: currentIndex == 2
  //                                         ? Colors.black
  //                                         : Color(0xffA7A7A7),
  //                                     fontSize: 20,
  //                                     weight: FontWeight.bold,
  //                                     align: TextAlign.center),
  //                               ],
  //                             ),
  //                           )
  //                         ],
  //                       ),
  //                       Row(
  //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                         children: [
  //                           GestureDetector(
  //                             onTap: () {
  //                               pop(context);
  //                               pushPage(
  //                                   context, ReadersScreen(type: currentIndex));
  //                             },
  //                             child: Container(
  //                               height: 50,
  //                               width: 120,
  //                               alignment: Alignment.center,
  //                               decoration: BoxDecoration(
  //                                 color: const Color(0xffe0ddd6),
  //                                 borderRadius: BorderRadius.circular(21.0),
  //                               ),
  //                               child: const Texts(
  //                                   title: "متابعة",
  //                                   textColor: Colors.black,
  //                                   fontSize: 20,
  //                                   weight: FontWeight.bold,
  //                                   align: TextAlign.center),
  //                             ),
  //                           ),
  //                           const SizedBox(
  //                             width: 10,
  //                           ),
  //                           GestureDetector(
  //                             onTap: () {
  //                               pop(context);
  //                             },
  //                             child: Container(
  //                               height: 50,
  //                               width: 120,
  //                               alignment: Alignment.center,
  //                               decoration: BoxDecoration(
  //                                 border:
  //                                     Border.all(color: Colors.grey, width: .8),
  //                                 borderRadius: BorderRadius.circular(21.0),
  //                               ),
  //                               child: const Texts(
  //                                   title: "الغاء",
  //                                   textColor: Colors.black,
  //                                   fontSize: 20,
  //                                   weight: FontWeight.bold,
  //                                   align: TextAlign.center),
  //                             ),
  //                           ),
  //                         ],
  //                       ),
  //                     ]));
  //         }),
  //       );
  //     },
  //   );
  // }

