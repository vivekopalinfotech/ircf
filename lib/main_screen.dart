// ignore_for_file: use_build_context_synchronously, prefer_typing_uninitialized_variables, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ircf/constants/app_constants.dart';
import 'package:ircf/screens/about_ircf/about.dart';
import 'package:ircf/screens/home/dashboard.dart';
import 'package:ircf/screens/my_courses/my_courses.dart';
import 'package:ircf/screens/profile/profile.dart';
import 'package:ircf/screens/transaction/transaction.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import '../../../color/app_color.dart';

class MainScreen extends StatefulWidget {
  final String redirectPageName;
  final keyone;
  const MainScreen({Key? key, required this.redirectPageName,  this.keyone});

  @override
  MainScreenState createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  late PersistentTabController _controller;
  late bool _hideNavBar;

  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  void initState() {
    super.initState();

    if(widget.redirectPageName=="home"){
      _controller = PersistentTabController(initialIndex: 0);
    }else if(widget.redirectPageName=="courses"){
      _controller = PersistentTabController(initialIndex: 1);
    }else if(widget.redirectPageName=="about"){
      _controller = PersistentTabController(initialIndex: 2);
    }else if(widget.redirectPageName=="transaction"){
      _controller = PersistentTabController(initialIndex: 3);
    }else if(widget.redirectPageName=="profile"){
      _controller = PersistentTabController(initialIndex: 4);
    }
    /* if(hasEventPressed){
      _controller = PersistentTabController(initialIndex: 2);
    }else{
      _controller = PersistentTabController(initialIndex: 0);
    }*/

    _hideNavBar = false;


  }




  List<Widget> _buildScreens() {
    return [
      const Dashboard(),
      const MyCourses(),
      const About(),
      const Transaction(),
      const Profile(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [

      PersistentBottomNavBarItem(
        icon:  SvgPicture.asset('assets/images/home.svg',color: AppColor.textColor,),
        iconSize: 24,
        title: "HOME",
        textStyle:  GoogleFonts.mulish(fontSize: 9, fontWeight: FontWeight.bold),
        activeColorPrimary: AppColor.primaryColor,
        inactiveColorPrimary:  AppColor.textColor,
        routeAndNavigatorSettings:  RouteAndNavigatorSettings(

          initialRoute: '/',
          routes: {
            '/home': (context) => const Dashboard(),
            '/courses': (context) => const MyCourses(),
            '/about': (context) => const About(),
            '/transaction': (context) => const Transaction(),
            '/profile': (context) => const Profile(),
          },
        ),
      ),
      PersistentBottomNavBarItem(
        icon:  SvgPicture.asset('assets/images/courses.svg'),
        iconSize: 24,

        title: "My COURSES",
        textStyle:  GoogleFonts.mulish(fontSize: 9, fontWeight: FontWeight.bold),
        activeColorPrimary: AppColor.primaryColor,
        inactiveColorPrimary:  AppColor.textColor,
        routeAndNavigatorSettings:  RouteAndNavigatorSettings(

          initialRoute: '/',
          routes: {
            '/home': (context) => const Dashboard(),
            '/courses': (context) => const MyCourses(),
            '/about': (context) => const About(),
            '/transaction': (context) => const Transaction(),
            '/profile': (context) => const Profile(),
          },
        ),
      ),
      PersistentBottomNavBarItem(
        icon:  SvgPicture.asset('assets/images/about.svg'),
        iconSize: 24,

        title: "ABOUT IRCF",
        textStyle:  GoogleFonts.mulish(fontSize: 9, fontWeight: FontWeight.bold),
        activeColorPrimary: AppColor.primaryColor,
        inactiveColorPrimary: AppColor.textColor,
        routeAndNavigatorSettings:  RouteAndNavigatorSettings(

          initialRoute: '/',
          routes: {
            '/home': (context) => const Dashboard(),
            '/courses': (context) => const MyCourses(),
            '/about': (context) => const About(),
            '/transaction': (context) => const Transaction(),
            '/profile': (context) => const Profile(),
          },
        ),
      ),
      PersistentBottomNavBarItem(
        icon:  SvgPicture.asset('assets/images/transaction.svg'),
        iconSize: 24,

        title: "TRANSACTION",
        textStyle:  GoogleFonts.mulish(fontSize: 9, fontWeight: FontWeight.bold),
        activeColorPrimary: AppColor.primaryColor,
        inactiveColorPrimary: AppColor.textColor,
        routeAndNavigatorSettings:  RouteAndNavigatorSettings(

          initialRoute: '/',
          routes: {
            '/home': (context) => const Dashboard(),
            '/courses': (context) => const MyCourses(),
            '/about': (context) => const About(),
            '/transaction': (context) => const Transaction(),
            '/profile': (context) => const Profile(),
          },
        ),
      ),
      PersistentBottomNavBarItem(
        icon:  SvgPicture.asset('assets/images/profile.svg'),
        iconSize: 24,

        title: "PROFILE",
        textStyle:  GoogleFonts.mulish(fontSize: 9, fontWeight: FontWeight.bold),
        activeColorPrimary: AppColor.primaryColor,
        inactiveColorPrimary: AppColor.textColor,
        routeAndNavigatorSettings:  RouteAndNavigatorSettings(

          initialRoute: '/',
          routes: {
            '/home': (context) => const Dashboard(),
            '/courses': (context) => const MyCourses(),
            '/about': (context) => const About(),
            '/transaction': (context) => const Transaction(),
            '/profile': (context) => const Profile(),
          },
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: PersistentTabView(
          context,
          controller: _controller,
          screens: _buildScreens(),
          items: _navBarsItems(),
          confineInSafeArea: true,
          backgroundColor:  AppColor.whiteBG,
          handleAndroidBackButtonPress: true,
          resizeToAvoidBottomInset: true,
          stateManagement: true,
          navBarHeight: MediaQuery.of(context).viewInsets.bottom > 0
              ? 0.0
              : kBottomNavigationBarHeight,
          hideNavigationBarWhenKeyboardShows: true,
          margin: const EdgeInsets.all(0.0),
          popActionScreens: PopActionScreensType.all,
          bottomScreenMargin: kBottomNavigationBarHeight,
          onWillPop: (context) async {
            // if(login == "ture"){
            showAlertDialog(context!);
            // } else {
            //   showAlertDialog1(context!);
            // }

            return false;
          },
          padding: const NavBarPadding.symmetric(horizontal: 6,vertical: 6),
          onItemSelected: (index) {
            //  BlocProvider.of<DashboardCubit>(context).getBanner(widget.latitude,widget.longitude);


            if (index == 0) {
              //  BlocProvider.of<ListingCubit>(context).clearListingState();

              //BlocProvider.of<ListingCubit>(context).listings("", "", "", "", "",
              //  "", "", latitudeEvent.toString(), longitudeEvent.toString(), false, false, true, "0", "20", "50");

              //   BlocProvider.of<OrderListCubit>(context).getOrderList();
            }
            if (index == 1) {

              // BlocProvider.of<ChatUserCubit>(context).chatUserList();
            }
            if (index == 2) {
              //BlocProvider.of<EventCubit>(context).getEvents();
              //  BlocProvider.of<RidesCubit>(context).rides();
            }
            if (index == 3) {
              //  print('home_screen api call');
              // BlocProvider.of<HistoryCubit>(context).getHistory();
            }

            if(index ==4){
              //BlocProvider.of<YouTubeAllShowsCubit>(context).youtubeAllShows();
            }

          },
          selectedTabScreenContext: (context) {},
          hideNavigationBar: _hideNavBar,
          decoration: NavBarDecoration(
              colorBehindNavBar: Colors.white,
              borderRadius: BorderRadius.circular(0.0)
          ),
          popAllScreensOnTapOfSelectedTab: true,
          itemAnimationProperties: const ItemAnimationProperties(
            duration: Duration(milliseconds: 400),
            curve: Curves.easeIn,
          ),


          screenTransitionAnimation: const ScreenTransitionAnimation(
            animateTabTransition: true,
            curve: Curves.ease,
            duration: Duration(milliseconds: 200),
          ),
          navBarStyle: NavBarStyle.style8,
        )
    );
  }

}



void showAlertDialog(BuildContext context) {

  Widget cancelButton = TextButton(
    child: Text("Cancel",
      textScaleFactor: 1,
      style: TextStyle(color: AppColor.primaryColor),),
    onPressed: () {
      Navigator.of(context, rootNavigator: true).pop();
    },
  );
  Widget continueButton = TextButton(
    child: Text("Exit",
        textScaleFactor: 1,
        style: TextStyle(color: AppColor.primaryColor)),
    onPressed: ()  async {
      SystemNavigator.pop();
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: BorderSide.none
    ),
    backgroundColor: Colors.white,
    titlePadding: EdgeInsets.zero,
    contentPadding: EdgeInsets.zero,
    title: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: AppColor.secondaryColor,
      ),
      padding: const EdgeInsets.symmetric(horizontal: AppConstants.HORIZONTAL_PADDING,vertical: 16),
      child: Column(
        children: [
          Align(
              alignment: Alignment.centerLeft,
              child: SvgPicture.asset( "assets/images/New-Vkind-Logo-horizontal-blue.svg",height: 25,)),
          const SizedBox(height: 16,),
          Text("Do you want to exit from the application?",
            textScaleFactor: 1,
            style: GoogleFonts.montserrat(
                color: Colors.black,
                fontSize: AppConstants.LARGE,fontWeight: FontWeight.w500
            ),),
          const SizedBox(height: 16,),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              cancelButton,
              continueButton,
            ],
          ),

        ],
      ),
    ),

  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}


