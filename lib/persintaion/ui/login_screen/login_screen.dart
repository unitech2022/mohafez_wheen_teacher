import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mohafez_elwaheen_teacher/bloc/auth_cubit/auth_cubit.dart';
import 'package:mohafez_elwaheen_teacher/core/data/data.dart';
import 'package:mohafez_elwaheen_teacher/core/helpers/helper_functions.dart';
import 'package:mohafez_elwaheen_teacher/persintaion/ui/home_screen/home_screen.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';

import '../../../core/enums.dart';
import '../../../core/styls/colors.dart';
import '../../../core/widgets/custom_drop_down_widget.dart';
import '../../../core/widgets/loading_widget.dart';
import '../../../core/widgets/texts.dart';
import '../create_account/create_account_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _controllerEmail = TextEditingController();
  final _controllerPass = TextEditingController();

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    _controllerEmail.dispose();
    _controllerPass.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        body: BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            return Column(children: [
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
                        child: SizedBox(
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
                            title: "دخول",
                            textColor: Colors.black,
                            fontSize: 35,
                            weight: FontWeight.bold,
                            align: TextAlign.center),
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
                            controller: _controllerEmail,
                            cursorColor: Colors.grey,
                            style: const TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              hintText: "اكتب الايميل",
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
                              hintText: "اكتب الرقم السري",
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
                        sizedHeight(90),
                        // button create account
                        state.loginUserState == RequestState.loading
                            ? const LoadingWidget(
                                height: 50, color: Colors.green)
                            : GestureDetector(
                                onTap: () {
                                  if (validate(context)) {
                                    AuthCubit.get(context).userLogin(
                                        userName: _controllerEmail.text,
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
                                        title: "دخول",
                                        family: "tra",
                                        textColor: Color(0xff0D7F43),
                                        fontSize: 30,
                                        weight: FontWeight.bold,
                                        align: TextAlign.center),
                                  ),
                                ),
                              ),
                        sizedHeight(10),
                        InkWell(
                          onTap: () {
                            pushPage(context, const CreateAccountScreen());
                          },
                          child: const Texts(
                              title: "ليس لدى حساب",
                              textColor: Colors.green,
                              fontSize: 15,
                              weight: FontWeight.bold,
                              align: TextAlign.center),
                        ),
                      ],
                    )),
                  ))
            ]);
          },
        ));
  }

  bool validate(BuildContext context) {
    if (_controllerEmail.text.isEmpty) {
      showTopMessage(
          context: context,
          customBar: const CustomSnackBar.error(
            backgroundColor: Colors.red,
            message: "أدخل البريد الإلكتروني",
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
