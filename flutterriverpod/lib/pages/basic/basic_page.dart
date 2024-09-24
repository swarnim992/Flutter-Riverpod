

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterriverpod/pages/basic/basic_provider.dart';

class BasicPage extends ConsumerWidget {
  const BasicPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final count = ref.watch(counterProvider);


    return Scaffold(
      body: Center(
        child: Text(count.toString()),
      ),

      floatingActionButton: FloatingActionButton(onPressed: (){
        ref.read(counterProvider.notifier).state++;
      },
      child: Icon(Icons.add),
      ),
    );
  }
}