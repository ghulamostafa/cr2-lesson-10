import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String _dataText = '';
  List<Todo> _todos = [
    Todo(userId: 1, id: 1, title: 'My first item', completed: false)
  ];
  TextEditingController _inputText = TextEditingController();

  final dio = Dio();

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: SizedBox(
          width: 700,
          child: Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                itemCount: _todos.length,
                itemBuilder: (context, index) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            _todos.removeAt(index);
                          });
                        },
                        icon: Icon(Icons.delete),
                      ),
                      Text(
                        _todos[index].title,
                        style: TextStyle(
                          fontSize: 40,
                        ),
                      )
                    ],
                  );
                },
              ),
              TextField(
                controller: _inputText,
              ),
              TextButton(
                onPressed: () {
                  setState(
                    () {
                      _todos.add(
                        Todo(
                            userId: 1,
                            id: 1,
                            title: _inputText.text,
                            completed: false),
                      );
                    },
                  );
                  _inputText.text = '';
                },
                child: Text(
                  'Add Item',
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class Todo {
  final int id;
  final int userId;
  final String title;
  final bool completed;

  Todo({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });
}
