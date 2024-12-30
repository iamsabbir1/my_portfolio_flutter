import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:visibility_detector/visibility_detector.dart';

class Contact extends StatefulWidget {
  final double height;
  final Color color;
  final String title;
  final GlobalKey contactKey;

  const Contact({
    super.key,
    required this.height,
    required this.color,
    required this.title,
    required this.contactKey,
  });

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> with TickerProviderStateMixin {
  bool _isImageVisible = false;
  late final AnimationController _controller;
  late final CurvedAnimation _animation;

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
    Future.delayed(const Duration(milliseconds: 1000), () {
      setState(() {
        _isImageVisible = true;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      key: widget.contactKey,
      height: widget.height * 0.925,
      width: double.infinity,
      color: widget.color,
      child: Center(
        child: SizedBox(
            height: 600,
            width: 900,
            child: Column(
              children: [
                const Text(
                  'Contact Me',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                Expanded(
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 10,
                    child: VisibilityDetector(
                      onVisibilityChanged: (info) {
                        if (info.visibleFraction == 1) {
                          Logger().i('Contact Image is visible');
                          _controller.forward();
                        } else {
                          _controller.reverse();
                        }
                      },
                      key: const Key('contact_image'),
                      child: Row(
                        children: [
                          SizeTransition(
                            sizeFactor: _animation,
                            axis: Axis.vertical,
                            axisAlignment: -1,
                            child: Container(
                              height: 600,
                              width: 400,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('images/contacts.png'),
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 40),
                              child: Form(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    TextFormField(
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10),
                                          ),
                                        ),
                                        hintText: 'Name',
                                        counterText: '',
                                      ),
                                      cursorHeight: 20,
                                      maxLength: 50,
                                      //hide max lenth counter
                                    ),
                                    const SizedBox(height: 16),
                                    TextFormField(
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10),
                                          ),
                                        ),
                                        hintText: 'Email',
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                    TextFormField(
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10),
                                          ),
                                        ),
                                        counterText: '',
                                        hintText: 'Phone',
                                      ),
                                      maxLength: 20,
                                    ),
                                    const SizedBox(height: 16),
                                    TextFormField(
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10),
                                          ),
                                        ),
                                        hintText: 'Message',
                                      ),
                                      maxLines: 5,
                                    ),
                                    const SizedBox(height: 16),
                                    Row(
                                      children: [
                                        const Spacer(),
                                        ElevatedButton(
                                          onPressed: () {},
                                          style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            minimumSize: const Size(
                                              100,
                                              45,
                                            ),
                                          ),
                                          child: const Text(
                                            'Send',
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )),
      ),
      // child: Padding(
      //   padding: const EdgeInsets.symmetric(vertical: 8.0),
      //   child: Row(
      //     crossAxisAlignment: CrossAxisAlignment.center,
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       Expanded(
      //         child: Container(
      //           height: height * 0.5,
      //           width: double.infinity,
      //           decoration: const BoxDecoration(
      //             image: DecorationImage(
      //               image: AssetImage('images/contacts.png'),
      //               fit: BoxFit.contain,
      //             ),
      //           ),
      //         ),
      //       ),
      //       Expanded(
      //         child: Card(
      //           shape: BeveledRectangleBorder(
      //             borderRadius: BorderRadius.circular(10),
      //           ),
      //           elevation: 10,
      //           child: Form(
      //             child: Padding(
      //               padding: const EdgeInsets.symmetric(horizontal: 16.0),
      //               child: Column(
      //                 mainAxisAlignment: MainAxisAlignment.center,
      //                 children: [
      //                   const Text('Contact Me'),
      //                   TextFormField(
      //                     decoration: const InputDecoration(
      //                       labelText: 'Name',
      //                     ),
      //                   ),
      //                   TextFormField(
      //                     decoration: const InputDecoration(
      //                       labelText: 'Email',
      //                     ),
      //                   ),
      //                   TextFormField(
      //                     decoration: const InputDecoration(
      //                       labelText: 'Subject',
      //                     ),
      //                     maxLines: 1,
      //                   ),
      //                   TextFormField(
      //                     decoration: const InputDecoration(
      //                       labelText: 'Message',
      //                       labelStyle: TextStyle(),
      //                       alignLabelWithHint: true,
      //                     ),
      //                     maxLines: 5,
      //                   ),
      //                 ],
      //               ),
      //             ),
      //           ),
      //         ),
      //       ),
      //       const SizedBox(
      //         width: 16.0,
      //       )
      //     ],
      //   ),
      // ),
    );
  }
}

class ContactPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.stroke;
    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width, size.height)
      ..moveTo(size.width, 0)
      ..lineTo(0, size.height);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
