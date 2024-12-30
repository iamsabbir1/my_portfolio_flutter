import 'package:flutter/material.dart';

class NavbarItem extends StatefulWidget {
  bool isHovering;
  final String title;
  final Function scrollToSection;
  NavbarItem({
    super.key,
    required this.isHovering,
    required this.scrollToSection,
    required this.title,
  });

  @override
  State<NavbarItem> createState() => _NavbarItemState();
}

class _NavbarItemState extends State<NavbarItem> {
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
