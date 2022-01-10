import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final changeableNumber = StateProvider<int>((ref) => 1);

class StateProviderPage extends StatelessWidget {
  static const String tag = '/state-provider';
  const StateProviderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('State Provider'),
      ),
      body: Center(
        child: Consumer(
          builder: (ctx, ref, child) {
            final num = ref.watch(changeableNumber).toString();
            return Text(
              num,
              style: Theme.of(context).textTheme.headline2,
            );
          },
        ),
      ),
      floatingActionButton: const MyFloatingActionButton(),
    );
  }
}

class MyFloatingActionButton extends ConsumerWidget {
  const MyFloatingActionButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () {
        ref.read(changeableNumber.state).state++;
      },
    );
  }
}
