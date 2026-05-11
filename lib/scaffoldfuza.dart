import 'package:flutter/material.dart';

class ScaffoldDay7 extends StatelessWidget {
  const ScaffoldDay7({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 74, 3, 155),
      appBar: AppBar(
        actions: [Text("Login")],
        centerTitle: true,

        title: Text("Score-GG"),
      ),
      body: Text("M.Dini Afuza"),
    );
  }
}