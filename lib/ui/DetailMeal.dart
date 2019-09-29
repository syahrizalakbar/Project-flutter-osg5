import 'package:flutter/material.dart';

class DetailMeal extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Nama Makanan"),
      ),

      body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image(
              image: NetworkImage('https://www.themealdb.com/images/media/meals/xxyupu1468262513.jpg')),

            SizedBox(height: 16.0,),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text('Nama Makanann', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
            ),

            SizedBox(height: 16.0,),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Row(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Category', style: TextStyle(fontWeight: FontWeight.bold),),
                      SizedBox(height: 8.0,),
                      Text('Meal Category'),

                      SizedBox(height: 16.0,),
                      Text('Ingredients', style: TextStyle(fontWeight: FontWeight.bold),),
                      SizedBox(height: 8.0,),
                      Text('- Meal Category'),
                      Text('- Meal Category'),
                      Text('- Meal Category'),
                      Text('- Meal Category'),
                      Text('- Meal Category'),
                      Text('- Meal Category'),
                      Text('- Meal Category'),
                      Text('- Meal Category'),
                      Text('- Meal Category'),
                      Text('- Meal Category'),

                    ],
                  ),
                  SizedBox(width: 16.0,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Area', style: TextStyle(fontWeight: FontWeight.bold),),
                      SizedBox(height: 8.0,),
                      Text('Area Meal'),

                      SizedBox(height: 16.0,),
                      Text('Ingredients', style: TextStyle(fontWeight: FontWeight.bold),),
                      SizedBox(height: 8.0,),
                      Text('- Area Meal'),
                      Text('- Area Meal'),
                      Text('- Area Meal'),
                      Text('- Area Meal'),
                      Text('- Area Meal'),
                      Text('- Area Meal'),
                      Text('- Area Meal'),
                      Text('- Area Meal'),
                      Text('- Area Meal'),
                      Text('- Area Meal'),
                    ],
                  )
                ],
              ),
            ),

            SizedBox(height: 32.0,),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text('Nama Makanann', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text('Mix all the ingredients in the Honey Teriyaki Glaze together. Whisk to blend well. Combine the salmon and the Glaze together.\r\n\r\nHeat up a skillet on medium-low heat. Add the oil, Pan-fry the salmon on both sides until it’s completely cooked inside and the glaze thickens.\r\n\r\nGarnish with sesame and serve immediately.'),
            )
          ],
        ),
      ),
    );
  }
}