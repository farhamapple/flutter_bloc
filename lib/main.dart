import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/blocs/counter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CounterBloc bloc = CounterBloc();

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("Build");
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter Bloc"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StreamBuilder(
              stream: bloc.outputan,
              initialData: bloc.counter,
              builder: (context, snapshot) => Text(
                "Angka saat ini : ${snapshot.data}",
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {
                    bloc.sinkInputan.add("minus");
                    print("Aksi Minus");
                  },
                  icon: Icon(Icons.remove),
                ),
                IconButton(
                    onPressed: () {
                      bloc.sinkInputan.add("add");
                      print("Aksi Plus");
                    },
                    icon: Icon(Icons.add)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
