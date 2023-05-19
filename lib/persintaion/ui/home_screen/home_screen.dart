import 'package:flutter/material.dart';

import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mohafez_elwaheen_teacher/core/helpers/helper_functions.dart';
import 'package:mohafez_elwaheen_teacher/persintaion/ui/profile_screen/profile_screen.dart';
import 'package:mohafez_elwaheen_teacher/persintaion/ui/tabels_screen/tabels_screen.dart';

import '../../../core/styls/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  children: [
                    sizedHeight(30),
                    // PROFILE
                    GestureDetector(
                      onTap: () {
                        pushPage(context, ProfileScreen());
                      },
                      child: Container(
                        height: 100,
                        padding: EdgeInsets.all(20),
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
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/images/user.png",
                              width: 70,
                              height: 70,
                            ),
                            sizedWidth(20),
                            const Text(
                              'الملف الشخصي',
                              style: TextStyle(
                                fontSize: 35,
                                color: Color(0xff000000),
                                fontWeight: FontWeight.w700,
                              ),
                              textAlign: TextAlign.right,
                              softWrap: false,
                            )
                          ],
                        ),
                      ),
                    )

// TABELS
                    ,
                    sizedHeight(20),
                    GestureDetector(
                      onTap: () {
                        pushPage(context, TablesScreen());
                      },
                      child: Container(
                        height: 100,
                        padding: EdgeInsets.all(20),
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
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/images/tabel.png",
                              width: 70,
                              height: 70,
                            ),
                            sizedWidth(20),
                            const Text(
                              'الجدول',
                              style: TextStyle(
                                fontSize: 35,
                                color: Color(0xff000000),
                                fontWeight: FontWeight.w700,
                              ),
                              textAlign: TextAlign.right,
                              softWrap: false,
                            )
                          ],
                        ),
                      ),
                    ),
                    Spacer(),
                    Text(
                      'جميع الحقوق محفوظة لموقع محفظ الوحيين © 2022',
                      style: TextStyle(
                        fontFamily: 'Traditional Arabic',
                        fontSize: 14,
                        color: const Color(0xff808080),
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.center,
                      softWrap: false,
                    )
                  ],
                ),
              ))
        ]));
  }
}
