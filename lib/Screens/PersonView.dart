import 'package:flutter/material.dart';

class PersonView extends StatelessWidget {
  const PersonView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.sizeOf(context).height,
        padding: EdgeInsets.symmetric(vertical: 60, horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("Person"),
          ],
        ),
      ),
    );
    ;
  }
}
