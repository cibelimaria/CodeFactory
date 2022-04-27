import 'package:carousel_slider/carousel_slider.dart';
import 'package:code_factory/card/card_carousel_intro.dart';
import 'package:code_factory/screens/login_screen.dart';
import 'package:code_factory/widgets/custom_%20button_orange.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Intro extends StatefulWidget {
  const Intro({Key? key}) : super(key: key);

  @override
  _IntroState createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  final buttonCarouselController = CarouselController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _body(),
    );
  }

  Widget _body() {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Expanded(child: SizedBox.shrink()),
          _carouselSlider(),
          Center(child: _buildIndicator()),
          const Expanded(child: SizedBox.shrink()),
          _button(),
        ],
      ),
    );
  }

  Widget _carouselSlider() {
    return CarouselSlider(
      carouselController: buttonCarouselController,
      items: const [
        CardCarousel(
          image: 'assets/images/intro1.png',
          text: 'Learn anytime and anywhere',
        ),
        CardCarousel(
          image: 'assets/images/intro2.png',
          text: 'Find a course for you',
        ),
        CardCarousel(
          image: 'assets/images/intro3.png',
          text: 'Improve your skills',
        )
      ],
      options: CarouselOptions(
        scrollPhysics: const NeverScrollableScrollPhysics(),
        onPageChanged: (index, reason) {
          setState(() {
            _currentIndex = index;
          });
        },
        aspectRatio: 16 / 18,
        enlargeCenterPage: true,
        enableInfiniteScroll: false,
        viewportFraction: 1,
      ),
    );
  }

  Widget _buildIndicator() {
    return AnimatedSmoothIndicator(
      activeIndex: _currentIndex,
      count: 3,
      effect: const ExpandingDotsEffect(
        dotHeight: 6,
        dotWidth: 6,
        activeDotColor: Color(0xFF65AAEA),
        dotColor: Color(0xFFD5D4D4),
      ),
    );
  }

  Widget _button() {
    return Padding(
      padding: const EdgeInsets.only(left: 32, right: 32, bottom: 50),
      child: OrangeButton(
        onPressed: () {
          if (_currentIndex == 0 || _currentIndex == 1) {
            return buttonCarouselController.nextPage();
          }
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => const Login()));
        },
        text: _buttonTitle,
      ),
    );
  }

  String get _buttonTitle {
    if (_currentIndex == 0 || _currentIndex == 1) {
      return 'Next';
    } else {
      return 'Let’s Start';
    }
  }
}
