import 'package:example/global/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:minimal_state_manager/minimal_state_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider<ThemeController>(
      create: () => ThemeController(),
      child: Consumer<ThemeController>(
        builder: (_, controller) => MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: controller.isDarkModeEnabled
              ? ThemeData.dark()
              : ThemeData.light(),
          home: const MyHomePage(),
        ),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Home();
  }
}

class HomeController extends ProviderNotifier {
  int _count = 0;

  int get count => _count;

  void increment() {
    _count++;
    notify();
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider<HomeController>(
      create: () => HomeController(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('Flutter Demo Home Page'),
          actions: [
            Consumer<ThemeController>(
              builder: (_, controller) => IconButton(
                icon: Icon(
                    Provider.of<ThemeController>(context).isDarkModeEnabled
                        ? Icons.light_mode
                        : Icons.dark_mode),
                onPressed: () {
                  controller.toggleTheme();
                },
              ),
            ),
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'You have pushed the button this many times:',
              ),
              Consumer<HomeController>(
                builder: (_, controller) => Text(
                  '${controller.count}',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: Consumer<HomeController>(
          builder: (_, controller) {
            return FloatingActionButton(
              onPressed: () {
                controller.increment();
              },
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            );
          },
        ),
      ),
    );
  }
}
