import 'package:flutter/material.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 100.0,
          height: 100.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            image: DecorationImage(
              image: NetworkImage(
                'https://techcrunch.com/2023/06/16/nasa-hits-up-7-space-companies-to-take-on-orbital-squad-goals/'
              ), fit: BoxFit.cover
            )
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("TITLE"),
            Text("DetialsDetialsDetialsDetialsDeDetials"),
            Text("DATE"),
          ],
        )
      ],
    );
  }
}
