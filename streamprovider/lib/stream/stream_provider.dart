


import 'package:flutter_riverpod/flutter_riverpod.dart';

final streamProvider = StreamProvider<int>((ref) {
  return Stream.periodic(const Duration(seconds: 1),(t)=>t+1).take(60);
});