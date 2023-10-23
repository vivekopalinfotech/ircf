// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:ircf/color/app_color.dart';
// import 'package:ircf/constants/app_constants.dart';
// import 'package:ircf/screens/home/all_listings.dart';
// import 'package:ircf/screens/home/bcls.dart';
// import 'package:ircf/screens/home/ccls.dart';
// import 'package:ircf/screens/home/cols.dart';
//
//
// class PopularCourses extends StatefulWidget {
//   const PopularCourses({super.key});
//
//   @override
//   State<PopularCourses> createState() => _PopularCoursesState();
// }
//
// class _PopularCoursesState extends State<PopularCourses> {
//
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
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: AppColor.whiteBG,
//         body: Padding(
//             padding: const EdgeInsets.only(top: 45,),
//             child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//               Column(
//          children: [
//            Padding(
//              padding: const EdgeInsets.symmetric(horizontal: AppConstants.HORIZONTAL_PADDING),
//              child: Row(
//                mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                children: [
//                  Flexible(
//                    flex: 7,
//                    child: Row(
//                      children: [
//                        InkWell(
//                            splashColor: Colors.transparent,
//                            highlightColor: Colors.transparent,
//                            onTap: () {
//                              Navigator.of(context).pop();
//                            },
//                            child: Icon(
//                              CupertinoIcons.arrow_left,
//                              size: 28,
//                              color: AppColor.textColor,
//                            )),
//                        Text(
//                          ' Popular Courses',
//                          style: GoogleFonts.jost(color: AppColor.textColor, fontWeight: FontWeight.w500, fontSize: 21),
//                        ),
//                      ],
//                    ),
//                  ),
//                  Flexible(
//                    flex: 1,
//                    child: SvgPicture.asset('assets/images/search.svg',height: 20,width: 20,),
//                  )
//                ],
//              ),
//            ),
//            const SizedBox(height: 20,),
//            Padding(
//              padding: const EdgeInsets.symmetric(vertical: 8),
//              child: SizedBox(
//                height: 30,
//                child: ListView(
//                  padding: const EdgeInsets.symmetric(horizontal: AppConstants.HORIZONTAL_PADDING,),
//                  shrinkWrap: true,
//                  scrollDirection: Axis.horizontal,
//                  children: [
//                    InkWell(
//                      highlightColor: Colors.transparent,
//                      splashColor: Colors.transparent,
//                      onTap: _onPressedAll,
//                      child: Container(
//                        height: 30,
//                        decoration:  BoxDecoration(
//
//                            borderRadius: const BorderRadius.all(Radius.circular(26)),
//                            color: activePageIndex == 0? AppColor.primaryColor
//                                : AppColor.secondaryColor),
//                        child: Padding(
//                          padding: const EdgeInsets.symmetric(horizontal: 16),
//                          child: Center(
//                            child: Text(
//                              "All",
//                              textScaleFactor: 1,
//                              style: GoogleFonts.mulish(
//                                  color: activePageIndex == 0?  Colors.white:Colors.black,
//                                  fontStyle: FontStyle.normal,
//                                  fontSize: 13,
//                                  fontWeight: FontWeight.bold ),
//                              textAlign: TextAlign.center,
//                            ),
//                          ),
//                        ),
//                      ),
//                    ),
//                    const SizedBox(width: 12,),
//                    InkWell(
//                      highlightColor: Colors.transparent,
//                      splashColor: Colors.transparent,
//                      onTap: _onPressedCols,
//                      child: Container(
//                        height: 30,
//                        decoration:  BoxDecoration(
//
//                            borderRadius: const BorderRadius.all(Radius.circular(26)),
//                            color: activePageIndex == 1? AppColor.primaryColor
//                                : AppColor.secondaryColor),
//                        child: Padding(
//                          padding: const EdgeInsets.symmetric(horizontal: 32),
//                          child: Center(
//                            child: Text(
//                              "COLS",
//                              textScaleFactor: 1,
//                              style: GoogleFonts.mulish(
//                                  color: activePageIndex == 1?  Colors.white:Colors.black,
//                                  fontStyle: FontStyle.normal,
//                                  fontSize: 13,
//                                  fontWeight: FontWeight.bold ),
//                              textAlign: TextAlign.center,
//                            ),
//                          ),
//                        ),
//                      ),
//                    ),
//                    const SizedBox(width: 12,),
//                    InkWell(
//                      highlightColor: Colors.transparent,
//                      splashColor: Colors.transparent,
//                      onTap: _onPressedBcls,
//                      child: Container(
//                        height: 30,
//                        decoration:  BoxDecoration(
//
//                          borderRadius: const BorderRadius.all(Radius.circular(26)),
//                          color: activePageIndex == 2? AppColor.primaryColor
//                              : AppColor.secondaryColor,),
//                        child: Padding(
//                          padding: const EdgeInsets.symmetric(horizontal: 32),
//                          child: Center(
//                            child: Text(
//                              "BCLS",
//                              textScaleFactor: 1,
//                              textAlign: TextAlign.center,
//                              style: GoogleFonts.mulish(
//                                  color: activePageIndex == 2?  Colors.white:Colors.black,
//                                  fontStyle: FontStyle.normal,
//                                  fontSize: 13,
//                                  fontWeight: FontWeight.bold ),
//                            ),
//                          ),
//                        ),
//                      ),
//                    ),
//                    const SizedBox(width: 12,),
//                    InkWell(
//                      highlightColor: Colors.transparent,
//                      splashColor: Colors.transparent,
//                      onTap: _onPressedCcls,
//                      child: Container(
//                        height: 30,
//                        decoration:  BoxDecoration(
//
//                          borderRadius: const BorderRadius.all(Radius.circular(26)),
//                          color: activePageIndex == 3? AppColor.primaryColor
//                              : AppColor.secondaryColor,),
//                        child: Padding(
//                          padding: const EdgeInsets.symmetric(horizontal: 32),
//                          child: Center(
//                            child: Text(
//                              "CCLS",
//                              textScaleFactor: 1,
//                              style: GoogleFonts.mulish(
//                                  color: activePageIndex == 3?  Colors.white:Colors.black,
//                                  fontStyle: FontStyle.normal,
//                                  fontSize: 13,
//                                  fontWeight: FontWeight.bold ),
//                              textAlign: TextAlign.center,
//                            ),
//                          ),
//                        ),
//                      ),
//                    ),
//                  ],
//                ),
//              ),
//            ),
//          ],
//        ),
//                   Expanded(
//                     flex: 2,
//                     child: PageView(
//                       controller: _pageController,
//                       physics: const NeverScrollableScrollPhysics(),
//                       //scrollDirection: Axis.horizontal,
//
//                       onPageChanged: (int i) {
//                         FocusScope.of(context).requestFocus(FocusNode());
//                         setState(() {
//                           activePageIndex = i;
//                         });
//                       },
//                       children:  const <Widget>[
//                         AllListings(),
//                         Cols(),
//                         Bcls(),
//                         Ccls(),
//                         //  Members(),
//                       ],
//                     ),
//                   ),
//             ])));
//   }
//
//   void _onPressedAll() {
//     _pageController.animateToPage(0,
//         duration: const Duration(milliseconds: 5), curve: Curves.decelerate);
//   }
//
//   void _onPressedCols() {
//     _pageController.animateToPage(1,
//         duration: const Duration(milliseconds: 5), curve: Curves.decelerate);
//   }
//
//   void _onPressedBcls() {
//     _pageController.animateToPage(2,
//         duration: const Duration(milliseconds: 5), curve: Curves.decelerate);
//   }
//
//   void _onPressedCcls() {
//     _pageController.animateToPage(3,
//         duration: const Duration(milliseconds: 5), curve: Curves.decelerate);
//   }
// }
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ircf/color/app_color.dart';
import 'package:ircf/constants/app_constants.dart';
import 'package:ircf/cubit/course_category/course_category_cubit.dart';
import 'package:ircf/cubit/course_category/course_category_state.dart';
import 'package:ircf/screens/home/all_listings.dart';
import 'package:ircf/screens/home/widget/tab_content.dart';

class PopularCourses extends StatefulWidget {
  const PopularCourses({super.key});

  @override
  State<PopularCourses> createState() => _PopularCoursesState();
}

class _PopularCoursesState extends State<PopularCourses> {
  final searchController = TextEditingController();
  late PageController _pageController;
  int activePageIndex = 0;

  @override
  void initState() {
    _pageController = PageController();
    BlocProvider.of<CourseCategoryCubit>(context).courseCategory();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  bool isShow = false;
  toggle() {
    setState(() {
      isShow = !isShow;
    });
  }

  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(
          length: 3,
          child: Scaffold(
              backgroundColor: AppColor.whiteBG,
              body: BlocConsumer<CourseCategoryCubit, CourseCategoryState>(listener: (context, state) async {
      if (state is CourseCategorySuccess) {}
      if (state is CourseCategoryError) {}
    }, builder: (context, state) {
    if (state is CourseCategorySuccess) {
      List<Tab> allTabs = [
        const Tab(text: 'All'),
        ...state.categoryResponse.course_category!.map((tabName) => Tab(text: tabName.cat_name)).toList(),
      // Add your additional static tab here
      ];
    return Padding(
                  padding: const EdgeInsets.only(
                    top: 45,
                  ),
                  child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: AppConstants.HORIZONTAL_PADDING),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                flex: 7,
                                child: Row(
                                  children: [
                                    InkWell(
                                        splashColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Icon(
                                          CupertinoIcons.arrow_left,
                                          size: 28,
                                          color: AppColor.textColor,
                                        )),
                                    Text(
                                      ' Popular Courses',
                                      style: GoogleFonts.jost(color: AppColor.textColor, fontWeight: FontWeight.w500, fontSize: 21),
                                    ),
                                  ],
                                ),
                              ),
                              Flexible(
                                flex: 1,
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () {
                                    toggle();
                                  },
                                  child: SvgPicture.asset(
                                    'assets/images/search.svg',
                                    height: 20,
                                    width: 20,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TabBar(
                          unselectedLabelColor: Colors.black,
                          indicator: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            color: AppColor.primaryColor,
                          ),
                          indicatorWeight: 0,

                          isScrollable: true,
                          indicatorColor: AppColor.secondaryColor,
                          labelPadding: const EdgeInsets.symmetric(horizontal: 30),
                          padding: const EdgeInsets.symmetric(horizontal: AppConstants.HORIZONTAL_PADDING),
                          automaticIndicatorColorAdjustment: true,
                          unselectedLabelStyle: GoogleFonts.mulish(color: Colors.black, fontStyle: FontStyle.normal, fontSize: 13, fontWeight: FontWeight.bold),
                          tabs: allTabs

                        ),
                        isShow == true
                            ? Padding(
                                padding: const EdgeInsets.symmetric(horizontal: AppConstants.HORIZONTAL_PADDING, vertical: 16),
                                child: Card(
                                  elevation: 2,
                                  shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
                                  margin: EdgeInsets.zero,
                                  color: Colors.white,
                                  child: Container(
                                    height: 60,
                                    padding: const EdgeInsets.symmetric(horizontal: 10),
                                    child: MediaQuery(
                                      data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
                                      child: TextFormField(
                                        keyboardType: TextInputType.text,
                                        controller: searchController,
                                        autofocus: false,
                                        style: GoogleFonts.montserrat(
                                          color: Colors.black,
                                          fontStyle: FontStyle.normal,
                                          fontSize: AppConstants.SMALL,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        textInputAction: TextInputAction.next,
                                        decoration: InputDecoration(
                                          hintText: 'Search Courses',
                                          hintStyle: GoogleFonts.montserrat(
                                            color: AppColor.hintColor,
                                            fontStyle: FontStyle.normal,
                                            fontSize: AppConstants.SMALL,
                                            fontWeight: FontWeight.w400,
                                          ),
                                          prefixIconConstraints: const BoxConstraints(maxHeight: 20, minWidth: 40),
                                          prefixIcon: SvgPicture.asset(
                                            'assets/images/search.svg',
                                            height: 20,
                                            width: 20,
                                          ),
                                          focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent, width: 1.0), borderRadius: BorderRadius.all(Radius.circular(12))),
                                          enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent), borderRadius: BorderRadius.all(Radius.circular(30))),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : const SizedBox(
                                height: 16,
                              )
                      ],
                    ),
                     Expanded(
                      child: TabBarView(children: [
                        const AllListings(),
                        ...state.categoryResponse.course_category!.map((tabName) => TabContent(tabName: tabName.cat_name.toString(),slug: tabName.slug.toString(),)).toList()
                      ]),
                    )
                  ]));}
    return  AppConstants.LOADER;
              })),
        );

  }
}
