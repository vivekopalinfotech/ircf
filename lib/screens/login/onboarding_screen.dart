import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ircf/color/app_color.dart';
import 'package:ircf/constants/app_constants.dart';
import 'package:ircf/screens/login/phone_screen.dart';
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

  List<Onboard> item = [
    Onboard('Online Learning', 'We Provide Classes Online Classes and Pre Recorded Lectures.!'),
    Onboard('Learn from Anytime', 'Booked or Same the Lectures for Future'),
    Onboard('Get Online Certificate', 'Analyse your scores and Track your results'),

  ];
  PageController pageController = PageController();
  int currentIndex = 0;
  void _goToPage(int pageIndex) {
    pageController.animateToPage(
      pageIndex,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteBG,
      body: Padding(padding: const EdgeInsets.only(top: 70,left: AppConstants.HORIZONTAL_PADDING,right: AppConstants.HORIZONTAL_PADDING),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: InkWell(
              splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const PhoneScreen()));
                },
                child:  Text('Skip',style: GoogleFonts.jost(
                  color: AppColor.textColor,fontWeight: FontWeight.w500,
                  fontSize: AppConstants.SMALL
                ),)),
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
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Text(item[i].title,style: GoogleFonts.jost(
                            color: AppColor.textColor,
                            fontWeight: FontWeight.w500,
                            fontSize: AppConstants.XXLARGE
                        ),),
                      ),
                      const SizedBox(height: 8,),
                      Center(
                        child: Text(item[i].subtitle,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.mulish(
                              color: AppColor.secondaryTextColor,
                              fontWeight: FontWeight.bold,
                              fontSize: AppConstants.SMALL
                          ),),
                      )
                    ],
                  );})

          ),

          Padding(
            padding: const EdgeInsets.only(bottom: 32),
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

}
