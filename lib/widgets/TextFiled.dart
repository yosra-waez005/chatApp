import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class textField extends StatelessWidget {
   textField({super.key, required this.Hint,required this.LabelText, required this.onchanged, this.obscure=false});
 bool? obscure;
  String? Hint;
   String? LabelText;
Function(String) onchanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Colors.white,//لون المؤشر
      cursorWidth: 2,//عرض المؤشر
      obscureText: obscure!,//نص محمي
      validator: (value) {//هون شرط الفاليديت يلي عم اتاكد منو بلاف تبع البوتون
        if(value!.isEmpty)
          return "Falid in required";
      },
      keyboardType: (LabelText=="Email")? TextInputType.emailAddress:TextInputType.text,//نوع الكيبورد
      onChanged: onchanged,//  مشان اخد المتغيرات
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 2)),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 2)),
        border: OutlineInputBorder(),
        hintText: Hint,
        label: Text( LabelText! ,style: TextStyle(color: Colors.white),),
        hintStyle: TextStyle(color: Colors.white),
      ),
    );
  }
}
