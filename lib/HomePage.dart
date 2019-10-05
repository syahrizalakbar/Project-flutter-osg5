import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:meal_catalogue/ui/About.dart';
import 'package:meal_catalogue/ui/DetailMeal.dart';
import 'DataModel.dart';

int selectedIndex = 0;

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomeState();
  }
}

class _HomeState extends State<HomePage> {
  final List<Widget> pages = [
    PageHome("BreakFast"),
    PageHome("Dessert"),
    PageHome("Pasta")
  ];
  final PageStorageBucket bucket = PageStorageBucket();

  void _incrementTab(index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    print(selectedIndex);
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Meal App",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.orange,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => About()));
            },
            icon: Icon(
              Icons.error,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: new PageStorage(
        child: pages[selectedIndex],
        bucket: bucket,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                IconData(0xe900, fontFamily: 'BreakFast'),
                color: Colors.orange,
              ),
              title: new Text("Breakfast",
                  style: TextStyle(color: Colors.orange))),
          BottomNavigationBarItem(
              icon: Icon(const IconData(0xe900, fontFamily: 'Desert'),
                  color: Colors.orange),
              title:
                  new Text("Dessert", style: TextStyle(color: Colors.orange))),
          BottomNavigationBarItem(
              icon: Icon(IconData(0xe900, fontFamily: 'Pasta'),
                  color: Colors.orange),
              title: new Text(
                "Pasta",
                style: TextStyle(color: Colors.orange),
              )),
        ],
        onTap: (index) {
          _incrementTab(index);
        },
      ),
    );
  }
}

class PageHome extends StatelessWidget {
  String data;
  PageHome(String data) {
    this.data = data;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<RootResponse>(
        future: getData(data),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          RootResponse rootResponse = snapshot.data;
          if (snapshot.hasData)
            return GridView.count(
              crossAxisCount: 2,
              children: List.generate(rootResponse.meals.length, (index) {
                return InkResponse(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                 DetailMeal(rootResponse.meals[index].idMeal)));
                  },
                  child: GridTile(
                    child: new ItemView(rootResponse.meals[index]),
                  ),
                );
              }),
            );
          else
            return Center(
              child: CircularProgressIndicator(),
            );
        });
  }
}

class ItemView extends StatelessWidget {
  Meal meal;
  ItemView(Meal meal) {
    this.meal = meal;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 1.5,
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
        margin: EdgeInsets.all(6.0),
        child: Stack(
          children: <Widget>[
            Container(
              child: Image.network(
                meal.strMealThumb,
                fit: BoxFit.fill,
              ),
            ),
            Container(
              color: Colors.black.withOpacity(0.3),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(16),
                  child: Text(
                    meal.strMeal,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        fontFamily: 'Montserrat',
                        fontSize: 14.0),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

Future<RootResponse> getData(String data) async {
  Response response =
      await get('https://www.themealdb.com/api/json/v1/1/filter.php?c=$data');
  if (response.statusCode == 200)
    return rootResponseFromJson(response.body);
  else
    throw Exception('error code : ${response.statusCode}');
}
