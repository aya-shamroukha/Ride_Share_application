// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class SignUpModel {
  final String firstName;
  final String lastName;
  final String username;
  final String phone;
  final String birthDate;
  final String password;
  final String confirmPassword;

  SignUpModel({
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.phone,
    required this.birthDate,
    required this.password,
    required this.confirmPassword,
  });

  SignUpModel copyWith({
    String? firstName,
    String? lastName,
    String? username,
    String? phone,
    String? birthDate,
    String? password,
    String? confirmPassword,
  }) {
    return SignUpModel(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      username: username ?? this.username,
      phone: phone ?? this.phone,
      birthDate: birthDate ?? this.birthDate,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'firstName': firstName,
      'lastName': lastName,
      'username': username,
      'phone': phone,
      'birthDate': birthDate,
      'password': password,
      'confirmPassword': confirmPassword,
    };
  }

  factory SignUpModel.fromMap(Map<String, dynamic> map) {
    return SignUpModel(
      firstName: map['firstName'] as String,
      lastName: map['lastName'] as String,
      username: map['username'] as String,
      phone: map['phone'] as String,
      birthDate: map['birthDate'] as String,
      password: map['password'] as String,
      confirmPassword: map['confirmPassword'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory SignUpModel.fromJson(String source) =>
      SignUpModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'SignUpModel(firstName: $firstName, lastName: $lastName, username: $username, phone: $phone, birthDate: $birthDate, password: $password, confirmPassword: $confirmPassword)';
  }

  @override
  bool operator ==(covariant SignUpModel other) {
    if (identical(this, other)) return true;

    return other.firstName == firstName &&
        other.lastName == lastName &&
        other.username == username &&
        other.phone == phone &&
        other.birthDate == birthDate &&
        other.password == password &&
        other.confirmPassword == confirmPassword;
  }

  @override
  int get hashCode {
    return firstName.hashCode ^
        lastName.hashCode ^
        username.hashCode ^
        phone.hashCode ^
        birthDate.hashCode ^
        password.hashCode ^
        confirmPassword.hashCode;
  }
}
