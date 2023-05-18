import 'package:flutter/material.dart';

class App extends StatelessWidget {
  final String flavour;

  const App({Key? key, required this.flavour}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task6 flutter flavours',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(flavour),
        ),
        body: Column(
          children: [
            Center(
                child: ElevatedButton(
                    onPressed: () {}, child: const Text('Crash Btn')))
          ],
        ),
      ),
    );
  }
}
