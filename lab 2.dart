import "package:flutter/cupertino.dart";

import
void main(){
  runApp(
      debugShowcheckdmode:false,
      home:scaffold(
          appbar:appbar(
            title:text("my"),
            backroundcolor:blue,
            action:[
              Icoinbutton(onpass:(){},icon:icon(icon,search)),
              Iconbutton(onpass:(){},icon:icon(icon,search))
            ],
          ),
          body:crnter(
              chiild:cointauner(
                  color:blue,
                  padding:edgeinsets.all(40.0)
                  child:clunm(
              children:[
              decoration:inputdecection(
                  border:outline
              )
              ]
          )
      )
  )
  )
  )
}

//other code
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      appBar: AppBar(
        title: Text('This is app bar'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: Icon(Icons.settings)),
          IconButton(onPressed: () {}, icon: Icon(Icons.login)),
        ],
      ),
      body: Center(
        child: Container(
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Name',
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Roll',
                ),
              ),
              Text("My Name is"),
              Text("My Roll is"),
              ElevatedButton(onPressed: () {}, child: Text("Enter")),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.amber,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Text('Click'),
      ),
    ),
  )
  );
}

// nijer moto kaj
import 'package:flutter/material.dart';

void main() {
  runApp(MyStatelessWidget());
}

class MyStatelessWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('This is app bar'),
          centerTitle: true,
          backgroundColor: Colors.blueGrey,
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.search)),
            IconButton(onPressed: () {}, icon: Icon(Icons.settings)),
            IconButton(onPressed: () {}, icon: Icon(Icons.login)),
          ],
        ),
        body: Center(
          child: Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Name',
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Roll',
                  ),
                ),
                SizedBox(height: 10),
                Text("My Name is"),
                Text("My Roll is"),
                SizedBox(height: 10),
                ElevatedButton(onPressed: () {}, child: Text("Enter")),
              ],
            ),
          ),
        ),
        backgroundColor: Colors.amber,
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Text('Click'),
        ),
      ),
    );
  }
}

// sateless
import 'package:flutter/material.dart';

void main() {
  runApp(MyStatelessWidget());
}

class MyStatelessWidget extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController rollController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('This is app bar'),
          centerTitle: true,
          backgroundColor: Colors.blueGrey,
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.search)),
            IconButton(onPressed: () {}, icon: Icon(Icons.settings)),
            IconButton(onPressed: () {}, icon: Icon(Icons.login)),
          ],
        ),
        body: Center(
          child: Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Name',
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: rollController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Roll',
                  ),
                ),
                SizedBox(height: 10),
                Text("My Name is ${nameController.text}"),
                Text("My Roll is ${rollController.text}"),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    print("Name: ${nameController.text}");
                    print("Roll: ${rollController.text}");
                  },
                  child: Text("Enter"),
                ),
              ],
            ),
          ),
        ),
        backgroundColor: Colors.amber,
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Text('Click'),
        ),
      ),
    );
  }
}

// satefull
import 'package:flutter/material.dart';

void main() {
  runApp(MyStatefulWidget());
}

class MyStatefulWidget extends StatefulWidget {
  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  String name = '';
  String roll = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('This is app bar'),
          centerTitle: true,
          backgroundColor: Colors.blueGrey,
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.search)),
            IconButton(onPressed: () {}, icon: Icon(Icons.settings)),
            IconButton(onPressed: () {}, icon: Icon(Icons.login)),
          ],
        ),
        body: Center(
          child: Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Name',
                  ),
                  onChanged: (value) {
                    setState(() {
                      name = value;
                    });
                  },
                ),
                SizedBox(height: 10),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Roll',
                  ),
                  onChanged: (value) {
                    setState(() {
                      roll = value;
                    });
                  },
                ),
                SizedBox(height: 10),
                Text("My Name is $name"),
                Text("My Roll is $roll"),
                SizedBox(height: 10),
                ElevatedButton(onPressed: () {}, child: Text("Enter")),
              ],
            ),
          ),
        ),
        backgroundColor: Colors.amber,
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Text('Click'),
        ),
      ),
    );
  }
}


