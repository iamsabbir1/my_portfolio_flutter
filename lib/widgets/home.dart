import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:logger/logger.dart';

import 'package:url_launcher/url_launcher.dart';

class Home extends StatelessWidget {
  final GlobalKey aboutKey;
  final double height;
  final String title;
  final Color color;
  const Home({
    super.key,
    required this.aboutKey,
    required this.height,
    required this.title,
    required this.color,
  });
  @override
  Widget build(BuildContext context) {
    void _launchURL(Uri url) async {
      try {
        await launchUrl(url);
      } catch (e) {
        Logger().e(e);
      }
    }

    return Container(
      key: aboutKey,
      height: height * 0.925,
      width: double.infinity,
      // color: color,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: [
            const SizedBox(width: 16.0),
            Expanded(
              child: Container(
                height: height * 0.8,
                width: double.infinity,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 64.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Hi there,',
                        style: TextStyle(
                          fontSize: 64.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Row(
                        children: [
                          Text(
                            'I\'m Sabbir ',
                            style: TextStyle(
                              fontSize: 64,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Hasan',
                            style: TextStyle(
                              fontSize: 64.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 16.0),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 4.0),
                            child: const Text(
                              'I Am Into ',
                              style: TextStyle(
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          AnimatedTextKit(
                            animatedTexts: [
                              TypewriterAnimatedText(
                                'Flutter Development',
                                textStyle: const TextStyle(
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red,
                                ),
                                speed: const Duration(milliseconds: 100),
                                cursor: '|',
                              ),
                              TypewriterAnimatedText(
                                'Web Development',
                                textStyle: const TextStyle(
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red,
                                ),
                                speed: const Duration(milliseconds: 100),
                                cursor: '|',
                              ),
                              TypewriterAnimatedText(
                                'Mobile App Development',
                                textStyle: const TextStyle(
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red,
                                ),
                                speed: const Duration(milliseconds: 100),
                                cursor: '|',
                              ),
                            ],
                            repeatForever: true,
                          ),
                        ],
                      ),
                      const SizedBox(height: 16.0),
                      ElevatedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.arrow_downward),
                        label: const Text('About Me'),
                        iconAlignment: IconAlignment.end,
                      ),
                      const SizedBox(height: 16.0),
                      Row(
                        children: [
                          ElevatedButton.icon(
                            onPressed: () {
                              //go to facebook.com
                              _launchURL(Uri.parse('https://www.facebook.com'));
                            },
                            style: ElevatedButton.styleFrom(
                              shape: const CircleBorder(),
                              padding: const EdgeInsets.all(20.0),
                              minimumSize: const Size(60, 60),
                            ),
                            label: const Icon(
                              Icons.facebook,
                            ),
                          ),
                          const SizedBox(width: 2.0),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              shape: const CircleBorder(),
                              padding: const EdgeInsets.all(20.0),
                              minimumSize: const Size(60, 60),
                            ),
                            child: const Icon(
                              FontAwesomeIcons.linkedin,
                            ),
                          ),
                          const SizedBox(width: 2.0),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              shape: const CircleBorder(),
                              padding: const EdgeInsets.all(20.0),
                              minimumSize: const Size(60, 60),
                            ),
                            child: const Icon(
                              LineAwesomeIcons.twitter,
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              shape: const CircleBorder(),
                              padding: const EdgeInsets.all(20.0),
                              minimumSize: const Size(60, 60),
                            ),
                            child: const Icon(LineAwesomeIcons.github),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16.0),
            Expanded(
              child: SizedBox(
                height: height * 0.8,
                width: double.infinity,
                child: const Center(
                  child: CircleAvatar(
                    radius: 200.0,
                    backgroundImage: AssetImage('images/contacts.png'),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16.0),
          ],
        ),
      ),
    );
  }
}
