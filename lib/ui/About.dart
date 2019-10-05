import 'package:flutter/material.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About"),
      ),

      body: Center(
        child: Container(
          padding: EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text("Project Flutter OSG5", style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),),
              Text("Kelompok 3"),
              SizedBox(height: 16.0,),
              Text("Ketua", style: TextStyle(decoration: TextDecoration.underline, fontWeight: FontWeight.bold),),
              Text("Rakhmat Khaidir"),
              SizedBox(height: 8.0,),
              Text("Anggota", style: TextStyle(decoration: TextDecoration.underline, fontWeight: FontWeight.bold),),
              Text("Iman Nurohman"),
              Text("Novan Masriandi"),
              Text("Dani Wira"),
              Text("Syahrizal Akbar"),
              
            ],
          ),
        ),
      ),
    );
  }
}