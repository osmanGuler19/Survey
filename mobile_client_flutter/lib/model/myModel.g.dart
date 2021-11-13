// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'myModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      name: json['name'] as String,
      surname: json['surname'] as String,
      email: json['email'] as String,
      passw: json['passw'] as String,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'name': instance.name,
      'surname': instance.surname,
      'email': instance.email,
      'passw': instance.passw,
    };

Survey _$SurveyFromJson(Map<String, dynamic> json) => Survey(
      survey_id: json['survey_id'] as String,
      title: json['title'] as String,
      answers: (json['answers'] as List<dynamic>)
          .map((e) => Answer.fromJson(e as Map<String, dynamic>))
          .toList(),
      created_at: DateTime.parse(json['created_at'] as String),
      updated_at: DateTime.parse(json['updated_at'] as String),
      user: User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SurveyToJson(Survey instance) => <String, dynamic>{
      'survey_id': instance.survey_id,
      'title': instance.title,
      'answers': instance.answers,
      'created_at': instance.created_at.toIso8601String(),
      'updated_at': instance.updated_at.toIso8601String(),
      'user': instance.user,
    };

Answer _$AnswerFromJson(Map<String, dynamic> json) => Answer(
      order: json['order'] as int,
      response: json['response'] as String,
      survey: Survey.fromJson(json['survey'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AnswerToJson(Answer instance) => <String, dynamic>{
      'order': instance.order,
      'response': instance.response,
      'survey': instance.survey,
    };

Question _$QuestionFromJson(Map<String, dynamic> json) => Question(
      order: json['order'] as int,
      text: json['text'] as String,
      type: json['type'] as String,
    );

Map<String, dynamic> _$QuestionToJson(Question instance) => <String, dynamic>{
      'order': instance.order,
      'text': instance.text,
      'type': instance.type,
    };

Component _$ComponentFromJson(Map<String, dynamic> json) => Component(
      id: json['id'] as int,
      label: json['label'] as String,
    );

Map<String, dynamic> _$ComponentToJson(Component instance) => <String, dynamic>{
      'label': instance.label,
      'id': instance.id,
    };

Scope _$ScopeFromJson(Map<String, dynamic> json) => Scope(
      id: json['id'] as int,
      label: json['label'] as String,
    );

Map<String, dynamic> _$ScopeToJson(Scope instance) => <String, dynamic>{
      'label': instance.label,
      'id': instance.id,
    };
