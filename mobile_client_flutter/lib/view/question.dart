import 'package:client_flutter/viewmodel/myModelView.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:progress_indicators/progress_indicators.dart';
import '../widgets/question_page/progressBar.dart';
import '../widgets/question_page/questionContainer.dart';
import '../widgets/question_page/answerContainer.dart';
import '../widgets/question_page/nextButton.dart';
import '../widgets/question_page/previousButton.dart';
import '../viewmodel/myModelView.dart';
import 'package:provider/provider.dart';

class QuestionPage extends StatelessWidget {
  //final List qList = new myModelView().questionList;

  const QuestionPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    TextEditingController controller = new TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Question Survey")),
      ),
      backgroundColor: Color.fromRGBO(240, 240, 240, 1),
      body: Center(
          child: Container(
        padding: EdgeInsets.only(top: 30, left: 30, right: 30, bottom: 20),
        color: Colors.white,
        width: MediaQuery.of(context).size.height * 0.8,
        height: MediaQuery.of(context).size.height * 0.6,
        child: Column(
          children: [
            JumpingDotsProgressIndicator(
              fontSize: 20.0,
            ),
            Consumer<myModelView>(
              builder: (_, a, child) {
                return a.state ==
                    QState.BUSY ? CircularProgressIndicator() : ProgressBar();
              },
            ),
            Consumer<myModelView>(builder: (_, a, child) {
              if (a.state == QState.IDLE) print(a.questionList);
              return a.state == QState.BUSY
                  ? SizedBox()
                  : QuestionContainer(qText: a.questionList[a.i].text);
            }),
            Container(
              child: AnswerContainer(
                controller: controller,
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  PreviousButton(),
                  NextButton(),
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}

Center buildErrorWidget() => Center(child: Text('Something went wrong!'));

Center buildLoadingWidget() => Center(child: CircularProgressIndicator());
