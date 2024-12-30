import 'package:flutter/material.dart';

class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() {
    return _AboutState();
  }
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 800,
      width: double.infinity,
      color: Colors.grey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 32.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.person,
                  size: 40,
                ),
                SizedBox(width: 8.0),
                Text(
                  'About ',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Me',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Card(
                child: SizedBox(
                  height: 400,
                  width: 400,
                ),
              ),
              const SizedBox(width: 80.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Sabbir Hasan',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    'Flutter Developer',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const Text(
                      'I am a flutter developer with 2 years of experience.'),
                  const SizedBox(
                    height: 12,
                  ),
                  const Row(
                    children: [
                      Text('Email:'),
                      Text('sabbir@gmail.com'),
                    ],
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  const Row(
                    children: [
                      Text('Phone:'),
                      Text('01712345678'),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        minimumSize: const Size(100, 50)),
                    icon: const Icon(Icons.arrow_right),
                    iconAlignment: IconAlignment.end,
                    label: const Text(
                      'Resume',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () {},
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
