import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ircf/color/app_color.dart';
import 'package:ircf/constants/app_constants.dart';
import 'package:ircf/widgets/title_bar.dart';


class Cat{
  final name;

  Cat(this.name);
}
class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

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
    super.initState();
  }
  @override
  void dispose(){
    _pageController.dispose();
    super.dispose();
  }

  List<Cat> filterCat = [
    Cat('COLS'),
    Cat('BCLS'),
    Cat('CCLS'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteBG,
      body: Padding(
        padding: const EdgeInsets.only(top: 34,bottom: 32,left: AppConstants.HORIZONTAL_PADDING,right: AppConstants.HORIZONTAL_PADDING),
    child: Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children:   [
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 6,
            child: Column(
              children: [
                Text('Hi, Ronald A. Martin',style: GoogleFonts.jost(
                    color: AppColor.textColor,
                    fontWeight: FontWeight.bold,
                    fontSize: AppConstants.XXLARGE
                ),),
                const SizedBox(height: 5,),
                Text('What Would you like to learn Today?\nSearch Below.',style: GoogleFonts.mulish(
                    color: AppColor.secondaryTextColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 13
                ),),
              ],
            ),
          ),
          Flexible(flex: 1,
              child: SvgPicture.asset('assets/images/NOTIFICATIONS.svg',height: 40,width: 40,),)

        ],
      ),
      const SizedBox(height: 24,),
      Stack(
        alignment: Alignment.bottomCenter,
        children: [
          AspectRatio(
            aspectRatio: 1.8 / 1,
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
              itemBuilder:
                  (BuildContext context, int index, int realIndex) {
                return GestureDetector(
                    child: SizedBox(
                        width: double.maxFinite,
                        height: 180,
                        child: Image.asset("assets/images/OFFER.png",
                            fit: BoxFit.contain)),
                    );
              },
              itemCount: 5,
            ),
          ),
          SizedBox(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                5,
                    (index) => 5 > 1 ? buildDot(index, context) : const SizedBox(),
              ),
            ),
          ),
        ],
      ),
      const SizedBox(height: 24,),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Categories',style: GoogleFonts.jost(
              color: AppColor.textColor,
              fontWeight: FontWeight.bold,
              fontSize: AppConstants.LARGE
          ),),
          Row(
            children: [
              Text('SEE ALL ',style: GoogleFonts.mulish(
                  color: AppColor.primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: AppConstants.XSMALL
              ),),
              Icon(Icons.arrow_forward_ios_rounded,size: 14,color: AppColor.primaryColor,)
            ],
          ),
        ],
      ),
      const SizedBox(height: 10,),
      SizedBox(
        height: 54,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: _getListData()),
      ),

      const SizedBox(height: 18,),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Our Courses',style: GoogleFonts.jost(
              color: AppColor.textColor,
              fontWeight: FontWeight.bold,
              fontSize: AppConstants.LARGE
          ),),
          Row(
            children: [
              Text('SEE ALL ',style: GoogleFonts.mulish(
                  color: AppColor.primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: AppConstants.XSMALL
              ),),
              Icon(Icons.arrow_forward_ios_rounded,size: 14,color: AppColor.primaryColor,)
            ],
          ),
        ],
      ),
      const SizedBox(height: 18,),
      Card(
        elevation: 4,
        clipBehavior: Clip.antiAlias,
        shape: OutlineInputBorder(borderRadius: BorderRadius.circular(18), borderSide: BorderSide.none),
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 114,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(18), topRight: Radius.circular(18)),
                image: DecorationImage(
                  image: AssetImage('assets/images/logo.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 24,
                  child: Text(
                     'COLS', textScaleFactor: 1,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: GoogleFonts.montserrat(
                        fontSize: AppConstants.XXLARGE,
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).brightness == Brightness.dark ? Colors.white.withOpacity(.85) : Colors.black),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),

                const SizedBox(
                  height: 24,
                ),

              ],
            )
          ],
        ),
      ),

    ])),
    );
  }
  Container buildDot(int index, BuildContext context) {
    return Container(
      height: _currentIndex == index ? 8 : 8,
      width: _currentIndex == index ? 18 : 8,
      margin: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: _currentIndex == index
            ? AppColor.activeColor
            : Colors.white,
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
              style: GoogleFonts.mulish(
                  color: activePageIndex == filterCat[i].name
                      ? Colors.white
                      : Colors.black,
                  fontSize: AppConstants.XSMALL,  fontWeight: FontWeight.bold
              ),
            ),
            labelPadding: const EdgeInsets.all(0.0),
            backgroundColor: activePageIndex == filterCat[i].name
                ? AppColor.primaryColor
                : AppColor.secondaryColor,
            elevation: 0.0,
            padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 7),
          ),
        ),
      ));
    }
    return widgets;
  }
}
