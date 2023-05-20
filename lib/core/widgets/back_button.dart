import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BackWidget extends StatelessWidget {
  const BackWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_forward));
  }
}
