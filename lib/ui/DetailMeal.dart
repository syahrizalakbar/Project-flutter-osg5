import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';


/// Masukan parameter id mealnya untuk menampilkan detail itemnya
/// ex
/// child : DetailMeal(52772)
class DetailMeal extends StatefulWidget {
  final String id;

  DetailMeal(this.id);

  @override
  _DetailMealState createState() => _DetailMealState();
}

class _DetailMealState extends State<DetailMeal> {
  String preUri = "https://www.themealdb.com/api/json/v1/1/lookup.php?i=";
  String titleMeal = "";

  Future getData() async {
    String id = widget.id;
    http.Response response = await http.get(preUri + " " + id.toString());
    if (response.statusCode == 200) return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            var meal = snapshot.data['meals'][0];
            return Scaffold(
                appBar: AppBar(
                  title: Text(meal['strMeal']),
                ),
                body: Container(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Image(image: NetworkImage(meal['strMealThumb'])),
                        SizedBox(
                          height: 16.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: Text(
                            meal['strMeal'],
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                        ),
                        SizedBox(
                          height: 16.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: Row(
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'Category',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 8.0,
                                  ),
                                  Text('Meal Category'),
                                  SizedBox(
                                    height: 16.0,
                                  ),
                                  Text(
                                    'Ingredients',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 8.0,
                                  ),
                                  Text("- ${meal['strIngredient1']}"),
                                  Text("- ${meal['strIngredient2']}"),
                                  Text("- ${meal['strIngredient3']}"),
                                  Text("- ${meal['strIngredient4']}"),
                                  Text("- ${meal['strIngredient5']}"),
                                  Text("- ${meal['strIngredient6']}"),
                                  Text("- ${meal['strIngredient7']}"),
                                  Text("- ${meal['strIngredient8']}"),
                                  Text("- ${meal['strIngredient9']}"),
                                  Text("- ${meal['strIngredient10']}"),
                                ],
                              ),
                              SizedBox(
                                width: 16.0,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'Area',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 8.0,
                                  ),
                                  Text('Area Meal'),
                                  SizedBox(
                                    height: 16.0,
                                  ),
                                  Text(
                                    'Measure',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 8.0,
                                  ),
                                  Text("- ${meal['strMeasure1']}"),
                                  Text("- ${meal['strMeasure2']}"),
                                  Text("- ${meal['strMeasure3']}"),
                                  Text("- ${meal['strMeasure4']}"),
                                  Text("- ${meal['strMeasure5']}"),
                                  Text("- ${meal['strMeasure6']}"),
                                  Text("- ${meal['strMeasure7']}"),
                                  Text("- ${meal['strMeasure8']}"),
                                  Text("- ${meal['strMeasure9']}"),
                                  Text("- ${meal['strMeasure10']}"),
                                ],
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 32.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: Text(
                            meal['strMeal'],
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              meal['strInstructions'],
                              textAlign: TextAlign.justify,
                            ))
                      ],
                    ),
                  ),
                ));
          } else {
            return Container(
              width: 300,
              height: 200.0,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        });
  }
}
