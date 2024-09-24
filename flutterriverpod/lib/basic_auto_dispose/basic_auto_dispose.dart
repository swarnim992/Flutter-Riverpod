

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterriverpod/basic_auto_dispose/basic_auto_dispose_provider.dart';

class BasicAutoDispose extends ConsumerWidget {
  const BasicAutoDispose({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final count = ref.watch(autoDisposeAgeProvider);


    return Scaffold(
      body: Center(
        child: Text(count),
      ),

      floatingActionButton: FloatingActionButton(onPressed: (){
        ref.read(countProvider.notifier).state++;
      },
      child: const Icon(Icons.add),
      ),
    );
  }
}