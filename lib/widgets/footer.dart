import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 100,
        width: double.infinity,
        color: Colors.grey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text('Sabbir\' Portfolio'),
                    Text('Made with Flutter'),
                    Text('Connect with me on:'),
                  ],
                ),
                Column(
                  children: [
                    Text('Quick Links'),
                  ],
                ),
                Column(
                  children: [
                    Text('Contact Info'),
                    Row(
                      children: [
                        Icon(Icons.email),
                        Text('Email'),
                      ],
                    )
                  ],
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Footer'),
                const Text('© Sabbir Hasan 2021'),
              ],
            )
          ],
        ));
  }
}
