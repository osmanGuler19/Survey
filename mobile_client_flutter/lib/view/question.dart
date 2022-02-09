import 'package:client_flutter/model/myModel.dart';
import 'package:client_flutter/viewmodel/componentScopeViewModel.dart';
import 'package:client_flutter/viewmodel/questionViewModel.dart';
import 'package:client_flutter/widgets/question_page/questionAnswerContainer.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:progress_indicators/progress_indicators.dart';
import '../widgets/question_page/progressBar.dart';
import '../widgets/question_page/questionContainer.dart';
import '../widgets/question_page/answerContainer.dart';
import '../widgets/question_page/nextButton.dart';
import '../widgets/question_page/previousButton.dart';
import '../widgets/question_page/matrix.dart';
import '../viewmodel/questionViewModel.dart';
import 'package:provider/provider.dart';
import '../viewmodel/userViewModel.dart';
import '../viewmodel/answerViewModel.dart';

class QuestionPage extends StatelessWidget {
  const QuestionPage({Key? key}) : super(key: key);

  Widget getWidgetsByCondition(BuildContext context, QuestionViewModel a) {
    if (a.q_state == QState.BUSY) {
      return Column(
        children: [SizedBox(), CircularProgressIndicator(), SizedBox()],
      );
    } else if (a.q_state == QState.IDLE) {
      final csm = Provider.of<ComponentAndScopeViewModel>(context);
      return SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            ProgressBar(),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.builder(
                  //shrinkWrap: true,
                  //physics: NeverScrollableScrollPhysics(),
                  itemCount: a.questionMap[csm.getCurrentQuestionKey()]!.length,
                  itemBuilder: (BuildContext context, int index) {
                    print(a.questionMap[csm.getCurrentQuestionKey()]![index]);
                    return QuestionAnswerContainer(
                        question:
                            a.questionMap[csm.getCurrentQuestionKey()]![index],
                        controller: a.textEditingControllerMap[
                            csm.getCurrentQuestionKey()]![index]);
                  }),
            ),
            //QuestionContainer(qText: a.questionList[a.i].text),
          ],
        ),
      );
    }
    return Text(
        "Looks like our database has some errors! Don't worry we will fix it right away.");
  }

  @override
  Widget build(BuildContext context) {
    //Just dummyyyyy
    List<Component> comps = new List<Component>.empty();
    List<Scope> scopes = new List<Scope>.empty();
    TextEditingController controller = new TextEditingController();
    final vm = Provider.of<UserViewModel>(context);
    final csm = Provider.of<ComponentAndScopeViewModel>(context);
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
        child: SingleChildScrollView(
          physics: ScrollPhysics(),
          padding: EdgeInsets.only(bottom: 15),
          child: Column(
            //mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                height: 30,
                child: JumpingDotsProgressIndicator(
                  fontSize: 20.0,
                ),
              ),
              Consumer<QuestionViewModel>(builder: (_, a, child) {
                return getWidgetsByCondition(context, a);
              }),
              /*
              Consumer<AnswerViewModel>(builder: (_, a, child) {
                return AnswerContainer(
                  controller: controller,
                );
              }),
              */
              /*
              Container(
                child: AnswerContainer(
                  controller: controller,
                ),
              ),
              */
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
              ),
              MatrixWidget(
                  components: csm.componentList, scopes: csm.scopeList),
            ],
          ),
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
