import 'package:flutter/material.dart';

class CardCarousel extends StatelessWidget {
  final String image;
  final String text;

  const CardCarousel({
    Key? key,
    required this.image,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Column(
        children: [
          Image.asset(image),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        text,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF3C3A36),
                        ),
                        maxLines: 2,
                        softWrap: true,
                        textWidthBasis: TextWidthBasis.longestLine,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Expanded(
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        'Quarantine is the perfect time to spend your day learning something new, from anywhere!',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF78746D),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
