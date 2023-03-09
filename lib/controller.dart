import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:foodapp/food_model.dart';
import 'package:get/get.dart';

class Controller extends GetxController {
  var isLoading = true.obs;
  var contentIndex = 0.obs;
  var foodList = List<FoodModel>.empty(growable: true).obs;
  var saladList = List<FoodModel>.empty(growable: true).obs;
  var drinkList = List<FoodModel>.empty(growable: true).obs;

  @override
  void onInit() async {
    fetchData();
    super.onInit();
  }

  Future<List<FoodModel>> readJsonFile() async {
    List<dynamic> loadedData = [];
    final response = await rootBundle.loadString('json/foods.json');
    final data = json.decode(response);
    loadedData = data as dynamic;
    return loadedData.map((e) => FoodModel.fromJson(e)).toList();
  }

  fetchData() async {
    try {
      isLoading(true);
      var result = await readJsonFile();
      var pizza = result.where((p0) => p0.type == 'pizza').toList();
      var salad = result.where((p0) => p0.type == 'salad').toList();
      var drink = result.where((p0) => p0.type == 'drink').toList();
      foodList.assignAll(pizza);
      saladList.assignAll(salad);
      drinkList.assignAll(drink);
      update();
    } finally {
      isLoading(false);
    }
  }
}
