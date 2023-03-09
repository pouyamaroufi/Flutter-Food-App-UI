import 'dart:convert';

List<FoodModel> foodModelFromJson(String str) =>
    List<FoodModel>.from(json.decode(str).map((x) => FoodModel.fromJson(x)));

String foodModelToJson(List<FoodModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FoodModel {
  FoodModel({this.id, this.type, this.name, this.price, this.image, this.item});

  int? id;
  String? type;
  String? name;
  String? price;
  String? image;
  int? item;

  factory FoodModel.fromJson(Map<String, dynamic> json) => FoodModel(
        id: json["id"],
        type: json["type"],
        name: json["name"],
        price: json["price"],
        image: json["image"],
        item: json["item"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "name": name,
        "price": price,
        "image": image,
        "item": item
      };
}
