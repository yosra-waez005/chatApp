import 'package:chat_app1/constant.dart';

class classMessage {
  final String consMessag;
final String id;// مشان اجيب الايميل من الفاير بيز
  classMessage(this.consMessag, this.id);
  factory classMessage.fromJson(jsonData){
    return classMessage(jsonData[kmessage],jsonData['id']);
  }
}