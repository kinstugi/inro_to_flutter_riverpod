import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';
import 'package:learning_riverpod/models/todo.dart';
import 'package:learning_riverpod/pages/stateprovider_page.dart';

Future<Todo> fetchWeather({int index = 1}) {
  final dio = Dio();
  return dio
      .get('https://jsonplaceholder.typicode.com/todos/$index')
      .then((value) => value.data)
      .then((value) => Todo.fromJson(value))
      .catchError((e) => throw (e.toString()));
}

final weatherRequest = FutureProvider((ref) {
  final cnt = ref.watch(changeableNumber);

  return fetchWeather(index: cnt);
});

class FutureProviderPage extends StatelessWidget {
  static const String tag = '/future-provider';
  const FutureProviderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Future Provider'),
        ),
        body: Center(
          child: Consumer(
            builder: (ctx, ref, child) {
              final ft = ref.watch(weatherRequest);
              return ft.when(
                data: (val) => Text(
                  val.title,
                  style: Theme.of(ctx).textTheme.headline4,
                  textAlign: TextAlign.center,
                ),
                error: (er, stack) => Text('$er'),
                loading: () => const CircularProgressIndicator(),
              );
            },
          ),
        ));
  }
}
