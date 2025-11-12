import 'package:chat_app1/constant.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // من التت
import '../models/message.dart';
import '../widgets/chatBubble.dart';

class chatpage extends StatelessWidget {
  chatpage({super.key});

  TextEditingController controller = TextEditingController();
  final _controller = ScrollController();// هي السكرول لانو عبستخدما مع الليست فيو
  static String id = "chatpage";
  FirebaseFirestore firestore=FirebaseFirestore.instance;//اول خطوه بالستور عملنا اوبجيكت
  CollectionReference messages = FirebaseFirestore.instance.collection("Messages");// تاني خطوه عبعمل كولكشن بالفايربيز ستور

  @override
  Widget build(BuildContext context) {
  var em=  ModalRoute.of(context)!.settings.arguments;//مشان استقبل الداتا يلي بعتا من الصفحة يل قبل
    return StreamBuilder<QuerySnapshot>(// الستريم حطيتا بدال الفيوتشر لانو الستريم بس بعتت رساله مباشره بتعرضا بس الفيوتشر لاعمل رن لتطلع وبالفيتوتشر بحط الاوبجيكت دوت غيت هون لا
    //  stream: messages.snapshots(),الستريم هيك بستدعيا
      stream: messages.orderBy('createAt').snapshots(),//الاوردرباي مشان ارتب حسب يلي بدي ياه مثلا الوقت

      builder: (context, snapshot) {//السناب هي الشغله يلي فيا البيانات يلي بتهمني
        if (snapshot.hasData) {// مشان يشوف السناب يلي رجعانه فيا بيانات ولا لا
          List<classMessage> messagelist = [];
          for (int i = 0; i < snapshot.data!.docs.length; i++) {//اللوب بتعدي على كل الدوكيمنت
            messagelist.add(classMessage.fromJson(snapshot.data!.docs[i]));
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
                Expanded(//لانو الليست فيو مابصير تكون جوا كواوم لهيك بجطلا اكسباند
                  child: ListView.builder(
                    controller: _controller,
                    itemCount: messagelist.length,
                    itemBuilder: (context, index) {
                      return  messagelist[index].id ==em ? chatBubble(message: messagelist[index], )
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
                        'message': value,//اسمم سترنغ الماسيج
                        'createAt': DateTime.now(),
                        'id': em,
                      });
                      controller.clear();//مشان افضي مكان الرساله
                      _controller.animateTo(//مشان وقت ابعت رساله يعمل سكرول لتحت فورا
                          _controller.position.maxScrollExtent,// هي يعني لاخر سطر بالليست فيو
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
