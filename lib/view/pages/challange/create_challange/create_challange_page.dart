import 'package:flutter/material.dart';


class CreateChallangePage extends StatefulWidget {
  const CreateChallangePage({Key? key}) : super(key: key);

  @override
  State<CreateChallangePage> createState() => _CreateChallangePageState();
}

class _CreateChallangePageState extends State<CreateChallangePage> {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
     body: Container(
        alignment: Alignment.center,
        child: Text("CreateChallangePage"),
      ),
    );
  }
}