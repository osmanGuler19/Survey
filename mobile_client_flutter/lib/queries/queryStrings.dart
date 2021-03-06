String getQuestionByOrder(int orderNum) {
  return """query{questions(where:{order:$orderNum}){order,text,type}}""";
}

String getAllQuestions() {
  return r"""query{questions{order,text,type, scope{label, id}, component{label, id}}}""";
}

String addUser(
    String first_name, String last_name, String email, String password) {
  return '''mutation{
              createUsers(
                input: {
                name: "$first_name"
                surname: "$last_name"
                email: "$email"
                passw: "$password"
                }
              )
              {
                users{name,surname,email,passw}
              }

            }''';
}

String getUserByEmail(String email, String password) {
  return """query{users(where:{email:"$email",passw:"$password"}){name,surname,email,passw}}""";
}

String addSurvey(String id, String title, String description, String createdAt,
    String updatedAt, String userEmail) {
  return """mutation{
              createSurveys(
                input: {
                  survey_id : "$id"
                  title: "$title"
                  description : "$description"
                  created_at : "$createdAt"
                  updated_at : "$updatedAt"
                  user: {connect: {where:{email:"$userEmail"}}}
                  
                }
              )
                {
                  surveys{id,title,description,created_at,updated_at,user{email,name,surname,passw}}
                }
            }""";
}

String addSurveyWithoutAnswers(String id, String title, String description,
    String createdAt, String userEmail) {
  return """mutation{
              createSurveys(
                input: {
                  survey_id : "$id"
                  title: "$title"
                  description : "$description"
                  created_at : "$createdAt"
                  user: {connect: {where:{email:"$userEmail"}}}
                  
                }
              )
                {
                  surveys{survey_id,title,description,created_at,updated_at,user{email,name,surname,passw}}
                }
            }""";
}

String addAnswer(
    int order, String response, String surveyId, String questionText) {
  return """mutation{
	            createAnswers(
                input: {
                  order: $order
                  response:"$response"
                  survey : {connect:{where:{survey_id:"$surveyId"}}}
                  responseTo : {connect:{where:{text:"$questionText"}}}
                }
              )
                {
                  answers{order,response,survey{survey_id,title,description}}
                }
            }""";
}

String updateSurveyTime(String survey_id, DateTime updatedAt) {
  return """mutation{
              updateSurveys(
                where:{survey_id:"$survey_id"}
                update:{
                  updated_at:"$updatedAt"
                }
              )
                {
                  surveys{survey_id,title,description,created_at,updated_at,user{email,name,surname,passw}}
                }
            }""";
}

String updateSurvey(String survey_id, DateTime updatedAt, List answers) {
  return """mutation{
              updateSurveys(
                where:{survey_id:"$survey_id"}
                update:{
                  updated_at:"$updatedAt"
                  answers:{update:[${answers.map((answer) => '{where:{order:${answer.order}}}').toList()}]}
                }
              )
                {
                  surveys{survey_id,title,description,created_at,updated_at,user{email,name,surname,passw}}
                }
            }""";
}

String getUsersSurveys(String userEmail) {
  return """query{
              surveys(where:{user:{email:"$userEmail"}}){survey_id,title,description,created_at,updated_at,user{email,name,surname,passw}}
            }""";
}

//Gets one spesific Survey's questions. Because survey questions might change in the future.
String getSurveyQuestions(String survey_id) {
  return """query{
              answers(where:{survey:{survey_id:"$survey_id"}}){responseTo{order text type}}
            }""";
}

String getSurveyAnswers(String survey_id) {
  return """query{
              answers(where:{survey:{survey_id:"$survey_id"}}){order response survey{survey_id title description created_at updated_at user{name surname email passw}}}
            }""";
}

String getScopes() {
  return """query{
              scopes{id label}
            }""";
}

String getComponents() {
  return """query{
              components{id label}
            }""";
}
