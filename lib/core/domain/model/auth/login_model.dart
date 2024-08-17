// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class LogInModel {
  final String password;
  final String phone;

  LogInModel(
    this.password,
    this.phone,
  );

  LogInModel copyWith({
    String? password,
    String? phone,
  }) {
    return LogInModel(
      password ?? this.password,
      phone ?? this.phone,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'password': password,
      'phone': phone,
    };
  }

  factory LogInModel.fromMap(Map<String, dynamic> map) {
    return LogInModel(
      map['password'] as String,
      map['phone'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory LogInModel.fromJson(String source) =>
      LogInModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'LogInModel(password: $password, phone: $phone)';

  @override
  bool operator ==(covariant LogInModel other) {
    if (identical(this, other)) return true;

    return other.password == password && other.phone == phone;
  }

  @override
  int get hashCode => password.hashCode ^ phone.hashCode;
}
