import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learning_riverpod/pages/futureprovider_page.dart';
import 'package:learning_riverpod/pages/provider_page.dart';
// import 'package:learning_riverpod/pages/scopedprovider_page.dart';
import 'package:learning_riverpod/pages/stateprovider_page.dart';
import 'package:learning_riverpod/pages/streamprovider_page.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'All About Riverpod',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      routes: {
        '/': (ctx) => const HomePage(),
        ProviderPage.tag: (ctx) => const ProviderPage(),
        StateProviderPage.tag: (ctx) => const StateProviderPage(),
        FutureProviderPage.tag: (ctx) => const FutureProviderPage(),
        StreamProviderPage.tag: (ctx) => const StreamProviderPage(),
        // ScopedProviderPage.tag: (ctx) => const ScopedProviderPage(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RiverPod'),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(ProviderPage.tag);
              },
              child: const Text('Provider'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(StateProviderPage.tag);
              },
              child: const Text('State Provider'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(FutureProviderPage.tag);
              },
              child: const Text('Future Provider'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(StreamProviderPage.tag);
              },
              child: const Text('Stream Provider'),
            ),
          ],
        ),
      ),
    );
  }
}
