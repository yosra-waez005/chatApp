import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class textField extends StatelessWidget {
   textField({super.key, required this.Hint, required this.onchanged, this.obscure=false});
 bool? obscure;
  String? Hint;
Function(String) onchanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscure!,
      validator: (value) {
        if(value!.isEmpty)
          return "Falid in required";
      },
      onChanged: onchanged,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 2)),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 2)),
        border: OutlineInputBorder(),
        // label: Text("Email",style: TextStyle(color: Colors.white),),
        hintText: Hint,
        hintStyle: TextStyle(color: Colors.white),
      ),
    );
  }
}
