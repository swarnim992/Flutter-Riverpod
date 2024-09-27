import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:streamprovider/stream/stream_provider_page.dart';

void main() {
  runApp(
    const ProviderScope(child: MyApp())
    // const MyApp()
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: ListView(
        children: [
          MaterialButton(onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (_) => const StreamProviderPage()));
          },
          child: const Text("Stream provider"),
          )
        ],
      ),),
    );
  }
}
