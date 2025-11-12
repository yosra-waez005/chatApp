import 'package:chat_app1/main.dart';
import 'package:chat_app1/screens/chat_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../constant.dart';
import '../helper/snakBar/ShowSnakBr.dart';
import '../widgets/TextButton.dart';
import '../widgets/TextFiled.dart';
import 'SingUp_page.dart';

class homePage extends StatefulWidget {
  homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  GlobalKey<FormState> formkey = GlobalKey();

  String? email;

  String? password;

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(// مشان اللودينغ وبدي احطا فوق الشي لهيك غلفتا فوق
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Form(// لانو لاعمل فاليديت للايميل والباسوورد لازم احط فورم واخد الكي تبعا
            key: formkey,
            child: ListView(
              children: [
                SizedBox(
                  height: 40,
                ),
                Image.asset(
                  klogo, height: 100, //fit: BoxFit.fill,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Scholar Chat",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontFamily: "Pacifico"),
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                const Row(
                  children: [
                    Text(
                      "Sign In",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                textField(
                  onchanged: (p0) {
                    email = p0; // مشان اجيب الايميل
                  },
                  Hint: "Enter your Email",
                  LabelText: "Email",
                ),
                SizedBox(
                  height: 7,
                ),
                textField(
                  onchanged: (p0) {
                    password = p0;
                  },
                  Hint: "Enter your Password",
                  LabelText: 'Password',
                  obscure: true,
                ),
                SizedBox(
                  height: 20,
                ),
                textButton(
                  text: "Log In",
                  onTap: () async {
                    if (formkey.currentState!.validate()) {//هون استخدمت الكي تبع الفورم مشان الفاليديت وعبقلو تاكدلي من الفاليديت وبحط الشروط بالتيكست فيلد
                      setState(() {
                        isLoading = true;
                      });
                      try {
                        UserCredential user = await FirebaseAuth
                            .instance //هون بلشت احفظ الايميل بالفاير بيز
                            .createUserWithEmailAndPassword( //و
                            email: email!,
                            password: password!); //بلشت استخدم الاوث
                        ShawSnackBar(context, 'success');
                        Navigator.pushNamed(context, chatpage.id,
                            arguments: email);
                      } on FirebaseAuthException catch (ex) { //مشان الاكسبشن تبع الافايربيز
                        if (ex.code == 'weak-password') {
                          ShawSnackBar(context, 'weak-password');
                        } else if (ex.code == 'email-already-in-use') {
                          ShawSnackBar(context, 'email-already-in-use');
                        };
                      }
                    catch(e){ ShawSnackBar(context, 'there was an error');};//اي اكسبشن غير تبعات الفاير بيز
                    setState(() {
                    isLoading = false;
                    });
                    } else {}
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "don`t have an account ? ",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                    GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, signUp.id);
                        },
                        child: const Text("Sign Up",
                            style: TextStyle(
                                color: Color(0xffC7EDE6), fontSize: 12)))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
