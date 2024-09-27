


import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:streamprovider/stream/stream_provider.dart';

class StreamProviderPage extends ConsumerWidget {
  const StreamProviderPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final count = ref.watch(streamProvider).value;

    return Scaffold(
      body: Center(
        child: Text(count.toString()),
      ),
    );
  }
}