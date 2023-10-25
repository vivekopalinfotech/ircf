// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:ircf/color/app_color.dart';
// import 'package:ircf/constants/app_constants.dart';
// import 'package:ircf/screens/my_courses/completed.dart';
// import 'package:ircf/screens/my_courses/ongoing.dart';
//
// class MyCourses extends StatefulWidget {
//   const MyCourses({super.key});
//
//   @override
//   State<MyCourses> createState() => _MyCoursesState();
// }
//
// class _MyCoursesState extends State<MyCourses> {
//   final searchController = TextEditingController();
//   late PageController _pageController;
//   int activePageIndex = 0;
//
//   @override
//   void initState() {
//     _pageController = PageController();
//     super.initState();
//   }
//   @override
//   void dispose(){
//     _pageController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//         length: 2, // Number of tabs
//         child: Scaffold(
//             backgroundColor: AppColor.whiteBG,
//             body: Padding(
//                 padding: const EdgeInsets.only(top: 45,  left: AppConstants.HORIZONTAL_PADDING, right: AppConstants.HORIZONTAL_PADDING),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//
//                       Text('My Courses',
//                         textScaleFactor: 1,
//                         style: GoogleFonts.jost(
//                           color: AppColor.textColor,
//                           fontWeight: FontWeight.w500,
//                           fontSize: 21
//                       ),),
//                       const SizedBox(
//                         height: 25,
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           InkWell(
//                             highlightColor: Colors.transparent,
//                             splashColor: Colors.transparent,
//                             onTap: _onPressedCompleted,
//                             child: Container(
//                               height: 48,
//                               width: 155,
//                               decoration: BoxDecoration(borderRadius: const BorderRadius.all(Radius.circular(26)), color: activePageIndex == 0 ? AppColor.primaryColor : AppColor.secondaryColor),
//                               child: Padding(
//                                 padding: const EdgeInsets.symmetric(horizontal: 16),
//                                 child: Center(
//                                   child: Text(
//                                     "Completed",
//                                     textScaleFactor: 1,
//                                     style: GoogleFonts.mulish(color: activePageIndex == 0 ? Colors.white : Colors.black, fontStyle: FontStyle.normal, fontSize: 15, fontWeight: FontWeight.bold),
//                                     textAlign: TextAlign.center,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                           InkWell(
//                             highlightColor: Colors.transparent,
//                             splashColor: Colors.transparent,
//                             onTap: _onPressedOngoing,
//                             child: Container(
//                               height: 48,
//                               width: 155,
//                               decoration: BoxDecoration(borderRadius: const BorderRadius.all(Radius.circular(26)), color: activePageIndex == 1 ? AppColor.primaryColor : AppColor.secondaryColor),
//                               child: Padding(
//                                 padding: const EdgeInsets.symmetric(horizontal: 32),
//                                 child: Center(
//                                   child: Text(
//                                     "Ongoing",
//                                     textScaleFactor: 1,
//                                     style: GoogleFonts.mulish(color: activePageIndex == 1 ? Colors.white : Colors.black, fontStyle: FontStyle.normal, fontSize: 15, fontWeight: FontWeight.bold),
//                                     textAlign: TextAlign.center,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       )
//                     ]),
//                     Expanded(
//                       flex: 2,
//                       child: PageView(
//                         controller: _pageController,
//                         physics: const NeverScrollableScrollPhysics(),
//                         onPageChanged: (int i) {
//                           FocusScope.of(context).requestFocus(FocusNode());
//                           setState(() {
//                             activePageIndex = i;
//                           });
//                         },
//                         children:  const <Widget>[
//                           Completed(),
//                           Ongoing(),
//                           //  Members(),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ))));
//   }
//
//   void _onPressedCompleted() {
//     _pageController.animateToPage(0, duration: const Duration(milliseconds: 5), curve: Curves.decelerate);
//   }
//
//   void _onPressedOngoing() {
//     _pageController.animateToPage(1, duration: const Duration(milliseconds: 5), curve: Curves.decelerate);
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ircf/color/app_color.dart';
import 'package:ircf/constants/app_constants.dart';
import 'package:ircf/cubit/ongoing_my_courses/ongoing_my_course_cubit.dart';
import 'package:ircf/main.dart';
import 'package:ircf/screens/my_courses/completed.dart';
import 'package:ircf/screens/my_courses/ongoing.dart';

class MyCourses extends StatefulWidget {
  const MyCourses({super.key});

  @override
  State<MyCourses> createState() => _MyCoursesState();
}

class _MyCoursesState extends State<MyCourses> {
  final searchController = TextEditingController();
  late PageController _pageController;
  int activePageIndex = 0;

  @override
  void initState() {
    _pageController = PageController();

    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2, // Number of tabs
        child: Scaffold(
            backgroundColor: AppColor.whiteBG,
            body: Padding(
                padding: const EdgeInsets.only(top: 45, ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: AppConstants.HORIZONTAL_PADDING),
                        child: Text(
                          'My Courses',
                          textScaleFactor: 1,
                          style: GoogleFonts.jost(color: AppColor.textColor, fontWeight: FontWeight.w500, fontSize: 21),
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: AppConstants.HORIZONTAL_PADDING),
                        child: TabBar(
                          unselectedLabelColor: Colors.black,
                          indicator: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            color: AppColor.primaryColor,
                          ),
                          tabs: const [
                            Tab(
                              text: 'Ongoing',height: 48,
                            ),
                            Tab(
                              text: 'Completed',height: 48,
                            ),

                          ],
                          indicatorColor: AppColor.secondaryColor,
                          labelPadding: const EdgeInsets.symmetric(horizontal: AppConstants.HORIZONTAL_PADDING),
                          indicatorPadding: EdgeInsets.zero,
                          indicatorWeight: 0,
                          automaticIndicatorColorAdjustment: true,
                          unselectedLabelStyle: GoogleFonts.mulish(color: Colors.black, fontStyle: FontStyle.normal, fontSize: 13, fontWeight: FontWeight.bold),
                        ),
                      )
                    ]),
                    const Expanded(
                      child: TabBarView(children: [
                        Ongoing(),
                        Completed(),

                      ]),
                    )
                  ],
                ))));
  }

}
