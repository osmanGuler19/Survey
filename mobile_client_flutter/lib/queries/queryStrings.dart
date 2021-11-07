String getQuestionByOrder(int orderNum) {
  return """query{questions(where:{order:$orderNum}){order,text,type}}""";
}

String getAllQuestions() {
  return r"""query{questions{order,text,type}}""";
}

String addUser(
    String first_name, String last_name, String email, String password) {
  return r"""mutation AddUser($first_name:String,$last_name:String,$email:String,$password:String){
          action: addUser(input: {name:$first_name,surname:$last_name,email:$email,passw:$password}){
            id
            first_name
            last_name
            email
            password
          }
        }""";
}


String getUserByEmail(String email,String password) {
  return """query{users(where:{email:$email,password:$password}){id,first_name,last_name,email,password}}""";
}

String addSurvey(String title, String description, String userId,List Questions) {
  return """mutation AddSurvey($title:String,$description:String,$userId:String){
          addSurvey(input: {title:$title,description:$description,userId:$userId,questions:$Questions}){
            id
            title
            description
            userId
            questions
          }
        }""";
}