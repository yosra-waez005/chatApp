
import 'package:chat_app1/screens/chat_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';
import 'screens/Home_page.dart';
import 'screens/SingUp_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(chatApp());
}
class chatApp extends StatelessWidget {
  const chatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        'homePage' :(context)=> homePage(),
        chatpage.id :(context)=> chatpage(),
        signUp.id: (context)=> signUp(),
      },
      debugShowCheckedModeBanner: false,
      initialRoute: 'homePage',

    );
  }
}