// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ircf/color/app_color.dart';
import 'package:ircf/constants/app_constants.dart';
import 'package:ircf/cubit/all_listings/all_listings_cubit.dart';
import 'package:ircf/cubit/all_listings/all_listings_state.dart';
import 'package:ircf/cubit/course_category/course_category_cubit.dart';
import 'package:ircf/cubit/course_category/course_category_state.dart';
import 'package:ircf/cubit/course_module/course_module_cubit.dart';
import 'package:ircf/cubit/course_module/course_module_state.dart';
import 'package:ircf/model/all_listing_response.dart';
import 'package:ircf/model/course_module_response.dart';
import 'package:ircf/screens/home/listing_detail.dart';
import 'package:ircf/screens/home/popular_courses.dart';
import 'package:ircf/screens/notification/notification.dart';
import 'package:ircf/utils/preferences_data.dart';
import 'package:ircf/widgets/save.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class Dashboard extends StatefulWidget {
  final name;
  const Dashboard({super.key, this.name});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _currentIndex = 0;
  late PageController _pageController;
  String activePageIndex = '';
  var name;

  @override
  void initState() {
    _pageController = PageController();
    BlocProvider.of<CourseCategoryCubit>(context).courseCategory();
    BlocProvider.of<AllListingCubit>(context).allListing();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  bool isSaved = false;

  toggelButton() async {
    setState(() {
      isSaved = !isSaved;
    });
  }

  List<String> img = [
    'assets/images/home_banner-1.png',
    'assets/images/home_banner2.png',
    'assets/images/home_banner3.png',
  ];

  @override
  Widget build(BuildContext context) {
    PreferenceData.getData('user_name').then((value) {
      setState(() {
        name = value.toString();
      });
    });
    return Scaffold(
      backgroundColor: AppColor.whiteBG,
      body: Padding(
          padding: const EdgeInsets.only(top: 45, bottom: 20),
          child: SingleChildScrollView(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.start, children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppConstants.HORIZONTAL_PADDING),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex: 6,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hi, $name',
                            maxLines: 1,
                            textScaleFactor: 1,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.jost(color: AppColor.textColor, fontWeight: FontWeight.bold, fontSize: AppConstants.XXLARGE),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            'What Would you like to learn Today?\nSearch Below.',
                            textScaleFactor: 1,
                            style: GoogleFonts.mulish(color: AppColor.secondaryTextColor, fontWeight: FontWeight.bold, fontSize: 13),
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
                            pushNewScreen(context, screen: const Notifications(), withNavBar: false, pageTransitionAnimation: PageTransitionAnimation.fade);
                          },
                          child: SvgPicture.asset(
                            'assets/images/NOTIFICATIONS.svg',
                            height: 40,
                            width: 40,
                          )),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  AspectRatio(
                    aspectRatio: 2.4 / 1,
                    child: CarouselSlider.builder(
                      options: CarouselOptions(
                        autoPlay: true,
                        viewportFraction: 1.0,
                        enableInfiniteScroll: true,
                        initialPage: 0,
                        autoPlayInterval: const Duration(seconds: 4),
                        enlargeCenterPage: false,
                        autoPlayAnimationDuration: const Duration(milliseconds: 500),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        pauseAutoPlayInFiniteScroll: true,
                        pauseAutoPlayOnTouch: false,
                        scrollDirection: Axis.horizontal,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _currentIndex = index;
                          });
                        },
                      ),
                      itemBuilder: (BuildContext context, int index, int realIndex) {
                        return GestureDetector(
                          child: Container(
                              margin: const EdgeInsets.symmetric(horizontal: AppConstants.HORIZONTAL_PADDING, vertical: 0),
                              width: double.maxFinite,
                              height: 180,
                              child: Image.asset(img[index], fit: BoxFit.contain, cacheHeight: 450, cacheWidth: 893)),
                        );
                      },
                      itemCount: img.length,
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 10,
                    child: SizedBox(
                      height: 16,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          img.length,
                          (index) => 5 > 1 ? buildDot(index, context) : const SizedBox(),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppConstants.HORIZONTAL_PADDING),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Categories',
                      textScaleFactor: 1,
                      style: GoogleFonts.jost(color: AppColor.textColor, fontWeight: FontWeight.bold, fontSize: AppConstants.LARGE),
                    ),
                    InkWell(
                      onTap: () {
                        pushNewScreen(context, screen: const PopularCourses(), pageTransitionAnimation: PageTransitionAnimation.fade);
                      },
                      child: Row(
                        children: [
                          Text(
                            'SEE ALL ',
                            textScaleFactor: 1,
                            style: GoogleFonts.mulish(color: AppColor.primaryColor, fontWeight: FontWeight.bold, fontSize: AppConstants.XSMALL),
                          ),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 14,
                            color: AppColor.primaryColor,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              BlocConsumer<CourseCategoryCubit, CourseCategoryState>(listener: (context, state) async {
                if (state is CourseCategorySuccess) {}
                if (state is CourseCategoryError) {}
              }, builder: (context, state) {
                if (state is CourseCategorySuccess) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: AppConstants.HORIZONTAL_PADDING),
                    child: SizedBox(
                      height: 54,
                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: _getListData(state.categoryResponse.course_category!)),
                    ),
                  );
                }
                return AppConstants.LOADER;
              }),
              const SizedBox(
                height: 18,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppConstants.HORIZONTAL_PADDING),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Our Courses',
                      textScaleFactor: 1,
                      style: GoogleFonts.jost(color: AppColor.textColor, fontWeight: FontWeight.bold, fontSize: AppConstants.LARGE),
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () {
                        pushNewScreen(context, screen: const PopularCourses(), pageTransitionAnimation: PageTransitionAnimation.fade);
                      },
                      child: Row(
                        children: [
                          Text(
                            'SEE ALL ',
                            textScaleFactor: 1,
                            style: GoogleFonts.mulish(color: AppColor.primaryColor, fontWeight: FontWeight.bold, fontSize: AppConstants.XSMALL),
                          ),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 14,
                            color: AppColor.primaryColor,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 18,
              ),
          BlocConsumer<AllListingCubit, AllListingState>(listener: (context, state) async {
            if (state is AllListingSuccess) {}
            if (state is AllListingError) {}
          }, builder: (context, state) {
            if (state is AllListingSuccess) {
              return SizedBox(height: 270, child: ListView(scrollDirection: Axis.horizontal, children: _getCards(state.allListingResponse.course!.length)));
                }
                return AppConstants.LOADER;
              }),
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppConstants.HORIZONTAL_PADDING),
                child: Text(
                  'Indian Resuscitation Council Federation',
                  textScaleFactor: 1,
                  style: GoogleFonts.jost(color: AppColor.textColor, fontWeight: FontWeight.w500, fontSize: AppConstants.LARGE),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppConstants.HORIZONTAL_PADDING),
                child: Text(
                  'IRC is an initiative by Indian Society of Anesthesiologist to promote accurate and scientific resuscitation training & guidelines.',
                  textScaleFactor: 1,
                  style: GoogleFonts.mulish(color: AppColor.textColor, fontWeight: FontWeight.w500, fontSize: AppConstants.MEDIUM),
                ),
              ),
            ]),
          )),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: _currentIndex == index ? 8 : 8,
      width: _currentIndex == index ? 18 : 8,
      margin: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: _currentIndex == index ? AppColor.activeColor : Colors.white,
      ),
    );
  }

  _getListData(category) {
    List<Widget> widgets = [];

    for (int i = 0; i < category.length; i++) {
      widgets.add(Container(
        height: 30,
        padding: EdgeInsets.zero,
        child: InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () {
            setState(() {
              activePageIndex = category[i].cat_name;
            });
          },
          child: Chip(
            label: Text(
              category[i].cat_name,
              textAlign: TextAlign.center,
              textScaleFactor: 1,
              style: GoogleFonts.mulish(color: activePageIndex == category[i].cat_name ? Colors.white : Colors.black, fontSize: AppConstants.XSMALL, fontWeight: FontWeight.bold),
            ),
            labelPadding: const EdgeInsets.all(0.0),
            backgroundColor: activePageIndex == category[i].cat_name ? AppColor.primaryColor : AppColor.secondaryColor,
            elevation: 0.0,
            padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 7),
          ),
        ),
      ));
    }
    return widgets;
  }

  _getCards( int length) {
    List<Widget> widgets = [];
    widgets.add(
      Card(
          margin: const EdgeInsets.fromLTRB(17, 0, 0, 5),
          elevation: 4,
          clipBehavior: Clip.antiAlias,
          shape: OutlineInputBorder(borderRadius: BorderRadius.circular(18), borderSide: BorderSide.none),
          color: Colors.white,
          child: Container()),
    );
    for (int i = 0; i < length; i++) {
      widgets.add(
        Card(
          margin: const EdgeInsets.fromLTRB(16, 0, 0, 5),
          elevation: 3,
          clipBehavior: Clip.antiAlias,
          shape: OutlineInputBorder(borderRadius: BorderRadius.circular(18), borderSide: BorderSide.none),
          color: Colors.white,
          child:BlocConsumer<AllListingCubit, AllListingState>(listener: (context, state) async {
            if (state is AllListingSuccess) {}
            if (state is AllListingError) {}
          }, builder: (context, state) {
            if (state is AllListingSuccess) {
              return InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: (){
                  pushNewScreen(context,
                      screen: ListingDetail( title: state.allListingResponse.course![i].crs_name,subtitle: state.allListingResponse.course![i].crs_short_name,course: state.allListingResponse.course, id: state.allListingResponse.course![i].crs_id.toString(), ),
                      withNavBar: false,
                      pageTransitionAnimation: PageTransitionAnimation.fade);
                },
                child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                Container(
                  height: 134,
                  width: MediaQuery.of(context).size.width * .72,
                  decoration:  BoxDecoration(
                      borderRadius: const BorderRadius.only(topLeft: Radius.circular(18), topRight: Radius.circular(18)),
                      image: DecorationImage(
                        image: NetworkImage('${AppConstants.IMAGE_URL}${state.allListingResponse.course![i].crs_image}'),
                        fit: BoxFit.contain,
                      ),
                      ),

                ),
                 Container(
                      width: MediaQuery.of(context).size.width * .72,
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                state.allListingResponse.course![i].crs_short_name.toString(),
                                textScaleFactor: 1,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: GoogleFonts.mulish(fontSize: AppConstants.XSMALL, fontWeight: FontWeight.bold, color: AppColor.activeColor),
                              ),
                              const SaveWidget(
                                favdata: false,
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 7,
                          ),
                          Text(
                            state.allListingResponse.course![i].crs_name.toString(),
                            textScaleFactor: 1,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: GoogleFonts.jost(fontSize: AppConstants.MEDIUM, fontWeight: FontWeight.w500, color: AppColor.textColor),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const SizedBox(),
                              InkWell(
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () {
                                  pushNewScreen(context,
                                      screen: ListingDetail( title: state.allListingResponse.course![i].crs_name,subtitle: state.allListingResponse.course![i].crs_short_name,course: state.allListingResponse.course, id: state.allListingResponse.course![i].crs_id.toString(), ),
                                      withNavBar: false,
                                      pageTransitionAnimation: PageTransitionAnimation.fade);
                                },
                                child: Row(
                                  children: [
                                    Text(
                                      'VIEW ',
                                      textScaleFactor: 1,
                                      style: GoogleFonts.mulish(color: AppColor.primaryColor, fontWeight: FontWeight.bold, fontSize: AppConstants.XSMALL),
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      size: 14,
                                      color: AppColor.primaryColor,
                                    )
                                  ],
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    )
            ],
          ),
              );
            }
            return AppConstants.LOADER;
          }),
        ),
      );
    }
    widgets.add(
      Card(
          margin: const EdgeInsets.fromLTRB(0, 0, 34, 5),
          elevation: 4,
          clipBehavior: Clip.antiAlias,
          shape: OutlineInputBorder(borderRadius: BorderRadius.circular(18), borderSide: BorderSide.none),
          color: Colors.white,
          child: Container()),
    );
    return widgets;
  }
}
