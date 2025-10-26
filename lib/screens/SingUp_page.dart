

import 'package:chat_app1/screens/chat_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../constant.dart';
import '../helper/snakBar/ShowSnakBr.dart';
import '../widgets/TextButton.dart';
import '../widgets/TextFiled.dart';


class signUp extends StatefulWidget {
  signUp({super.key});

  static String id='signUp';

  @override
  State<signUp> createState() => _signUpState();
}

class _signUpState extends State<signUp> {
String? email,password;

  bool isLoading = false;

  GlobalKey<FormState>formkey=GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child:
          Form(
            key: formkey,
            child: ListView(
              children: [
                SizedBox(height: 40,),
                Image.asset(
                 klogo, height: 100,
                  //fit: BoxFit.fill,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center ,
                  children: [
                    const Text(
                      "Scholar Chat",
                      style: TextStyle(
                          color: Colors.white, fontSize: 32, fontFamily: "Pacifico"),
                    ),
                  ],
                ),
                SizedBox(height: 40,),
                const Row(
                  children: [
                    Text(
                      "Register",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                textField(onchanged: (p0) {
email=p0;
                },
                  Hint: "Enter your Email",),
                SizedBox(height: 7,),
                textField(onchanged: (p0) {
password=p0;
                },
                  Hint: "Enter your Password",
                  obscure: true,
              ),

                SizedBox(height: 20,),
                textButton(text: "Register ", onTap: () async {
                  if (formkey.currentState!.validate()) {
                    setState(() {
                      isLoading = true;
                    });
                    try {
                      UserCredential user = await FirebaseAuth.instance
                          .signInWithEmailAndPassword(
                          email: email!, password: password!);
                    Navigator.pushNamed(context, chatpage.id,arguments: email);
                    } on FirebaseAuthException catch (ex) {
                      if (ex.code == 'user-not-found') {
                        ShawSnackBar(context, 'user-not-found');
                      } else if (ex.code == 'wrong-password') {
                        ShawSnackBar(context, 'wrong-password');
                      };
                    };
                    setState(() {
                      isLoading = false;
                    });
                  } else {}
                },
  ),
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("already have an accun! ", style: TextStyle(color: Colors.white,fontSize: 12),),
                    GestureDetector(onTap: () {
                      // Navigator.pushNamed(context, "homePage");//اسم الصفحه ك سترنغ
                      Navigator.pop(context);
                    },
                        child: Text("Login", style: TextStyle(color: Color(0xffC7EDE6),fontSize: 12))),],),
                SizedBox(height: 50,),
              ],
            ),
          ),
        ),
      ),
    );
  }

}
