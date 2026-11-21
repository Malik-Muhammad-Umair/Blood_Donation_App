import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("My Form"),
          backgroundColor: Colors.blue,
        ),

        body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Text("Name"),
              Text("Email"),

              ElevatedButton(
                onPressed: () {},
                child: Text("Submit"),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}