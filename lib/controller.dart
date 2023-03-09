import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:foodapp/food_model.dart';
import 'package:get/get.dart';

class Controller extends GetxController {
  var isLoading = true.obs;
  var foodList = List<FoodModel>.empty(growable: true).obs;

  Future<List<FoodModel>> readJsonFile() async {
    List<dynamic> loadedData = [];
    final response = await rootBundle.loadString('json/foods.json');
    final data = json.decode(response);
    loadedData = data as dynamic;
    return loadedData.map((e) => FoodModel.fromJson(e)).toList();
  }

  fetchPizza() async {
    try {
      isLoading(true);
      var result = await readJsonFile();
      result = result.where((p0) => p0.type == 'pizza').toList();
      foodList.assignAll(result);
      update();
    } finally {
      isLoading(false);
    }
  }
}
