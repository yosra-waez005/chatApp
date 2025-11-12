import 'package:flutter/material.dart';

import '../constant.dart';
import '../models/message.dart';

class chatBubble extends StatelessWidget {

   chatBubble({
    required this.message,
    super.key,
  });
  classMessage message;
  @override
  Widget build(BuildContext context) {
    return Align(alignment: Alignment.centerLeft,//لانو الليست فيو خلت الرساله تاخد العرض كلو بس هيك بتاخد عرض الرساله
      child: Container(
//شلت الطول والعلرض مشان هوه يحدد حسب الرساله
        padding: EdgeInsets.only(left: 16,top: 16,bottom: 16,right: 16),
       margin: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
        decoration: const BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
                bottomRight: Radius.circular(20))),

        child: Text(
          message.consMessag,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
class chatBubbleForFriend extends StatelessWidget {
   chatBubbleForFriend({super.key, required this.message});
classMessage message;
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
          message.consMessag,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
