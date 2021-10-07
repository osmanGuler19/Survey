// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'myModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      name: json['name'] as String,
      surname: json['surname'] as String,
      email: json['email'] as String,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'name': instance.name,
      'surname': instance.surname,
      'email': instance.email,
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
