import 'dart:convert';

List<FoodModel> foodModelFromJson(String str) =>
    List<FoodModel>.from(json.decode(str).map((x) => FoodModel.fromJson(x)));

String foodModelToJson(List<FoodModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FoodModel {
  FoodModel({
    required this.id,
    required this.type,
    required this.name,
    required this.price,
    required this.image,
  });

  final int? id;
  final String? type;
  final String? name;
  final String? price;
  final String? image;

  factory FoodModel.fromJson(Map<String, dynamic> json) => FoodModel(
        id: json["id"],
        type: json["type"],
        name: json["name"],
        price: json["price"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "name": name,
        "price": price,
        "image": image,
      };
}
