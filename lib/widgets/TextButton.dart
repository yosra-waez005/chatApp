import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constant.dart';

class textButton extends StatelessWidget {
  textButton({super.key,required this.text,required this.onTap});
  String text;
 VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child:
      TextButton(style: TextButton.styleFrom(
          backgroundColor: Colors.white, minimumSize: Size(250, 50)),
          onPressed: onTap,
          child: Text(text, style: TextStyle(color: kPrimaryColor),)),
    );
  }
}
