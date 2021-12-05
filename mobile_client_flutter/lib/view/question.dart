import 'package:client_flutter/viewmodel/questionViewModel.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:progress_indicators/progress_indicators.dart';
import '../widgets/question_page/progressBar.dart';
import '../widgets/question_page/questionContainer.dart';
import '../widgets/question_page/answerContainer.dart';
import '../widgets/question_page/nextButton.dart';
import '../widgets/question_page/previousButton.dart';
import '../viewmodel/questionViewModel.dart';
import 'package:provider/provider.dart';
import '../viewmodel/userViewModel.dart';
import '../viewmodel/answerViewModel.dart';

class QuestionPage extends StatelessWidget {
  const QuestionPage({Key? key}) : super(key: key);

  Widget getWidgetsByCondition(QuestionViewModel a) {
    if (a.q_state == QState.BUSY) {
      return Column(
        children: [SizedBox(), CircularProgressIndicator(), SizedBox()],
      );
    } else if (a.q_state == QState.IDLE) {
      return Column(
        children: [
          ProgressBar(),
          SizedBox(
            height: 10,
          ),
          QuestionContainer(qText: a.questionList[a.i].text),
        ],
      );
    }
    return Text(
        "Looks like our database has some errors! Don't worry we will fix it right away.");
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = new TextEditingController();
    final vm = Provider.of<UserViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Question Survey")),
        actions: <Widget>[
          Row(
            children: [
              Text(vm.user.name + "  " + vm.user.surname + "  "),
              Icon(Icons.self_improvement_outlined)
            ],
          )
        ],
      ),
      backgroundColor: Color.fromRGBO(240, 240, 240, 1),
      body: Center(
          child: Container(
        padding: EdgeInsets.only(top: 30, left: 30, right: 30, bottom: 20),
        color: Colors.white,
        width: getWidth(context, MediaQuery.of(context).orientation),
        //height: MediaQuery.of(context).size.height * 0.5,
        child: Column(
          children: [
            JumpingDotsProgressIndicator(
              fontSize: 20.0,
            ),
            Consumer<QuestionViewModel>(builder: (_, a, child) {
              return getWidgetsByCondition(a);
            }),
            /*
            Consumer<AnswerViewModel>(builder: (_, a, child) {
              return AnswerContainer(
                controller: controller,
              );
            }),
            */
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
                  PreviousButton(
                    controller: controller,
                  ),
                  NextButton(
                    controller: controller,
                  ),
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}

double getWidth(BuildContext context, Orientation or) {
  if (or == Orientation.portrait) {
    return MediaQuery.of(context).size.width;
  } else {
    return MediaQuery.of(context).size.width / 2;
  }
}

Center buildErrorWidget() => Center(child: Text('Something went wrong!'));

Center buildLoadingWidget() => Center(child: CircularProgressIndicator());
