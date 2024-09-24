import 'package:flutter_riverpod/flutter_riverpod.dart';


final familyProvider = StateProvider.family<int,int >((ref, initval) {
  
  ref.onDispose((){
    print('family provider dispose $initval');
  });
  
  return initval;
});