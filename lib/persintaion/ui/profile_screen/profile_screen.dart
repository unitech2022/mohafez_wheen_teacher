import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mohafez_elwaheen_teacher/bloc/auth_cubit/auth_cubit.dart';
import 'package:mohafez_elwaheen_teacher/core/api_constatns.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';

import '../../../core/data/data.dart';
import '../../../core/enums.dart';
import '../../../core/helpers/helper_functions.dart';
import '../../../core/styls/colors.dart';
import '../../../core/widgets/back_button.dart';
import '../../../core/widgets/custom_drop_down_widget.dart';
import '../../../core/widgets/loading_widget.dart';
import '../../../core/widgets/texts.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    AuthCubit.get(context).getUser();
  }

  final _controllerName = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controllerName.dispose();
  }

  CountryModel? currentValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        body: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state.getUserState == RequestState.loaded) {
              _controllerName.text = state.userResponse!.fullName!;
              
              // Future.delayed(Duration.zero, () {
              //      CountryModel country = countries.firstWhere(
              //     (element) => element.name == state.userResponse!.country);

              // CountryModel grnder = genders.firstWhere((element) =>
              //     element.name ==
              //     (state.userResponse!.gender! == "ذكر"
              //         ? genders[0]
              //         : genders[1]));

              // AuthCubit.get(context).changeDopDawn(2, country);
              // AuthCubit.get(context).changeDopDawn(1, grnder);
              // });
            }
          },
          builder: (context, state) {
            return state.getUserState == RequestState.loading
                ? const Center(
                    child: LoadingWidget(height: 50, color: Colors.green),
                  )
                : Column(children: [
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
                              child: GestureDetector(
                                onTap: () {
                                  AuthCubit.get(context).uploadImage();
                                },
                                child: Container(
                                  height: 100,
                                  width: 100,
                                  padding: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Colors.white,
                                  ),
                                  child: state.imageStet == RequestState.loading
                                      ? const LoadingWidget(
                                          height: 120, color: Colors.white)
                                      : ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(70),
                                          child: CachedNetworkImage(
                                            fit: BoxFit.cover,
                                            height: 100,
                                            width: 100,
                                            imageUrl: ApiConstants.imageUrl(
                                              state.image ?? state.userResponse!
                                                          .profileImage ??
                                                      "",
                                            ),
                                            placeholder: (context, url) =>
                                                const CircularProgressIndicator(),
                                            errorWidget:
                                                (context, url, error) =>
                                                    Image.asset(
                                              "assets/images/person.png",
                                              height: 100,
                                              width: 100,
                                            ),
                                          ),
                                        ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.topCenter,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 40),
                                    child: BackWidget(
                                      color: Colors.white,
                                    ),
                                  )
                                ],
                              ),
                            ),
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
                                  controller: _controllerName,
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
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
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
                                    currentValue:
                                        AuthCubit.get(context).currentGender,
                                    selectCar: false,
                                    textColor: const Color(0xff28436C),
                                    isTwoIcons: false,
                                    iconColor: const Color(0xff515151),
                                    list: genders,
                                    onSelect: (value) {
                                      AuthCubit.get(context)
                                          .changeDopDawn(1, value);
                                    },
                                    hint: state.userResponse!.gender!),
                              ),
                              sizedHeight(15),
                              // select country

                              Container(
                                height: 60,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
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
                                    currentValue:
                                        AuthCubit.get(context).currentCountry,
                                    selectCar: false,
                                    textColor: const Color(0xff28436C),
                                    isTwoIcons: false,
                                    iconColor: const Color(0xff515151),
                                    list: countries,
                                    onSelect: (value) {
                                      AuthCubit.get(context)
                                          .changeDopDawn(2, value);
                                    },
                                    hint: state.userResponse!.country!),
                              ),
                              sizedHeight(80),

                              // button create account
                              GestureDetector(
                                onTap: () {
                                  if (_controllerName.text.isNotEmpty) {
                                    AuthCubit.get(context).updateProfile(
                                        image: state.image??state.userResponse!.profileImage??"",
                                        gender: AuthCubit.get(context)
                                                    .currentGender !=
                                                null
                                            ? AuthCubit.get(context)
                                                .currentGender!
                                                .name
                                            : state.userResponse!.gender!,
                                        country:
                                            AuthCubit.get(context)
                                                        .currentCountry !=
                                                    null
                                                ? AuthCubit.get(context)
                                                    .currentCountry!
                                                    .name
                                                : state.userResponse!.country!,
                                        context: context,
                                        fullName: _controllerName.text);
                                  } else {
                                    showTopMessage(
                                        context: context,
                                        customBar: const CustomSnackBar.error(
                                            backgroundColor: Colors.red,
                                            message: "أدخل الاسم ",
                                            textStyle: TextStyle(
                                                fontFamily: "font",
                                                fontSize: 16,
                                                color: Colors.white)));
                                  }
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
                                    'حفظ',
                                    style: TextStyle(
                                        fontFamily: 'Traditional Arabic',
                                        fontSize: 25,
                                        color: Color(0xff0d7f43),
                                        fontWeight: FontWeight.w700,
                                        height: 1.6),
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
                  ]);
          },
        ));
  }
}
