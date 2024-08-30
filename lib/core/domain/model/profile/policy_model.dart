// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PolicyModel {
  final String description;
  final String title;
  PolicyModel({
    required this.description,
    required this.title,
  });

  PolicyModel copyWith({
    String? description,
    String? title,
  }) {
    return PolicyModel(
      description: description ?? this.description,
      title: title ?? this.title,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'description': description,
      'title': title,
    };
  }

  factory PolicyModel.fromMap(Map<String, dynamic> map) {
    return PolicyModel(
      description: map['description'] as String,
      title: map['title'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PolicyModel.fromJson(String source) =>
      PolicyModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'PolicyModel(description: $description, title: $title)';

  @override
  bool operator ==(covariant PolicyModel other) {
    if (identical(this, other)) return true;

    return other.description == description && other.title == title;
  }

  @override
  int get hashCode => description.hashCode ^ title.hashCode;
}
