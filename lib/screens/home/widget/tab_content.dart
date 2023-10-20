import 'package:flutter/material.dart';
import 'package:ircf/screens/home/bcls.dart';
import 'package:ircf/screens/home/cols.dart';

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
    return Stack(

      children: [
        widget.tabName == 'COLS Course'?
            Cols(
              name:widget.tabName,
              slug:widget.slug
            ):Bcls(
            name:widget.tabName,
            slug:widget.slug
        )
      ],
    );
  }
}
