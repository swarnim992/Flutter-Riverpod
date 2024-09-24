import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterriverpod/basic_auto_dispose/basic_auto_dispose.dart';
import 'package:flutterriverpod/pages/basic/basic_page.dart';
import 'package:flutterriverpod/pages/family/family_page.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
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
      home: const Home(),
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
      backgroundColor: Colors.grey[200],
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const BasicPage()),
                );
              },
              height: 40,
              color: Colors.blue,
              child: const Text('Simple provider'),
            ),

            MaterialButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const BasicAutoDispose()),
                );
              },
              height: 40,
              color: Colors.blue,
              child: const Text('Basic Auto dispose provider'),
            ),

            MaterialButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const FamilyPage()),
                );
              },
              height: 40,
              color: Colors.blue,
              child: const Text('Family provider'),
            ),
          ],
        ),
      ),
    );
  }
}
