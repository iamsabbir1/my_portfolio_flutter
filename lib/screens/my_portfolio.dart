import 'package:flutter/material.dart';
import 'package:my_portfolio/widgets/education.dart';
import 'package:my_portfolio/widgets/footer.dart';
import 'package:my_portfolio/widgets/work.dart';

//widgets
import '../widgets/navbar_item.dart';
import '../widgets/home.dart';
import '../widgets/contact.dart';
import '../widgets/about.dart';
import '../widgets/skills.dart';

class MyPortfolio extends StatefulWidget {
  const MyPortfolio({super.key});

  @override
  State<MyPortfolio> createState() => _MyPortfolioState();
}

class _MyPortfolioState extends State<MyPortfolio> {
  bool _isTitleHovering = false;
  bool _isHomeHovering = false;
  bool _isAboutHovering = false;
  bool _isEducationHovering = false;
  bool _isContactHovering = false;
  String _currentSection = 'Home';

  final ScrollController _scrollController = ScrollController();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _homeKey = GlobalKey();
  final GlobalKey _educationKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  void _scrollToSection(GlobalKey key, String section) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(context, duration: const Duration(seconds: 1));
    }
    setState(() {
      _currentSection = section;
    });
  }

  void _scrollToAbout() {
    final context = _aboutKey.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(context, duration: const Duration(seconds: 1));
    }
  }

  void _scrollToHome() {
    final context = _homeKey.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(context, duration: const Duration(seconds: 1));
    }
  }

  void _scrollToEducation() {
    final context = _educationKey.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(context, duration: const Duration(seconds: 1));
    }
  }

  void _scrollToContact() {
    final context = _contactKey.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(context, duration: const Duration(seconds: 1));
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: MouseRegion(
          onEnter: (event) {
            setState(() {
              _isTitleHovering = true;
            });
          },
          onExit: (event) {
            setState(() {
              _isTitleHovering = false;
            });
          },
          child: Text(
            'Sabbir Hasan',
            style: TextStyle(
              color: _isTitleHovering ? Colors.yellow : Colors.white,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 32.0),
            child: Row(
              children: [
                NavbarItem(
                  isHovering: _isHomeHovering,
                  scrollToSection: _scrollToSection,
                  title: 'Home',
                ),
                NavbarItem(
                  isHovering: _isEducationHovering,
                  scrollToSection: _scrollToEducation,
                  title: 'Education',
                ),
                NavbarItem(
                  isHovering: _isContactHovering,
                  scrollToSection: _scrollToContact,
                  title: 'Contact',
                )
              ],
            ),
          )
        ],
        backgroundColor: const Color.fromARGB(207, 49, 189, 142),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Home(
              aboutKey: _homeKey,
              height: height,
              title: 'Home',
              color: const Color.fromARGB(235, 60, 234, 60),
            ),
            const About(),
            const Skills(),
            const Education(),
            const Work(),
            Contact(
              contactKey: _contactKey,
              height: height,
              title: 'Contact',
              color: const Color.fromARGB(255, 255, 255, 255),
            ),
            const Footer(),
          ],
        ),
      ),
      floatingActionButton: Row(
        children: [
          const Spacer(),
          FloatingActionButton(
            onPressed: () {
              _scrollController.animateTo(
                0,
                duration: const Duration(seconds: 1),
                curve: Curves.easeInOut,
              );
            },
            child: const Icon(Icons.arrow_upward),
          ),
          const SizedBox(width: 16.0),
          FloatingActionButton(
            onPressed: () {},
            child: const Icon(Icons.star),
          )
        ],
      ),
    );
  }
}
