import 'package:code_factory/model/courses_model.dart';
import 'package:flutter/material.dart';

class CoursesCard extends StatefulWidget {
  final CoursesModel coursesModel;
  final Function() onTap;
  final bool showPrice;
  const CoursesCard(this.coursesModel,
      {Key? key, required this.onTap, this.showPrice = true})
      : super(key: key);

  @override
  _CoursesCardState createState() => _CoursesCardState();
}

class _CoursesCardState extends State<CoursesCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Card(
          shape: RoundedRectangleBorder(
            side: const BorderSide(color: Color(0xFFBEBAB3)),
            borderRadius: BorderRadius.circular(15.0),
          ),
          margin: EdgeInsets.zero,
          elevation: 0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: widget.coursesModel.colorImage,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15))),
                child: Stack(
                  children: [
                    AspectRatio(
                      aspectRatio: 3.5 / 2,
                      child: Align(
                        alignment: Alignment.center,
                        child: Padding(
                            padding: _buildEdgeInsets(),
                            child: widget.coursesModel.image),
                      ),
                    ),
                    Positioned(
                      bottom: 8,
                      right: 16,
                      child: _buildTagPrice(),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 16, right: 16, top: 16, bottom: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.coursesModel.hours,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF5BA092),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      widget.coursesModel.title,
                      style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF3C3A36)),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      widget.coursesModel.subtitle,
                      style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF3C3A36)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTagPrice() {
    if (widget.showPrice == false) {
      return const SizedBox.shrink();
    }
    return Container(
      width: 58,
      height: 24,
      decoration: BoxDecoration(
          color: const Color(0xFF65AAEA),
          borderRadius: BorderRadius.circular(12)),
      child: Center(
        child: Text(
          widget.coursesModel.price,
          style: const TextStyle(
              color: Color(0xFFF2F2F2),
              fontSize: 14,
              fontWeight: FontWeight.w500),
        ),
      ),
    );
  }

  EdgeInsets _buildEdgeInsets() {
    if (widget.coursesModel.price == null) {
      return EdgeInsets.zero;
    }
    return const EdgeInsets.only(top: 16, bottom: 40);
  }
}
