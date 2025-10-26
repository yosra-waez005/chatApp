import 'package:chat_app1/constant.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // من التت
import '../models/message.dart';
import '../widgets/chatBubble.dart';

class chatpage extends StatelessWidget {
  chatpage({super.key});

  TextEditingController controller = TextEditingController();
  final _controller = ScrollController();
  static String id = "chatpage";

  // من النت
  CollectionReference messages =
      FirebaseFirestore.instance.collection(kmessagesCollection);

  @override
  Widget build(BuildContext context) {
  var em=  ModalRoute.of(context)!.settings.arguments;//مشان استدعي الايميل يلي بعتو مه هديل الصفحه
    return StreamBuilder<QuerySnapshot>(
      stream: messages.orderBy('createAt').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Message> messagelist = [];
          for (int i = 0; i < snapshot.data!.docs.length; i++) {
            messagelist.add(Message.fromJson(snapshot.data!.docs[i]));
          }
          return Scaffold(
            appBar: AppBar(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    klogo,
                    height: 60,
                  ),
                  const Text(
                    'chat',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
              //centerTitle: true,
              backgroundColor: kPrimaryColor,
              automaticallyImplyLeading: false,
            ),
            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    controller: _controller,
                    itemCount: messagelist.length,
                    itemBuilder: (context, index) {
                      return  messagelist[index].id ==em ? chatBubble(
                        message: messagelist[index], )
                      : chatBubbleForFriend(message: messagelist[index]);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(18),
                  child: TextField(
                    controller: controller,
                    onSubmitted: (value) {
                      messages.add({
                        'message': value,
                        'createAt': DateTime.now(),
                        'id': em,
                      });
                      controller.clear();
                      _controller.animateTo(
                          _controller.position.maxScrollExtent,
                          duration: Duration(seconds: 1),
                          curve: Curves.easeIn);
                    },
                    decoration: InputDecoration(
                      hintText: 'Send message',
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: kPrimaryColor,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(16)),
                      suffixIcon: const Icon(
                        Icons.send,
                        color: kPrimaryColor,
                      ),
                      // border: OutlineInputBorder(borderRadius: BorderRadius.circular(16),borderSide: BorderSide(color: kPrimaryColor)),
                      //   enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12),borderSide: BorderSide(color: kPrimaryColor))
                    ),
                  ),
                )
              ],
            ),
          );
        } else {
          return Text('Loading');
        }
      },
    );
  }
}
