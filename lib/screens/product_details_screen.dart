import 'package:code_factory/model/courses_model.dart';
import 'package:code_factory/widgets/custom_%20button_orange.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductDetail extends StatefulWidget {
  final CoursesModel coursesModel;

  const ProductDetail({Key? key, required this.coursesModel}) : super(key: key);

  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _body(),
    );
  }

  AppBar _appBar() {
    return AppBar(
      elevation: 0,
      centerTitle: true,
      title: Padding(
        padding: const EdgeInsets.only(top: 16),
        child: Text(
          widget.coursesModel.title,
          style: _textStyle(24, FontWeight.w500, null),
        ),
      ),
      backgroundColor: Colors.transparent,
      leading: Padding(
        padding: const EdgeInsets.only(left: 16, top: 16),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: SvgPicture.asset('assets/icons/back_button.svg'),
        ),
      ),
    );
  }

  Widget _body() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(
            flex: 2,
          ),
          _image(),
          const Spacer(flex: 1),
          Align(
            alignment: Alignment.centerRight,
            child: _buildTagPrice(),
          ),
          const Spacer(),
          Text(
            'About the course',
            style: _textStyle(24, FontWeight.w500, null),
          ),
          const SizedBox(height: 4),
          Text(widget.coursesModel.description,
              style: _textStyle(14, FontWeight.w400, 1.5)),
          const Spacer(flex: 1),
          Text(
            'Duration',
            style: _textStyle(24, FontWeight.w500, null),
          ),
          const SizedBox(height: 4),
          Text(
            widget.coursesModel.hours,
            style: _textStyle(14, FontWeight.w400, 1.5),
          ),
          const Spacer(flex: 3),
          _button(),
        ],
      ),
    );
  }

  TextStyle _textStyle(double size, FontWeight _weight, double? height) {
    return TextStyle(
      fontSize: size,
      fontWeight: _weight,
      color: const Color(0xFF3C3A36),
      height: height,
    );
  }

  Widget _image() {
    return AspectRatio(
      aspectRatio: 1.5,
      child: Align(
        alignment: Alignment.center,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fitHeight, image: widget.coursesModel.image.image),
          ),
        ),
      ),
    );
  }

  Widget _buildTagPrice() {
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

  Widget _button() {
    return FutureBuilder(
      future: _isSaved,
      initialData: false,
      builder: (context, snapshot) {
        String buttonTitle = "";
        if (snapshot.data == true) {
          buttonTitle = "Remove";
        } else {
          buttonTitle = "Save";
        }
        return OrangeButton(
          text: buttonTitle,
          onPressed: () async {
            final prefs = await SharedPreferences.getInstance();
            List<String>? listMyCourses = prefs.getStringList('listCourses');
            if (listMyCourses == null) {
              listMyCourses = [widget.coursesModel.id];
            } else if (listMyCourses.contains(widget.coursesModel.id)) {
              listMyCourses.remove(widget.coursesModel.id);
              print('removeu');
            } else {
              listMyCourses.add(widget.coursesModel.id);
              // _text = true;
              print('adicionou');
            }
            await prefs.setStringList('listCourses', listMyCourses);
            setState(() {
              // Navigator.of(context).push(MaterialPageRoute(
              //     builder: (context) => YourCourses()));
            });
            Navigator.of(context).pop();
          },
        );
      },
    );
  }

  Future<bool> get _isSaved async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? listMyCourses = prefs.getStringList('listCourses');
    if (listMyCourses != null &&
        listMyCourses.contains(widget.coursesModel.id)) {
      return true;
    }
    return false;
  }
}
