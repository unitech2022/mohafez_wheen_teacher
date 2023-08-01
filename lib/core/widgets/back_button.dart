import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mohafez_elwaheen_teacher/core/helpers/helper_functions.dart';

class BackWidget extends StatelessWidget {
  final Color color;
   BackWidget({
    super.key,
    required this.color
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          pop(context);
        },
        icon:  Icon(Icons.arrow_forward,color:color ,));
  }
}
