import 'package:flutter/material.dart';

import '../constant.dart';
import '../models/message.dart';

class chatBubble extends StatelessWidget {

   chatBubble({
    required this.message,
    super.key,
  });
  Message message;
  @override
  Widget build(BuildContext context) {
    return Align(alignment: Alignment.centerLeft,
      child: Container(

        padding: EdgeInsets.only(left: 16,top: 16,bottom: 16,right: 16),
       margin: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
        decoration: const BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
                bottomRight: Radius.circular(20))),

        child: Text(
          message.message,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
class chatBubbleForFriend extends StatelessWidget {
   chatBubbleForFriend({super.key, required this.message});
Message message;
  @override
  Widget build(BuildContext context) {
    return Align(alignment: Alignment.centerRight,
      child: Container(

        padding: EdgeInsets.only(left: 16,top: 16,bottom: 16,right: 16),
        margin: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
        decoration: const BoxDecoration(
            color: Color(0xff006D84),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
                bottomLeft: Radius.circular(20))),

        child: Text(
          message.message,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
