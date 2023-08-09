import 'package:estudos_state/home_provider.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return HomeProvider(
      counter: _counter,
      child: Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            CounterWidget(),
            OutlinedButton(
              onPressed: () {
              setState(() {
                _counter--;
              });
            }, 
            child: const Text('Decrement')),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: _decrementCounter,
            tooltip: 'Increment',
            child: const Icon(Icons.remove),
          ),
        ],
      ),
      
    ),
    );

  }
}

class CounterWidget extends StatelessWidget {
  const CounterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final provider = HomeProvider.of(context);

    return Text(
      '${provider?.counter}',
      style: Theme.of(context).textTheme.headlineMedium,
    );
  }
}