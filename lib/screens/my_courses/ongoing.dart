import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ircf/color/app_color.dart';
import 'package:ircf/constants/app_constants.dart';
import 'package:ircf/cubit/ongoing_my_courses/ongoing_my_course_cubit.dart';
import 'package:ircf/cubit/ongoing_my_courses/ongoing_my_courses_state.dart';
import 'package:ircf/cubit/update_my_courses/update_my_courses_cubit.dart';
import 'package:ircf/main.dart';
import 'package:ircf/screens/my_courses/my_courses_details.dart';
import 'package:ircf/utils/module_count.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class Ongoing extends StatefulWidget {
  final type;
  final studentId;
  final id;
  const Ongoing({super.key, this.type, this.studentId, this.id});

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
  void initState() {

      BlocProvider.of<OngoingMyCoursesCubit>(context).ongoingMyCourses(userId);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.whiteBG,
        body: BlocConsumer<OngoingMyCoursesCubit, OngoingMyCoursesState>(listener: (context, state) async {
          if (state is OngoingMyCoursesSuccess) {}
          if (state is OngoingMyCoursesError) {}
        }, builder: (context, state) {
          if (state is OngoingMyCoursesSuccess) {
            return ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: AppConstants.HORIZONTAL_PADDING, vertical: 17),
                itemCount: state.myCoursesResponse.data!.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      pushNewScreen(context,
                          screen:  MyCoursesDetail(
                            type: 'Ongoing',id: state.myCoursesResponse.data![index].crs_id.toString(),
                            studentId: state.myCoursesResponse.data![index].std_id.toString()
                          ),
                          withNavBar: false,
                          pageTransitionAnimation: PageTransitionAnimation.fade);
                    },
                    child: Card(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        elevation: 2,
                        shape: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
                        color: Colors.white,
                        child: Row(
                          children: [
                            Container(
                              height: 130,
                              width: 130,
                              decoration:  BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(16),
                                    bottomLeft: Radius.circular(16),
                                  ),
                                  image: DecorationImage(image: NetworkImage(
                                      '${AppConstants.IMAGE_URL}${state.myCoursesResponse.data![index].crs_image}'
                                  ))),
                            ),
                            Flexible(
                                child: Padding(
                              padding: const EdgeInsets.all(14),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    state.myCoursesResponse.data![index].crs_short_name.toString(),
                                    textScaleFactor: 1,
                                    style: GoogleFonts.mulish(fontSize: AppConstants.XSMALL, fontWeight: FontWeight.bold, color: AppColor.activeColor),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    state.myCoursesResponse.data![index].crs_name.toString(),
                                    textScaleFactor: 1,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    style: GoogleFonts.jost(fontSize: AppConstants.MEDIUM, fontWeight: FontWeight.w500, color: AppColor.textColor),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10, bottom: 14),
                                    child: Text(
                                      ' ${state.myCoursesResponse.data![index].course_time.toString()}',
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
                        )),
                  );
                });
          }
          return AppConstants.LOADER;
        }));
  }
  int BadgeItems() {
    var s1 = AppBadge();
    return s1.getBadgeUpdate();
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
