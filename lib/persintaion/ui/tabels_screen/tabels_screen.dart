import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:mohafez_elwaheen_teacher/core/helpers/helper_functions.dart';

import '../../../core/data/data.dart';
import '../../../core/styls/colors.dart';
import '../../../core/widgets/custom_drop_down_widget.dart';
import '../../../core/widgets/texts.dart';

class TablesScreen extends StatefulWidget {
  const TablesScreen({super.key});

  @override
  State<TablesScreen> createState() => _TablesScreenState();
}

class _TablesScreenState extends State<TablesScreen> {
  CountryModel? currentValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
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
                  const Align(
                    alignment: Alignment.center,
                    child: Texts(
                        title: "الجـــــــدول",
                        family: "tra",
                        textColor: Colors.white,
                        fontSize: 35,
                        weight: FontWeight.bold,
                        align: TextAlign.center),
                  )
                ],
              )),
          Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    // select time lessons
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 60,
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            decoration: BoxDecoration(
                              color:  Color(0xffF6F6EE),
                              borderRadius: BorderRadius.circular(10.0),
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
                                hint: "اليوم"),
                          ),
                        ),
                        sizedWidth(10),
                        Expanded(
                          child: Container(
                            height: 60,
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            decoration: BoxDecoration(
                              color:  Color(0xffF6F6EE),
                              borderRadius: BorderRadius.circular(10.0),
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
                                hint: "التاريخ"),
                          ),
                        ),
                      ],
                    )

                    // list times

                    ,
                    Expanded(
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: 8,
                          itemBuilder: (ctx, index) {
                            return Container(
                              height: 100,
                              alignment: Alignment.center,
                              decoration: const BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: Colors.grey, width: .5))),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      padding: EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        color: const Color(0xffF6F6EE),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      child: const Text(
                                        '5:45 م',
                                        style: TextStyle(
                                          fontFamily: 'tra',
                                          fontSize: 18,
                                          color: Color(0xff000000),
                                          fontWeight: FontWeight.w700,
                                        ),
                                        textAlign: TextAlign.center,
                                        softWrap: false,
                                      ),
                                    ),
                                  ),
                                  sizedWidth(10),
                                  Expanded(
                                    flex: 2,
                                    child: Container(
                                         padding: const EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        color: const Color(0xffF6F6EE),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      child: const Text(
                                        "https://us02web.zoom.us/j/4654014568?"
                                        ,maxLines: 2,
                                        style: TextStyle(
                                          fontFamily: 'tra',
                                          fontSize: 18,
                                          color: Color(0xff000000),
                                          fontWeight: FontWeight.w700,
                                        ),
                                        textAlign: TextAlign.center,
                                       
                                      ),
                                    ),
                                  ),
                                  sizedWidth(10),
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                         padding: EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        color: const Color(0xffF6F6EE),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      child:Transform.scale(
                  scaleX: .65,
                      scaleY: .55,  
                  child: CupertinoSwitch(
                   
                    activeColor: Color(0xff22A45D) ,
                    thumbColor: Colors.white,
                    trackColor:Color.fromARGB(255, 148, 150, 149) ,
                    onChanged: (value) {
                    
                  },value: true,),
                ),
                                    ),
                                  )
                                ],
                              ),
                            );
                          }),
                    )
                
                  // button create account
                    ,GestureDetector(
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
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: const Text(
                          'رجوع',
                          
                          style: TextStyle(
                            fontFamily: 'tra',
                            fontSize: 35,
                            color: Color(0xff0d7f43),
                            fontWeight: FontWeight.w700,
                            height: 1.0
                          ),
                          
                          textAlign: TextAlign.center,
                          
                          softWrap: false,
                          
                        ),
                      ),
                    ),
                     
                  ],
                ),
              ))
        ]));
  }
}
