import 'package:client_flutter/viewmodel/surveyViewModel.dart';
import 'package:flutter/material.dart';
import '../viewmodel/userViewModel.dart';
import 'package:provider/provider.dart';
import '../model/myModel.dart';
import '../widgets/question_page/questionContainer.dart';
import '../widgets/question_page/answerContainer.dart';
import 'package:flutter/services.dart';

class UserSurveyDetailPage extends StatelessWidget {
  final Survey survey;
  UserSurveyDetailPage({Key? key, required this.survey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('User Survey Detail'),
        ),
        body: Container());
  }
}

//Burada controller'ları bir listede tutup gönderebilirim. Ayrıca Survey quesitonları önceden çekerek bu sayfaya parametre olarak gönderebilirim.

Widget QuestionAndAnswerContainer(BuildContext context, String questionText,
    String answerText, TextEditingController controller) {
  return Container(
    padding: EdgeInsets.only(top: 30, left: 30, right: 30, bottom: 20),
    color: Colors.white,
    width: getWidth(context, MediaQuery.of(context).orientation),
    child: Column(
      children: <Widget>[
        QuestionContainer(qText: questionText),
        SizedBox(
          height: 10,
        ),
        MyAnswerContainer(answerText, controller),
      ],
    ),
  );
}

Widget MyAnswerContainer(String answerText, TextEditingController controller) {
  return TextField(
    maxLengthEnforcement: MaxLengthEnforcement.enforced,
    keyboardType: TextInputType.multiline,
    maxLines: 6,
    controller: controller,
    style: TextStyle(fontSize: 18.0),
    decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: BorderSide(
              color: Colors.grey.shade600,
              style: BorderStyle.solid,
            ))),
  );
}

double getWidth(BuildContext context, Orientation or) {
  if (or == Orientation.portrait) {
    return MediaQuery.of(context).size.width;
  } else {
    return MediaQuery.of(context).size.width / 2;
  }
}
