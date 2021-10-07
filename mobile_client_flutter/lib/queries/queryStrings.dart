String getQuestionByOrder(int orderNum) {
  return """{questions(where:{order:$orderNum}){order,text,type}}""";
}

String getAllQuestions() {
  return """query{{questions{order,text,type}}}""";
}
