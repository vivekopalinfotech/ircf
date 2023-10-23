import 'package:flutter/material.dart';

import 'package:ircf/screens/home/course_category.dart';

class TabContent extends StatefulWidget {
  final String tabName;
  final String slug;
  const TabContent({super.key, required this.tabName, required this.slug});

  @override
  State<TabContent> createState() => _TabContentState();
}

class _TabContentState extends State<TabContent> {
  @override
  Widget build(BuildContext context) {
    return CourseCategory(
      name: widget.tabName,
      slug:widget.slug);
  }
}
