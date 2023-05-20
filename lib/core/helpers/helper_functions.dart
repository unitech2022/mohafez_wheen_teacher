import 'dart:io';
import 'package:page_transition/page_transition.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import '../app_model.dart';



pushPage(context, page) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => page),
  );
}

pop(context) {
  Navigator.pop(context);
}

pushPageRoutName(context, route) {
  Navigator.pushNamed(
    context,
    route,
  );
}

pushPageRoutNameReplaced(context, route) {
  Navigator.pushReplacementNamed(
    context,
    route,
  );
}

widthScreen(context) => MediaQuery.of(context).size.width;

heightScreen(context) => MediaQuery.of(context).size.height;

SizedBox sizedHeight(double height) => SizedBox(
      height: height,
    );
SizedBox sizedWidth(double width) => SizedBox(
      width: width,
    );
bool isLogin() {
  return token != "";
}
pushPageTransition({context, page, type}) {
  Navigator.push(
      context,
      PageTransition(
          duration: const Duration(milliseconds: 300),
          reverseDuration:
              // ignore: prefer_const_constructors
              Duration(milliseconds: 300),
          // alignment: Alignment.center,
          curve: Curves.ease,
          type: type,
          child: page));
}


showTopMessage({context, customBar}) {
  showTopSnackBar(
    Overlay.of(context),
    customBar,
  );
}

saveToken({tokenAdd}) {
  const storage = FlutterSecureStorage();
  storage.write(key: 'token', value: tokenAdd);
  storage.write(key: 'id', value: currentUser.id);
  storage.write(key: 'phone', value: currentUser.userName);
  storage.write(key: 'country', value: currentUser.country);
  storage.write(key: 'role', value: currentUser.role);
  storage.write(key: 'gender', value: currentUser.gender);
  storage.write(key: 'name', value: currentUser.fullName);
  storage.write(key: 'image', value: currentUser.profileImage.toString());
}

readToken() async {
  // await getBaseUrl();
  const storage = FlutterSecureStorage();
  try {
    token = (await storage.read(key: "token"))!;
    currentUser.id = (await storage.read(key: "id"));
    currentUser.userName = (await storage.read(key: "phone"));
    currentUser.country = (await storage.read(key: "country"));
    currentUser.role = (await storage.read(key: "role"));
    currentUser.fullName = (await storage.read(key: "name"));
    currentUser.gender = (await storage.read(key: "gender"));
   
    currentUser.profileImage = (await storage.read(key: "image"));
    print("token : ${currentUser.id!}");
  } catch (e) {}
}

Future saveData(key, value) async {
  const storage = FlutterSecureStorage();
  storage.write(key: key, value: value);
}

Future<void> showMyDialog({context ,title ,body ,founction}) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title:  Text(title,style: TextStyle(fontSize: 20,color: Colors.black),),
        content: SingleChildScrollView(
          child: ListBody(
            children: [
            
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(body,style: TextStyle(fontSize: 20,color: Colors.black),textAlign: TextAlign.center,),
                ],
              ),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text("الغاء",style: TextStyle(fontSize: 14,color: Colors.black)),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),

           TextButton(
            child: const Text("تغيير",style: TextStyle(fontSize: 16,color: Colors.black)),
            onPressed: founction,
          ),
        ],
      );
    },
  );
}

