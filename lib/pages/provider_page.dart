import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// this provider does not allow us to change the state we have stored in it
final numberProvider = Provider<int>((ref) => 42);

class ProviderPage extends StatelessWidget {
  static const String tag = '/provider-page';
  const ProviderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider'),
      ),
      body: Center(
        child: Consumer(
          builder: (ctx, ref, child) {
            final num = ref.read(numberProvider).toString();
            return Text(
              num,
              style: Theme.of(context).textTheme.headline2,
            );
          },
        ),
      ),
    );
  }
}
