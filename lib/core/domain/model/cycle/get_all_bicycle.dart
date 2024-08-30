// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'price_model.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class GetAllBicycleModel {
  int id;
  List<ModelPrice> model_price;
  dynamic size;
  dynamic photoPath;
  String type;
  String note;
  GetAllBicycleModel({
    required this.id,
    required this.model_price,
    required this.size,
    required this.photoPath,
    required this.type,
    required this.note,
  });

  GetAllBicycleModel copyWith({
    int? id,
    List<ModelPrice>? model_price,
    dynamic size,
    dynamic photoPath,
    String? type,
    String? note,
  }) {
    return GetAllBicycleModel(
      id: id ?? this.id,
      model_price: model_price ?? this.model_price,
      size: size ?? this.size,
      photoPath: photoPath ?? this.photoPath,
      type: type ?? this.type,
      note: note ?? this.note,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'model_price': model_price.map((x) => x.toMap()).toList(),
      'size': size,
      'photoPath': photoPath,
      'type': type,
      'note': note,
    };
  }

  factory GetAllBicycleModel.fromMap(Map<String, dynamic> map) {
    return GetAllBicycleModel(
      id: map['id'] as int,
      model_price: [
        ModelPrice.fromMap(map['model_price'] as Map<String, dynamic>)
      ],
      size: map['size'] as dynamic,
      photoPath: map['photoPath'] as dynamic,
      type: map['type'] as String,
      note: map['note'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory GetAllBicycleModel.fromJson(String source) =>
      GetAllBicycleModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'GetAllBicycleModel(id: $id, model_price: $model_price, size: $size, photoPath: $photoPath, type: $type, note: $note)';
  }

  @override
  bool operator ==(covariant GetAllBicycleModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        listEquals(other.model_price, model_price) &&
        other.size == size &&
        other.photoPath == photoPath &&
        other.type == type &&
        other.note == note;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        model_price.hashCode ^
        size.hashCode ^
        photoPath.hashCode ^
        type.hashCode ^
        note.hashCode;
  }
}
