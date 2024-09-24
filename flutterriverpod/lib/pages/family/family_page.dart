

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterriverpod/pages/family/family_provider.dart';

class FamilyPage extends ConsumerStatefulWidget {
  const FamilyPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FamilyPageState();
}

class _FamilyPageState extends ConsumerState<FamilyPage> {

  @override
  Widget build(BuildContext context) {

    final incVal = ref.watch(familyProvider(10));
    final decVal = ref.watch(familyProvider(-10));

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              incVal.toString(),
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(height: 10),
            Text(
              decVal.toString(),
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        ref.read(familyProvider(10).notifier).update((state) => state+10);
        ref.read(familyProvider(-10).notifier).update((state) => state-10);
      },),
    );
  }
}