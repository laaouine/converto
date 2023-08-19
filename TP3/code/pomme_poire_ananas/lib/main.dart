import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const MyHomePage(title: 'Pomme, Poire et Ananas'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  List<int> _items = [];

  void _addItemToList() {
    setState(() {
      _items.add(_counter);
      _counter++;
    });
  }

  bool isPrime(int value) {
    if (value < 2) return false;
    for (int i = 2; i <= value / 2; i++) {
      if (value % i == 0) {
        return false;
      }
    }
    return true;
  }

  String getCounterType() {
    if (isPrime(_counter)) {
      return 'nombre premier';
    } else if (_counter % 2 == 0) {
      return 'pair';
    } else {
      return 'impair';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_counter.toString() + " est un : " + getCounterType()),
      ),
      body: ListView.builder(
        itemCount: _items.length,
        itemBuilder: (context, index) {
          final itemValue = _items[index];
          final isItemPrime = isPrime(itemValue);

          Widget itemImage;
          if (isItemPrime) {
            itemImage = Image.asset('images/ananas.png');
          } else if (itemValue % 2 == 0) {
            itemImage = Image.asset('images/poire.png');
          } else {
            itemImage = Image.asset('images/pomme.png');
          }

          Color backgroundColor;
          if (itemValue % 2 == 0) {
            backgroundColor = Colors.cyan;
          } else {
            backgroundColor = Colors.indigo;
          }

          return Container(
            color: backgroundColor,
            child: ListTile(
              leading: itemImage,
              title: Text(
                'Item $itemValue',
                style: TextStyle(color: Colors.white),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addItemToList,
        tooltip: 'Add Item',
        child: Icon(Icons.add),
      ),
    );
  }
}
