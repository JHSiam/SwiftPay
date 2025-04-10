import 'package:flutter/material.dart';

void main() {
  runApp(MyStatelessWidget());
}
class myStateful extands StatefulWidget{
  @override
<state<myStatefulWidget> createState(){
    return _myState();
}

}
class _myStateful extends StatefulWidget {
  string name = '', roll = '', name1 = "abc", roll ="def"
      void buttonclick;

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
