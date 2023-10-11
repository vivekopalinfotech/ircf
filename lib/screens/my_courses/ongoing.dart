import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ircf/color/app_color.dart';
import 'package:ircf/constants/app_constants.dart';

class Ongoing extends StatefulWidget {
  const Ongoing({super.key});

  @override
  State<Ongoing> createState() => _OngoingState();
}

class _OngoingState extends State<Ongoing> {
  bool isSaved = false;

  toggelButton() async {
    setState(() {
      isSaved = !isSaved;
    });
  }

  List<Category> filterCat = [
    Category('COLS', 'Compression-Only Life Support', 93, 125, 0.74, AppColor.tealColor, '3 Hrs 06 Mins'),
    Category('BCLS', 'Basic Cardiopulmonary Life Support ', 12, 31, 0.38, AppColor.progressColor, '1 Hrs 58 Mins'),
    Category('CCLS', 'Comprehensive Cardiopulmonary Life Support', 56, 98, 0.57, AppColor.activeColor, '2 Hrs 46 Mins'),
    Category('BCLS Instructor', 'Basic Cardiopulmonary Life Support', 29, 35, 0.82, AppColor.progressColor, '1 Hrs 58 Mins'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.whiteBG,
        body: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: AppConstants.HORIZONTAL_PADDING,vertical: 17),
            itemCount: filterCat.length,
            itemBuilder: (context, index) {
              return Card(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  elevation: 4,
                  shape: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
                  color: Colors.white,
                  child: Row(
                    children: [
                      Container(
                        height: 130,
                        width: 130,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(16),
                              bottomLeft: Radius.circular(16),
                            ),
                            color: Colors.black),
                      ),
                      Flexible(
                          child: Padding(
                        padding: const EdgeInsets.all(14),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              filterCat[index].name,
                              textScaleFactor: 1,
                              style: GoogleFonts.mulish(fontSize: AppConstants.XSMALL, fontWeight: FontWeight.bold, color: AppColor.activeColor),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              filterCat[index].title,
                              textScaleFactor: 1,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: GoogleFonts.jost(fontSize: AppConstants.MEDIUM, fontWeight: FontWeight.w500, color: AppColor.textColor),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10, bottom: 14),
                              child: Text(
                                ' ${filterCat[index].time}',
                                style: GoogleFonts.mulish(fontSize: 11, fontWeight: FontWeight.bold, color: AppColor.textColor),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const SizedBox(),
                                Flexible(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(color: AppColor.secondaryColor),
                                    ),
                                    padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 1),
                                    child: LinearProgressIndicator(
                                      backgroundColor: AppColor.whiteBG,
                                      valueColor: AlwaysStoppedAnimation<Color>(filterCat[index].color),
                                      value: filterCat[index].value,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 18,
                                ),
                                Text(
                                  '${(filterCat[index].progressValue).round()}/${(filterCat[index].totalValue).round()}',
                                  style: GoogleFonts.mulish(fontSize: 11, fontWeight: FontWeight.bold, color: AppColor.textColor),
                                ),
                              ],
                            )
                          ],
                        ),
                      ))
                    ],
                  ));
            }));
  }
}

class Category {
  final String name;
  final String title;
  final double progressValue;
  final double totalValue;
  final double value;
  final Color color;
  final String time;

  Category(this.name, this.title, this.progressValue, this.totalValue, this.value, this.color, this.time);
}
