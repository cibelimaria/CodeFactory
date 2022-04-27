import 'package:code_factory/card/course_card.dart';
import 'package:code_factory/model/courses_model.dart';
import 'package:code_factory/screens/product_details_screen.dart';
import 'package:code_factory/screens/search_courses_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CoursesScreen extends StatefulWidget {
  const CoursesScreen({Key? key}) : super(key: key);

  @override
  _CoursesScreenState createState() => _CoursesScreenState();
}

class _CoursesScreenState extends State<CoursesScreen> {
  final List<CoursesModel> _courses = [
    CoursesModel(
        Image.asset('assets/images/ui_courses.png'),
        const Color(0xFFF8F2EE),
        '3 h 30 min ',
        'UI',
        'Advanced mobile interface design',
        '\$50',
        'You can launch a new career in web develop-ment today by learning HTML & CSS. You don\'t need a computer science degree or expensive software. All you need is a computer, a bit of time, a lot of determination, and a teacher you trust.',
        '1'),
    CoursesModel(
        Image.asset('assets/images/flutter_courses.png'),
        const Color(0xFFE6EDF4),
        '3 h 30 min',
        'Flutter',
        'Advanced web applications',
        '\$70',
        'You can launch a new career in web develop-ment today by learning HTML & CSS. You don\'t need a computer science degree or expensive software. All you need is a computer, a bit of time, a lot of determination, and a teacher you trust.',
        '2'),
    CoursesModel(
        Image.asset('assets/images/swift_courses.png'),
        const Color(0xFFF8F2EE),
        '1 h 20 min',
        'Swift',
        'Advanced iOS apps',
        '\$50',
        'You can launch a new career in web develop-ment today by learning HTML & CSS. You don\'t need a computer science degree or expensive software. All you need is a computer, a bit of time, a lot of determination, and a teacher you trust.',
        '3'),
    CoursesModel(
        Image.asset('assets/images/ui_avanced_ courses.png'),
        const Color(0xFFE6EDF4),
        '3 h 30 min',
        'UI Avanced',
        'Advanced mobile interface design',
        '\$50',
        'You can launch a new career in web develop-ment today by learning HTML & CSS. You don\'t need a computer science degree or expensive software. All you need is a computer, a bit of time, a lot of determination, and a teacher you trust.',
        '4'),
    CoursesModel(
        Image.asset('assets/images/html_courses.png'),
        const Color(0xFFF8F2EE),
        '1 h 30 min',
        'HTML',
        'Advanced web applications',
        '\$50',
        'You can launch a new career in web develop-ment today by learning HTML & CSS. You don\'t need a computer science degree or expensive software. All you need is a computer, a bit of time, a lot of determination, and a teacher you trust.',
        '5'),
    CoursesModel(
        Image.asset('assets/images/scrum_courses.png'),
        const Color(0xFFE6EDF4),
        '1 h 20 min',
        'Scrum',
        'Advanced project organization course',
        '\$50',
        'You can launch a new career in web develop-ment today by learning HTML & CSS. You don\'t need a computer science degree or expensive software. All you need is a computer, a bit of time, a lot of determination, and a teacher you trust.',
        '6'),
  ];

  List<String> _myCourses = [];
  bool _showOnlyMyCourses = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _body(),
    );
  }

  AppBar _appBar() {
    return AppBar(
      toolbarHeight: 80,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Padding(
        padding: const EdgeInsets.only(top: 24),
        child: SizedBox(
          height: 72,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _textAppBar(
                  'Hello,', const Color(0xFF3C3A36), 16, FontWeight.w400),
              _textAppBar('Juana Antonieta', const Color(0xFF333333), 32,
                  FontWeight.w700)
            ],
          ),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(top: 16, right: 16),
          child: GestureDetector(
            onTap: () async {
              print('chegou aqui');
              final prefs = await SharedPreferences.getInstance();
              _myCourses = prefs.getStringList('listCourses') ?? [];
              setState(() {
                _showOnlyMyCourses = !_showOnlyMyCourses;
              });
            },
            child: SvgPicture.asset('assets/icons/notifications.svg'),
          ),
        ),
      ],
    );
  }

  Widget _textAppBar(
      String title, Color color, double fontSize, FontWeight fontWeight) {
    return Text(
      title,
      style:
          TextStyle(color: color, fontSize: fontSize, fontWeight: fontWeight),
    );
  }

  Widget _body() {
    return Container(
      margin: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _search(),
          const SizedBox(height: 12),
          _categoryTags(),
          const SizedBox(height: 12),
          _listCourses(),
        ],
      ),
    );
  }

  Widget _search() {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => SearchCoursesScreen(courses: _courses)));
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color(0xFFBEBAB3))),
        child: ListTile(
          title: const Text('Search Courses',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF78746D))),
          trailing: Padding(
            padding: const EdgeInsets.all(16),
            child: SvgPicture.asset(
              'assets/icons/search.svg',
            ),
          ),
        ),
      ),
    );
  }

  Widget _categoryTags() {
    return SizedBox(
      height: 24,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          const Center(
            child: Text(
              'Category: ',
              style: TextStyle(
                color: Color(0xFF3C3A36),
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          const SizedBox(width: 16),
          _tag(() => null, '#CSS'),
          _tag(() => null, '#UX'),
          _tag(() => null, '#SWIFT'),
          _tag(() => null, '#FLUTTER'),
          _tag(() => null, '#HTML'),
          _tag(() => null, '#SCRUM'),
        ],
      ),
    );
  }

  Widget _tag(Function() onTap, String nameTag) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 11),
        decoration: BoxDecoration(
            color: const Color(0xFF65AAEA),
            borderRadius: BorderRadius.circular(12)),
        height: 24,
        child: GestureDetector(
          onTap: () => onTap(),
          child: Center(
            child: Text(
              nameTag,
              style: const TextStyle(
                  color: Color(0xFFF2F2F2),
                  fontSize: 12,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ),
    );
  }

  Widget _listCourses() {
    List<CoursesModel> filtered = _courses;
    if (_showOnlyMyCourses == true) {
      print('XXX');
      filtered = filtered.where((course) {
        if (_myCourses.contains(course.id)) {
          return true;
        }
        return false;
      }).toList();
    }
    return Expanded(
      child: ListView(
        children: filtered.map((course) {
          return CoursesCard(
            course,
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ProductDetail(coursesModel: course)));
            },
            showPrice: !_showOnlyMyCourses,
          );
        }).toList(),
      ),
    );
  }
}
