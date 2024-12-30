import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:visibility_detector/visibility_detector.dart';

class Education extends StatefulWidget {
  const Education({super.key});

  @override
  State<Education> createState() {
    return _EducationState();
  }
}

class _EducationState extends State<Education> with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final CurvedAnimation _animation;
  late final Animation<Offset> _offsetanimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.fastOutSlowIn,
    );
    _offsetanimation = Tween(begin: const Offset(1.5, 0.0), end: Offset.zero)
        .animate(_animation);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 800,
      width: double.infinity,
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.school,
                  size: 40,
                ),
                SizedBox(width: 8.0),
                Text(
                  'My',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 4.0),
                Text(
                  'Education',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple,
                  ),
                ),
              ],
            ),
          ),
          const Text(
            'Education is not the learning of facts, but the training of the mind to think.',
          ),
          VisibilityDetector(
            key: const Key('education-card'),
            onVisibilityChanged: (info) {
              if (info.visibleFraction == 1) {
                Logger().i('Education card is visible');
                _controller.forward();
              } else {
                Logger().i('Education card is not visible');
                _controller.reverse();
              }
            },
            child: SlideTransition(
              position: _offsetanimation,
              child: Card(
                elevation: 10,
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  width: 800,
                  child: Row(
                    children: [
                      Image.asset(
                        'images/mbstu.png',
                        height: 100,
                        width: 100,
                      ),
                      const SizedBox(width: 16.0),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Bachelor of Engineering in Computer Science and Engineering',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                              'Mawlana Bhashani Science & Technology University'),
                          SizedBox(height: 8.0),
                          Text(
                            '2022-Present | Pursuing',
                            style: TextStyle(
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
