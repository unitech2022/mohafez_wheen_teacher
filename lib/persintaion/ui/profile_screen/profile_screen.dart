import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../../core/data/data.dart';
import '../../../core/helpers/helper_functions.dart';
import '../../../core/styls/colors.dart';
import '../../../core/widgets/custom_drop_down_widget.dart';
import '../../../core/widgets/texts.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
                      padding: EdgeInsets.only(top: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.white,
                      ),
                      child: Image.asset(
                        "assets/images/person.png",
                        height: 100,
                        width: 100,
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
                        title: "اضف الصورة",
                        family: "tra",
                        textColor: Colors.black,
                        fontSize: 35,
                        weight: FontWeight.bold,
                        align: TextAlign.center),
                    sizedHeight(15),

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
                    sizedHeight(80),

                    // button create account
                    GestureDetector(
                      onTap: () {
                        pop(context);
                        // pushPage(context, const HomeScreen());
                      },
                      child: Container(
                        height: 50,
                        alignment: Alignment.center,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: const Color(0x330d7f43),
                          borderRadius: BorderRadius.circular(21.0),
                        ),
                        child: const Text(
                          'رجوع',
                          
                          style: TextStyle(
                            fontFamily: 'Traditional Arabic',
                            fontSize: 25,
                            color: Color(0xff0d7f43),
                            fontWeight: FontWeight.w700,
                            height: 1.6
                          ),
                          
                          textAlign: TextAlign.center,
                          
                          softWrap: false,
                          
                        ),
                      ),
                    ),
                     
                       const Text(
                      'جميع الحقوق محفوظة لموقع محفظ الوحيين © 2022',
                      style: TextStyle(
                        fontFamily: 'Traditional Arabic',
                        fontSize: 14,
                        color: Color(0xff808080),
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.center,
                      softWrap: false,
                    )
                
                  ],
                )),
              ))
        ]));
  }
}
