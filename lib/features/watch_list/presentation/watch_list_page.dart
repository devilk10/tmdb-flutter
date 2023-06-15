import 'package:flutter/material.dart';

class WatchList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("WatchList"), actions: []),
      body: const Center(
        child: Text("This will show you liked movies"),
      ),
    );
  }
}
