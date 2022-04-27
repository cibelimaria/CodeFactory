import 'package:code_factory/card/course_card.dart';
import 'package:code_factory/model/courses_model.dart';
import 'package:code_factory/screens/product_details_screen.dart';
import 'package:code_factory/widgets/search_text_field_courses.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchCoursesScreen extends StatefulWidget {
  final List<CoursesModel> courses;

  const SearchCoursesScreen({
    Key? key,
    required this.courses,
  }) : super(key: key);

  @override
  _SearchCoursesScreenState createState() => _SearchCoursesScreenState();
}

class _SearchCoursesScreenState extends State<SearchCoursesScreen> {
  // List<CoursesModel> _filteredCourses = [];
  late List<CoursesModel> _filteredCourses;

  @override
  void initState() {
    _filteredCourses = widget.courses;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _body(),
    );
  }

  AppBar _appBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      toolbarHeight: 80,
      leading: Padding(
        padding: const EdgeInsets.only(left: 16, top: 20),
        child: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: SvgPicture.asset('assets/icons/back_button.svg')),
      ),
      title: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: _searchTextField(),
      ),
    );
  }

  Widget _searchTextField() {
    return SearchTextField(
      onSearch: (searchText) {
        print(searchText);

        List<CoursesModel> filteredList;

        if (searchText.isNotEmpty) {
          filteredList = widget.courses.where((course) {
            if (course.title.toLowerCase().contains(searchText.toLowerCase())) {
              return true;
            }
            return false;
          }).toList();
        } else {
          // return Center(
          //   child: Image.asset('assets/images/ui_courses.png'),
          // );
          filteredList = widget.courses;
        }

        if (searchText.isEmpty) {
          return Center(
            child: Image.asset('assets/images/ui_courses.png'),
          );
        }

        setState(() {
          _filteredCourses = filteredList;
        });
      },
    );
  }

  Widget _body() {
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      const SizedBox(height: 16),
      Padding(
        padding: const EdgeInsets.only(left: 16),
        child: Text(
          ' ${_filteredCourses.length} Results',
          style: const TextStyle(
              color: Color(0xFF3C3A36),
              fontSize: 24,
              fontWeight: FontWeight.w500),
        ),
      ),
      Expanded(child: _listCourses()),
    ]);
  }

  Widget _listCourses() {
    // if(){
    //
    // }
    return Container(
      margin: const EdgeInsets.all(16),
      child: ListView(
        children: _filteredCourses.map((course) {
          return CoursesCard(
            course,
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ProductDetail(coursesModel: course)));
            },
          );
        }).toList(),
      ),
    );
  }
}
