import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class SectionContainer extends StatefulWidget {
  final GlobalKey aboutKey;
  final double height;
  final String title;
  final Color color;

  const SectionContainer({
    super.key,
    required this.aboutKey,
    required this.height,
    required this.title,
    required this.color,
  });

  @override
  State<SectionContainer> createState() => _SectionContainerState();
}

class _SectionContainerState extends State<SectionContainer> {
  int _rating = 0;
  bool _isStarVisible = false;

  void _setRating(int rating) {
    setState(() {
      _rating = rating;
    });
    Logger().i('Rating: $_rating');
  }

  void addRating() async {
    try {
      // Add your rating submission logic here
    } catch (e) {
      Logger().i(e);
    }
  }

  @override
  void initState() {
    super.initState();
    // Delay the visibility of the star to trigger the animation
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _isStarVisible = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          key: widget.aboutKey,
          height: widget.height * 0.925,
          width: double.infinity,
          color: widget.color,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(widget.title),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 16.0,
          right: 16.0,
          child: TweenAnimationBuilder(
            tween: Tween<Offset>(
              begin: const Offset(0, 50),
              end: const Offset(0, 0),
            ),
            duration: const Duration(milliseconds: 500),
            builder: (context, Offset offset, child) {
              return Transform.translate(
                offset: offset,
                child: AnimatedOpacity(
                  opacity: _isStarVisible ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 500),
                  child: FloatingActionButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          int tempRating = _rating;
                          return StatefulBuilder(
                            builder: (context, setState) {
                              return AlertDialog(
                                title: const Text('Rate this section'),
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'How easy was it to find the information you were looking for on the Home page?',
                                    ),
                                    const TextField(
                                      decoration: InputDecoration(
                                        hintText: 'Your answer',
                                      ),
                                    ),
                                    const SizedBox(height: 12.0),
                                    const Text(
                                      'Does the layout of the Home page feel clean and inviting?',
                                    ),
                                    const TextField(
                                      decoration: InputDecoration(
                                        hintText: 'Your answer',
                                      ),
                                    ),
                                    const SizedBox(height: 12.0),
                                    const Text(
                                      'Is the page visually engaging without feeling overwhelming?',
                                    ),
                                    const TextField(
                                      decoration: InputDecoration(
                                        hintText: 'Your answer',
                                      ),
                                    ),
                                    const SizedBox(height: 12.0),
                                    const Text(
                                        'Does the navigation from the Home page to other sections feel intuitive?'),
                                    const TextField(
                                      decoration: InputDecoration(
                                        hintText: 'Your answer',
                                      ),
                                    ),
                                    const SizedBox(height: 12.0),
                                    const Text(
                                        'Rate the overall experience of the Home page'),
                                    Row(
                                      children: List.generate(10, (index) {
                                        return GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              tempRating = index + 1;
                                            });
                                          },
                                          child: Icon(
                                            index < tempRating
                                                ? Icons.star
                                                : Icons.star_border,
                                            color: Colors.black,
                                          ),
                                        );
                                      }),
                                    ),
                                  ],
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('Cancel'),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      _setRating(tempRating);
                                      addRating();
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('Submit'),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      );
                    },
                    child: const Icon(Icons.star_border),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
