import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ircf/color/app_color.dart';
import 'package:ircf/constants/app_constants.dart';
import 'package:ircf/cubit/course_module/course_module_cubit.dart';
import 'package:ircf/cubit/course_module/course_module_state.dart';
import 'package:ircf/screens/home/listing_detail.dart';
import 'package:ircf/screens/home/popular_courses.dart';
import 'package:ircf/screens/notification/notification.dart';
import 'package:ircf/widgets/save.dart';
import 'package:ircf/widgets/title_bar.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class Cat {
  final name;
  final title;
  final isSaved;

  Cat(this.name, this.title, this.isSaved);
}

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

  @override
  void initState() {
    _pageController = PageController();
    BlocProvider.of<CourseModuleCubit>(context).courseModule();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  List<Cat> filterCat = [
    Cat('COLS', 'Compression-Only Life Support', false),
    Cat('BCLS', 'Basic Cardiopulmonary Life Support ', true),
    Cat('CCLS', 'Comprehensive Cardiopulmonary Life Support', false),
  ];
  bool isSaved = false;

  toggelButton() async {
    setState(() {
      isSaved = !isSaved;
    });
  }



  @override
  Widget build(BuildContext context) {
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
                            'Hi, OPAL INFOTECH',
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
                              child: Image.asset("assets/images/OFFER.png", fit: BoxFit.contain, cacheHeight: 450, cacheWidth: 893)),
                        );
                      },
                      itemCount: 5,
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 14,
                    child: SizedBox(
                      height: 16,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          5,
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppConstants.HORIZONTAL_PADDING),
                child: SizedBox(
                  height: 54,
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: _getListData()),
                ),
              ),
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
              SizedBox(
                height: 250,
                child: ListView(scrollDirection: Axis.horizontal, children: _getCards()),
              ),
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

  _getListData() {
    List<Widget> widgets = [];

    for (int i = 0; i < filterCat.length; i++) {
      widgets.add(Container(
        height: 30,
        padding: EdgeInsets.zero,
        child: InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () {
            setState(() {
              activePageIndex = filterCat[i].name;
            });
          },
          child: Chip(
            label: Text(
              filterCat[i].name,
              textAlign: TextAlign.center,
              textScaleFactor: 1,
              style: GoogleFonts.mulish(color: activePageIndex == filterCat[i].name ? Colors.white : Colors.black, fontSize: AppConstants.XSMALL, fontWeight: FontWeight.bold),
            ),
            labelPadding: const EdgeInsets.all(0.0),
            backgroundColor: activePageIndex == filterCat[i].name ? AppColor.primaryColor : AppColor.secondaryColor,
            elevation: 0.0,
            padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 7),
          ),
        ),
      ));
    }
    return widgets;
  }

  _getCards() {
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
    for (int i = 0; i < filterCat.length; i++) {
      widgets.add(
        Card(
          margin: const EdgeInsets.fromLTRB(16, 0, 0, 5),
          elevation: 3,
          clipBehavior: Clip.antiAlias,
          shape: OutlineInputBorder(borderRadius: BorderRadius.circular(18), borderSide: BorderSide.none),
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 134,
                width: MediaQuery.of(context).size.width * .72,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(18), topRight: Radius.circular(18)),
                    // image: DecorationImage(
                    //   image: AssetImage('assets/images/OFFER.png'),
                    //   fit: BoxFit.cover,
                    // ),
                    color: Colors.black),
              ),
              BlocConsumer<CourseModuleCubit, CourseModuleState>(listener: (context, state) async {
                if (state is CourseModuleSuccess) {}
                if (state is CourseModuleError) {}
              }, builder: (context, state) {
                if (state is CourseModuleSuccess) {
                  return Container(
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
                              state.courseModuleResponse.course!.crs_name.toString(),
                              textScaleFactor: 1,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: GoogleFonts.mulish(fontSize: AppConstants.XSMALL, fontWeight: FontWeight.bold, color: AppColor.activeColor),
                            ),
                            SaveWidget(
                              favdata: filterCat[i].isSaved,
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        Text(
                          filterCat[i].title,
                          textScaleFactor: 1,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
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
                                pushNewScreen(context, screen:  ListingDetail(courseModule: state.courseModuleResponse.course_module!,title: state.courseModuleResponse.course!.crs_name),
                                    withNavBar: false,
                                    pageTransitionAnimation:
                                PageTransitionAnimation.fade);
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
                  );
                }
                return Center(
                    child: CircularProgressIndicator());
              }),
            ],
          ),
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
