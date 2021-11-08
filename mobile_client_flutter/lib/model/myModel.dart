import 'package:json_annotation/json_annotation.dart';
part 'myModel.g.dart';

@JsonSerializable()
class User {
  String name;
  String surname;
  String email;
  String passw;
  User({required this.name, required this.surname, required this.email, required this.passw});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}

@JsonSerializable()
class Question {
  int order;
  String text;
  String type;

  Question({required this.order, required this.text, required this.type});

  factory Question.fromJson(Map<String, dynamic> json) =>
      _$QuestionFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionToJson(this);
}

@JsonSerializable()
class Component {
  String label;
  int id;
  Component({required this.id, required this.label});
  factory Component.fromJson(Map<String, dynamic> json) =>
      _$ComponentFromJson(json);
  Map<String, dynamic> toJson() => _$ComponentToJson(this);
}

@JsonSerializable()
class Scope {
  String label;
  int id;
  Scope({required this.id, required this.label});

  factory Scope.fromJson(Map<String, dynamic> json) => _$ScopeFromJson(json);
  Map<String, dynamic> toJson() => _$ScopeToJson(this);
}
