import 'package:flutter/material.dart';

class Skills extends StatefulWidget {
  const Skills({super.key});

  @override
  State<Skills> createState() {
    return _SkillsState();
  }
}

class _SkillsState extends State<Skills> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 800,
      width: double.infinity,
      color: Colors.indigo,
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 16.0, bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.laptop_chromebook,
                  size: 40,
                  color: Colors.white,
                ),
                SizedBox(width: 8.0),
                Text(
                  'Skills & ',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'Abilities',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.yellow,
                  ),
                ),
              ],
            ),
          ),
          Card(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 256.0),
              height: 40,
              width: MediaQuery.of(context).size.width * 0.8,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
