import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoappstatenotifier/pages/todos_page.dart';

void main() {
  runApp(
    const ProviderScope(child: MyApp())
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: MaterialButton(onPressed: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (_) =>  TodosPage()));
      },
      color: Colors.red,
      child: Text('State Notifier Provider'),
      ),),
    );
  }
}