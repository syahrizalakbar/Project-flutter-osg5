
import 'dart:convert';

import 'package:http/http.dart';

RootResponse rootResponseFromJson(String str) => RootResponse.fromJson(json.decode(str));

String rootResponseToJson(RootResponse data) => json.encode(data.toJson());

class RootResponse {
  List<Meal> meals;

  RootResponse({
    this.meals,
  });

  factory RootResponse.fromJson(Map<String, dynamic> json) => RootResponse(
    meals: List<Meal>.from(json["meals"].map((x) => Meal.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "meals": List<dynamic>.from(meals.map((x) => x.toJson())),
  };
}

class Meal {
  String strMeal;
  String strMealThumb;
  String idMeal;

  Meal({
    this.strMeal,
    this.strMealThumb,
    this.idMeal,
  });

  factory Meal.fromJson(Map<String, dynamic> json) => Meal(
    strMeal: json["strMeal"],
    strMealThumb: json["strMealThumb"],
    idMeal: json["idMeal"],
  );

  Map<String, dynamic> toJson() => {
    "strMeal": strMeal,
    "strMealThumb": strMealThumb,
    "idMeal": idMeal,
  };
}

