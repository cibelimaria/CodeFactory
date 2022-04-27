import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SearchTextField extends StatefulWidget {
  final Function(String) onSearch;

  const SearchTextField({
    Key? key,
    required this.onSearch,
  }) : super(key: key);

  @override
  _SearchTextFieldState createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  final _searchController = TextEditingController();
  final _focusNode = FocusNode();

  @override
  void initState() {
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) _searchController.clear();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xFFBEBAB3))),
      child: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: TextField(
          focusNode: _focusNode,
          onChanged: (text) {
            widget.onSearch(text);
          },
          // onChanged: widget.onSearch,
          autofocus: true,
          controller: _searchController,
          decoration: InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.never,
            suffixIcon: Padding(
              padding: const EdgeInsets.all(16),
              child: SvgPicture.asset(
                'assets/icons/search.svg',
              ),
            ),
            labelStyle: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color(0xFF78746D)),
            labelText: 'Search course ',
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
