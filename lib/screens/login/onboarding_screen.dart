import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ircf/color/app_color.dart';
import 'package:ircf/constants/app_constants.dart';
import 'package:ircf/main_screen.dart';
import 'package:ircf/screens/login/phone_screen.dart';
import 'package:ircf/utils/preferences_data.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Onboard{
  final title;
  final subtitle;

  Onboard(this.title, this.subtitle);
}
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final GlobalKey _one = GlobalKey();


  PageController pageController = PageController();
  int currentIndex = 0;
  void _goToPage(int pageIndex) {
    pageController.animateToPage(
      pageIndex,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  getData() async {
    SharedPreferences sharedPreference = await SharedPreferences.getInstance();
    var login = sharedPreference.getString("login");
    print(login);
    if (login == "true") {
      Future.delayed(const Duration(milliseconds: 100), () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MainScreen(redirectPageName: "home",keyone: _one,)),
        ).then((value) {
        });
      });

    }
  }
  @override
  void initState() {
    getData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteBG,
      body: Padding(padding: const EdgeInsets.only(top: 70,),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:  AppConstants.HORIZONTAL_PADDING),
            child: Align(
              alignment: Alignment.topRight,
              child: InkWell(
                splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: (){
                    PreferenceData.setData("showOnboard", "true");
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const PhoneScreen()));
                  },
                  child:  Text('Skip',style: GoogleFonts.jost(
                    color: AppColor.textColor,fontWeight: FontWeight.w500,
                    fontSize: AppConstants.SMALL
                  ),)),
            ),
          ),
          Expanded(
            child:
            PageView.builder(
                controller: pageController,
                itemCount: item.length,
                onPageChanged: (int i) {
                  setState(() {
                    currentIndex = i;
                  });
                },
                itemBuilder: (_, i) {
                  return item[i];})

          ),

          Padding(
            padding: const EdgeInsets.only(bottom: 32,left:  AppConstants.HORIZONTAL_PADDING,right:  AppConstants.HORIZONTAL_PADDING),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      item.length,
                          (index) => item.length > 1 ? buildDot(index, context) : const SizedBox(),
                    ),
                  ),
                ),
                currentIndex == 2?
                SizedBox(
                  height: 60,width: 200,
                  child: ElevatedButton(
                      style: ButtonStyle(
                          padding: const MaterialStatePropertyAll(EdgeInsets.symmetric(horizontal: 8)),
                          backgroundColor: MaterialStatePropertyAll<Color>(AppColor.primaryColor),
                          shape: MaterialStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(60),
                            ),
                          )

                      ),
                      onPressed: (){
                        PreferenceData.setData("showOnboard", "true");
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const PhoneScreen()));
                      },

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                              Text('Get Started',style: GoogleFonts.jost(
                                  color: Colors.white,
                                  fontSize: AppConstants.LARGE,
                                fontWeight: FontWeight.w500
                              ),),
                           const SizedBox(width: 18,),
                           Container(
                            height: 48,width: 48,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(60),
                              color: Colors.white
                            ),
                            child: Center(child: Icon(CupertinoIcons.arrow_right,size: 30,color: AppColor.primaryColor,)),
                          ),
                        ],
                      )),
                )
                    :  SizedBox(
                  height: 60,width: 60,
                  child: ElevatedButton(
                    style: ButtonStyle(

                      backgroundColor: MaterialStatePropertyAll<Color>(AppColor.primaryColor),
                      shape: MaterialStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                      )

                    ),
                      onPressed: (){
                        PreferenceData.setData("showOnboard", "true");
                        setState(() {
                          if (currentIndex < 3) {
                            _goToPage(currentIndex + 1);
                          }
                          if (currentIndex == 3){

                          }
                        });
                      },

                      child: const Center(
                    child: Icon(CupertinoIcons.arrow_right,size: 30,),
                  )),
                )
              ],
            ),
          )
        ],
      ),),

    );
  }
  Container buildDot(int index, BuildContext context) {
    return Container(
      height: currentIndex == index ? 10 : 10,
      width: currentIndex == index ? 20 : 10,
      margin: const EdgeInsets.all(3),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: currentIndex == index
              ? AppColor.primaryColor
              : AppColor.secondaryColor,
      ),
    );
  }
  List<Widget> item = [
    Padding(
      padding: const EdgeInsets.symmetric(horizontal:  AppConstants.HORIZONTAL_PADDING),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/logo.png',height: 150,width: 150,),
          const SizedBox(height: 24),
          Center(
            child: Text('Your two hands can save a life',style: GoogleFonts.jost(
                color: AppColor.textColor,
                fontWeight: FontWeight.w500,
                fontSize: AppConstants.XXLARGE
            ),),
          ),
          const SizedBox(height: 8,),
          Center(
            child: Text('Indian Resuscitation Council Federation promotes accurate and scientific resuscitation training & guidelines',
              textAlign: TextAlign.center,
              style: GoogleFonts.mulish(
                  color: AppColor.secondaryTextColor,
                  fontWeight: FontWeight.w500,
                  fontSize: AppConstants.SMALL
              ),),
          )
        ],
      ),
    ),
    Padding(
      padding: const EdgeInsets.symmetric(horizontal:  AppConstants.HORIZONTAL_PADDING),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/logo.png',height: 150,width: 150,),
          const SizedBox(height: 24),
              Text('COLS',style: GoogleFonts.jost(
                  color: AppColor.textColor,
                  fontWeight: FontWeight.w500,
                  fontSize: AppConstants.XXLARGE
              ),),
              Text('COLS Guidelines is for all citizens for cardiac arrest outside the hospital',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.mulish(
                  color: AppColor.secondaryTextColor,
                  fontWeight: FontWeight.w500,
                  fontSize: AppConstants.SMALL
              )),
         Container(
           margin: const EdgeInsets.symmetric(vertical: 16),
           height: 1,width: 200,color: AppColor.borderColor,
         ),


              Text('BCLS ',style: GoogleFonts.jost(
                  color: AppColor.textColor,
                  fontWeight: FontWeight.w500,
                  fontSize: AppConstants.XXLARGE
              ),),

              Text('BCLS Guidelines is for all Doctors and Paramedics for cardiac arrest outside the hospital',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.mulish(
                  color: AppColor.secondaryTextColor,
                  fontWeight: FontWeight.w500,
                  fontSize: AppConstants.SMALL
              )),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 16),
            height: 1,width: 200,color: AppColor.borderColor,
          ),

              Text('CCLS ',
                style: GoogleFonts.jost(
                    color: AppColor.textColor,
                    fontWeight: FontWeight.w500,
                    fontSize: AppConstants.XXLARGE
                ),),
              Text('CCLS Guidelines is for all doctors & paramedics cardiac arrest within the hospital',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.mulish(
                  color: AppColor.secondaryTextColor,
                  fontWeight: FontWeight.w500,
                  fontSize: AppConstants.SMALL
              )),
        ],
      ),
    ),

    Padding(
      padding: const EdgeInsets.symmetric(horizontal:  AppConstants.HORIZONTAL_PADDING),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/logo.png',height: 150,width: 150,),
          const SizedBox(height: 24),
          Center(
            child: Text('Goal of IRCF is to promote training and produce dexterity to all citizens in science of resuscitations for benefit of cardiac arrest victims.',
              style: GoogleFonts.jost(
                  color: AppColor.textColor,
                  fontWeight: FontWeight.w500,
                  fontSize: AppConstants.LARGE
              ),),
          ),
        ],
      ),
    ),
  ];
}
