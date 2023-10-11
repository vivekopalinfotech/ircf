import 'package:flutter/material.dart';
import 'package:ircf/color/app_color.dart';

class ListingDetail extends StatefulWidget {
  const ListingDetail({super.key});

  @override
  State<ListingDetail> createState() => _ListingDetailState();
}

class _ListingDetailState extends State<ListingDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteBG,
    );
  }
}
