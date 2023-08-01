import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:mohafez_elwaheen_teacher/bloc/auth_cubit/auth_cubit.dart';
import 'package:mohafez_elwaheen_teacher/bloc/table_cubit/table_cubit.dart';
import 'package:mohafez_elwaheen_teacher/persintaion/ui/create_account/create_account_screen.dart';
import 'package:mohafez_elwaheen_teacher/persintaion/ui/login_screen/login_screen.dart';
import 'package:mohafez_elwaheen_teacher/persintaion/ui/splash_screen/splash_screen.dart';

import 'core/helpers/helper_functions.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

 await readToken();
  // FirebaseMessaging.onBackgroundMessage(_messageHandler);
  // FirebaseMessaging.onMessageOpenedApp;
  //  await getLocation();
  runApp(
    EasyLocalization(
        supportedLocales: const [Locale("ar"), Locale("en")],
        path: "assets/translations",
        // <-- change the path of the translation files
        fallbackLocale: const Locale("ar"),
        startLocale: const Locale("ar"),
        child: Phoenix(child: const MyApp())),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.white));

    return MultiBlocProvider(
      providers: [
     
        BlocProvider<AuthCubit>(
          create: (context) => AuthCubit(),
        ),
         BlocProvider<TableCubit>(
          create: (context) => TableCubit(),
        ),
      ],
     
      child: MaterialApp(
        title: 'Flutter Demo',
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: "tra",
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home:const SplashScreen(),
      ),
    );
  }
}
