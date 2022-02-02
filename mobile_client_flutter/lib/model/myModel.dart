import 'package:json_annotation/json_annotation.dart';
part 'myModel.g.dart';

@JsonSerializable()
class User {
  String name;
  String surname;
  String email;
  String passw;

  User(
      {required this.name,
      required this.surname,
      required this.email,
      required this.passw});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}

@JsonSerializable()
class Survey {
  String survey_id;
  String title;
  String description;
  List<Answer>? answers;
  DateTime created_at;
  DateTime? updated_at;
  User user;

  Survey(
      {required this.survey_id,
      required this.title,
      required this.description,
      this.answers,
      required this.created_at,
      this.updated_at,
      required this.user});
  factory Survey.fromJson(Map<String, dynamic> json) => _$SurveyFromJson(json);

  Map<String, dynamic> toJson() => _$SurveyToJson(this);
}

@JsonSerializable()
class Answer {
  int order;
  String response;
  Survey survey;

  Answer({required this.order, required this.response, required this.survey});

  factory Answer.fromJson(Map<String, dynamic> json) => _$AnswerFromJson(json);

  Map<String, dynamic> toJson() => _$AnswerToJson(this);
}

@JsonSerializable()
class Question {
  int order;
  String text;
  String type;
  Component component;
  Scope scope;

  Question(
      {required this.order,
      required this.text,
      required this.type,
      required this.component,
      required this.scope});

  factory Question.fromJson(Map<String, dynamic> json) =>
      _$QuestionFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionToJson(this);
}

@JsonSerializable()
class Component {
  String label;
  String id;
  Component({required this.id, required this.label});
  factory Component.fromJson(Map<String, dynamic> json) =>
      _$ComponentFromJson(json);
  Map<String, dynamic> toJson() => _$ComponentToJson(this);
}

@JsonSerializable()
class Scope {
  String label;
  String id;
  Scope({required this.id, required this.label});

  factory Scope.fromJson(Map<String, dynamic> json) => _$ScopeFromJson(json);
  Map<String, dynamic> toJson() => _$ScopeToJson(this);
}
