

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'basic_auto_dispose_provider.g.dart';

final countProvider = StateProvider.autoDispose<int>((ref) {
  ref.onDispose((){
    print('Count Provider disposed');
  });
  return 0;
});


// final ageProvider = Provider<String>((ref) {

//   ref.onDispose(
//     (){
//       print('age provider dispose');
//     }
//   );
  
//   final count = ref.watch(countProvider);
  
//   return 'My age is $count';
// });


// @Riverpod(keepAlive: false)
// String ageProvider(AutoDisposeAgeRef ref) {
 
//   ref.onDispose(
//     (){
//       print('age provider dispose');
//     }
//   );
  
//   final count = ref.watch(countProvider);
  
//   return 'My age is $count';
// }
@Riverpod(keepAlive: false)
String autoDisposeAge(AutoDisposeAgeRef ref) {
// ignore: avoid_manual_providers_as_generated_provider_dependency
  final age = ref.watch(countProvider);
  ref.onDispose(() {
    print('[autoDisposeAgeProvider] disposed');
  });
  return 'Hi! I am $age years old.';
}
