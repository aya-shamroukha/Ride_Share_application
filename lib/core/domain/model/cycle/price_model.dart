import 'dart:convert';

class ModelPrice {
  int id;
  dynamic price;
  String model;
  ModelPrice({
    required this.id,
    required this.price,
    required this.model,
  });

  ModelPrice copyWith({
    int? id,
    dynamic price,
    String? model,
  }) {
    return ModelPrice(
      id: id ?? this.id,
      price: price ?? this.price,
      model: model ?? this.model,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'price': price,
      'model': model,
    };
  }

  factory ModelPrice.fromMap(Map<String, dynamic> map) {
    return ModelPrice(
      id: map['id'] as int,
      price: map['price'] as dynamic,
      model: map['model'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ModelPrice.fromJson(String source) =>
      ModelPrice.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ModelPrice(id: $id, price: $price, model: $model)';

  @override
  bool operator ==(covariant ModelPrice other) {
    if (identical(this, other)) return true;

    return other.id == id && other.price == price && other.model == model;
  }

  @override
  int get hashCode => id.hashCode ^ price.hashCode ^ model.hashCode;
}
