import 'package:flutter/material.dart';

class Work extends StatefulWidget {
  const Work({super.key});

  @override
  State<Work> createState() {
    return _WorkState();
  }
}

class _WorkState extends State<Work> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 800,
      width: double.infinity,
      color: Colors.blue,
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 32.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.monitor,
                  size: 40,
                  color: Colors.white,
                ),
                const SizedBox(width: 8.0),
                Text(
                  'Projects',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 4.0),
                Text(
                  'Made',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.yellow,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
