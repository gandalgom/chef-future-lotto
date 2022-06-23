import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Future',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHome(),
    );
  }
}

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {

  String result = 'no data found';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Future test'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => futureTest(context),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.fromLTRB(36.0, 12.0, 36.0, 12.0),
                  textStyle: const TextStyle(fontSize: 20.0),
                ),
                child: const Text('Future test'),
              ),
              const SizedBox(height: 20.0),
              Text(
                result,
                style: const TextStyle(fontSize: 20.0, color: Colors.redAccent),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void futureTest(BuildContext context) {
    Future.delayed(const Duration(seconds: 3))
      .then((value) => setState(() => result = 'The data is fetched'));

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Snack bar has shown first~'),
        duration: Duration(seconds: 1),
      )
    );
  }
}
