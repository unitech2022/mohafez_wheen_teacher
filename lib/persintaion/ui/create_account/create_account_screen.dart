import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mohafez_elwaheen_teacher/bloc/auth_cubit/auth_cubit.dart';
import 'package:mohafez_elwaheen_teacher/core/data/data.dart';
import 'package:mohafez_elwaheen_teacher/core/helpers/helper_functions.dart';
import 'package:mohafez_elwaheen_teacher/core/widgets/loading_widget.dart';
import 'package:mohafez_elwaheen_teacher/persintaion/ui/home_screen/home_screen.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import '../../../core/enums.dart';
import '../../../core/styls/colors.dart';
import '../../../core/widgets/back_button.dart';
import '../../../core/widgets/custom_drop_down_widget.dart';
import '../../../core/widgets/texts.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final _controllerEmail = TextEditingController();
  final _controllerFullName = TextEditingController();
  final _controllerPass = TextEditingController();

  @override
  void deactivate() {
    super.deactivate();
    _controllerEmail.dispose();
    _controllerPass.dispose();
    _controllerFullName.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        body: BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            return Column(children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 60),
                child: Row(
                  children: [
                    SizedBox(
                      height: 70,
                      width: 70,
                      child: Image.asset(
                        "assets/images/logo.png",
                        height: 100,
                        width: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                    sizedWidth(20),
                    const Texts(
                        title: "انشاء حساب جديد",
                        family: "tra",
                        textColor: Colors.black,
                        fontSize: 25,
                        weight: FontWeight.bold,
                        align: TextAlign.center),
                    const Spacer(),
                     BackWidget(color: Colors.black,)
                  ],
                ),
              ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: SingleChildScrollView(
                    child: Column(
                  children: [
                 
                    sizedHeight(65),
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
                        controller: _controllerFullName,
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

                    // field email
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
                        controller: _controllerEmail,
                        cursorColor: Colors.grey,
                        style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hintText: "البريد الإلكتروني",
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
                          currentValue: AuthCubit.get(context).currentGender,
                          selectCar: false,
                          textColor: const Color(0xff28436C),
                          isTwoIcons: false,
                          iconColor: const Color(0xff515151),
                          list: genders,
                          onSelect: (value) {
                            AuthCubit.get(context).changeDopDawn(1, value);
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
                          currentValue: AuthCubit.get(context).currentCountry,
                          selectCar: false,
                          textColor: const Color(0xff28436C),
                          isTwoIcons: false,
                          iconColor: const Color(0xff515151),
                          list: countries,
                          onSelect: (value) {
                            AuthCubit.get(context).changeDopDawn(2, value);
                          },
                          hint: "الدولة"),
                    ),
                    sizedHeight(15),
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
                        obscureText: true,
                        controller: _controllerPass,
                        cursorColor: Colors.grey,
                        style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                          hintText: " الرقم السري",
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

                    // select country
                    sizedHeight(50),
                    // button create account
               state.registerUserState==RequestState.loading?
               
               const LoadingWidget(height: 55, color: Colors.green)
               :     GestureDetector(
                      onTap: () {
                        if (validate(context)) {
                          AuthCubit.get(context).register(
                              name: _controllerFullName.text,
                              email: _controllerEmail.text,
                              gander:
                                  AuthCubit.get(context).currentGender!.name,
                              country:
                                  AuthCubit.get(context).currentCountry!.name,
                              pass: _controllerPass.text,
                              context: context);
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
                  ],
                )),
              ))
            ]);
          },
        ));
  }

  bool validate(BuildContext context) {
    if (_controllerFullName.text.isEmpty) {
      showTopMessage(
          context: context,
          customBar: const CustomSnackBar.error(
            backgroundColor: Colors.red,
            message: "أدخل  الاسم كاملا",
            textStyle: TextStyle(
                fontFamily: "font", fontSize: 16, color: Colors.white),
          ));

      return false;
    } else if (_controllerEmail.text.isEmpty) {
      showTopMessage(
          context: context,
          customBar: const CustomSnackBar.error(
            backgroundColor: Colors.red,
            message: "أدخل البريد الإلكتروني",
            textStyle: TextStyle(
                fontFamily: "font", fontSize: 16, color: Colors.white),
          ));

      return false;
    } else if (AuthCubit.get(context).currentGender == null) {
      showTopMessage(
          context: context,
          customBar: const CustomSnackBar.error(
            backgroundColor: Colors.red,
            message: "اختار النوع",
            textStyle: TextStyle(
                fontFamily: "font", fontSize: 16, color: Colors.white),
          ));

      return false;
    } else if (AuthCubit.get(context).currentCountry == null) {
      showTopMessage(
          context: context,
          customBar: const CustomSnackBar.error(
            backgroundColor: Colors.red,
            message: "اختار الدولة",
            textStyle: TextStyle(
                fontFamily: "font", fontSize: 16, color: Colors.white),
          ));

      return false;
    } else if (_controllerPass.text.isEmpty) {
      showTopMessage(
          context: context,
          customBar: const CustomSnackBar.error(
            backgroundColor: Colors.red,
            message: "أدخل الرقم السري ",
            textStyle: TextStyle(
                fontFamily: "font", fontSize: 16, color: Colors.white),
          ));

      return false;
    } else {
      return true;
    }
  }
}
