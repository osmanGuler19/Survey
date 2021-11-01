String getQuestionByOrder(int orderNum) {
  return """query{questions(where:{order:$orderNum}){order,text,type}}""";
}

String getAllQuestions() {
  return r"""query{questions{order,text,type}}""";
}

String addUser(
    String first_name, String last_name, String email, String password) {
  return """mutation AddUser($first_name:String,$last_name:String,$email:String,$password:String){
          action addUser(input: {})
        }""";
}
