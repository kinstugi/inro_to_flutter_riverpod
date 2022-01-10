import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final streamProvider = StreamProvider.autoDispose<String>((ref) =>
    Stream.periodic(const Duration(milliseconds: 400), (count) => '$count'));

class StreamProviderPage extends StatelessWidget {
  static const String tag = '/stream-provider';
  const StreamProviderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stream Provider'),
      ),
      body: Consumer(
        builder: (context, watch, child) {
          return Center(child: buildStreamWhen(context, watch));
        },
      ),
    );
  }

  Widget buildStreamWhen(BuildContext context, WidgetRef watch) {
    final stream = watch.watch(streamProvider);

    return stream.when(
      data: (cnt) => Text(
        cnt,
        style: Theme.of(context).textTheme.headline2,
      ),
      error: (e, stack) => Text('$e'),
      loading: () => const CircularProgressIndicator(),
    );
  }
}
