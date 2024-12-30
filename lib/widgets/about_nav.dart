import 'package:flutter/material.dart';

class AboutNav extends StatefulWidget {
  bool isHovering;
  final String title;
  final Function scrollToSection;
  AboutNav({
    super.key,
    required this.isHovering,
    required this.title,
    required this.scrollToSection,
  });

  @override
  State<AboutNav> createState() => _AboutNavState();
}

class _AboutNavState extends State<AboutNav> {
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (event) {
        setState(() {
          widget.isHovering = true;
        });
      },
      onExit: (event) {
        setState(() {
          widget.isHovering = false;
        });
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: TextButton(
          onPressed: () {
            widget.scrollToSection();
          },
          child: Text(
            widget.title,
            style: TextStyle(
              color: widget.isHovering ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
