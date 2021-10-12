String getQuestionByOrder(int orderNum) {
  return """query{questions(where:{order:$orderNum}){order,text,type}}""";
}

String getAllQuestions() {
  return r"""query{questions{order,text,type}}""";
}
