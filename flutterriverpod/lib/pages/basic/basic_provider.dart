

import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterProvider = StateProvider<int>((ref) {
  ref.onDispose((){
    print('counter Disposed');
  });

  return 0;
});