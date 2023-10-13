import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ircf/color/app_color.dart';
import 'package:ircf/constants/app_constants.dart';
import 'package:ircf/screens/Center/center_screen.dart';
import 'package:ircf/screens/my_courses/certificate.dart';
import 'package:ircf/screens/payment/payment.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class FinalExam extends StatefulWidget {
  const FinalExam({super.key});

  @override
  State<FinalExam> createState() => _FinalExamState();
}

class _FinalExamState extends State<FinalExam> {
  PageController pageController = PageController();
  int currentIndex = 0;
  void _goToPage(int pageIndex) {
    pageController.animateToPage(
      pageIndex,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  List<Payment> option =[
    Payment('Option 1'),
    Payment('Option 2'),
    Payment('Option 3'),
    Payment('Option 4'),
  ];
  var value;
  int total = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.whiteBG,
        body: Padding(
            padding: const EdgeInsets.only(
              top: 45,bottom: 30
            ),
            child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
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
                            ' Final Exam',
                            style: GoogleFonts.jost(color: AppColor.textColor, fontWeight: FontWeight.w500, fontSize: 21),
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                        flex: 1,
                        child: Text(
                          '${currentIndex+1}/${total}',
                          textScaleFactor: 1,
                          style: GoogleFonts.mulish(color: AppColor.textColor, fontWeight: FontWeight.bold, fontSize: 16),
                        ))
                  ],
                ),
              ),
              const SizedBox(height: 25,),
              Expanded(
                  child:
                  PageView.builder(
                      controller: pageController,
                      itemCount: total,
                      onPageChanged: (int i) {
                        setState(() {
                          currentIndex = i;
                        });
                      },
                      itemBuilder: (_, i) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: AppConstants.HORIZONTAL_PADDING),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Question ${currentIndex+1}-',style: GoogleFonts.mulish(
                                  color: AppColor.textColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: AppConstants.SMALL
                              ),),

                              ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: option.length,
                                  itemBuilder: (context,index){
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 6),
                                      child: Card(
                                        margin: EdgeInsets.zero,
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                        color: Colors.white,

                                        child: RadioListTile(

                                          activeColor: AppColor.activeColor,
                                          controlAffinity: ListTileControlAffinity.leading,
                                          value: index,
                                          groupValue: value,
                                          onChanged: (ind) {
                                            setState(() => value = ind);
                                          },
                                          title: Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(option[index].title,
                                              style:  GoogleFonts.mulish(
                                                  color: AppColor.textColor,
                                                  fontSize: AppConstants.SMALL, fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      ),
                                    );

                                  })
                            ],
                          ),
                        );})

              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 48 ),
                child: SizedBox(
                  height: 60,width: MediaQuery.of(context).size.width,
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
                          if (currentIndex < 5) {
                            _goToPage(currentIndex + 1);
                          }
                          if (currentIndex == 4){
                            showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  insetPadding: const EdgeInsets.symmetric(vertical: 70, horizontal: 34),
                                  contentPadding: EdgeInsets.zero,
                                  shape: OutlineInputBorder(borderRadius: BorderRadius.circular(36), borderSide: BorderSide.none),
                                  backgroundColor: Colors.white,
                                  content: InkWell(
                                    splashColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () {

                                    },
                                    child: Container(
                                      height: 500,
                                      width: 360,
                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(36),
                                          color: Colors.white,
                                          image: const DecorationImage(
                                            fit: BoxFit.cover,
                                              image: AssetImage('assets/images/PROCESS.png'))),
                                      child: SingleChildScrollView(
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(top: 105),
                                              child: SvgPicture.asset(
                                                'assets/images/headphones.svg',
                                                height: 105,
                                                width: 104,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 30,
                                            ),
                                            Text(
                                              'Course Completed',
                                              style: GoogleFonts.jost(color: AppColor.textColor, fontWeight: FontWeight.w500, fontSize: AppConstants.XXLARGE),
                                            ),
                                            const SizedBox(
                                              height: 12,
                                            ),

                                            InkWell(
                                              onTap: (){
                                                pushNewScreen(context, screen: const Certificate(title: 'Certificate'),pageTransitionAnimation: PageTransitionAnimation.fade,withNavBar: false);
                                              },
                                              child: Text(
                                                'View Certificate',
                                                textScaleFactor: 1,
                                                textAlign: TextAlign.center,
                                                style: GoogleFonts.jost(
                                                    color: AppColor.tealColor,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: AppConstants.SMALL,
                                                    decoration: TextDecoration.underline),
                                              ),
                                            ),
                                            Divider(
                                              color: AppColor.cardColor,
                                              height: 54,
                                            ),
                                            Center(
                                              child: Text('Please search center for practical course',
                                                textScaleFactor: 1,
                                                style: GoogleFonts.mulish(
                                                    color: AppColor.secondaryTextColor,
                                                    fontSize: AppConstants.SMALL,
                                                    fontWeight: FontWeight.bold
                                                ),),
                                            ),
                                            const SizedBox(
                                              height: 14,
                                            ),
                                            Container(
                                              margin: const EdgeInsets.symmetric(horizontal: 65),
                                              height: 60,
                                              width: MediaQuery.of(context).size.width,
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
                                                    pushNewScreen(context, screen: const CenterScreen(),pageTransitionAnimation: PageTransitionAnimation.fade,withNavBar: true);
                                                  },
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      const SizedBox(),
                                                      Center(
                                                        child: Text('Select Center',
                                                          textScaleFactor: 1,
                                                          style: GoogleFonts.jost(
                                                              color: Colors.white,
                                                              fontSize: AppConstants.LARGE,
                                                              fontWeight: FontWeight.w500
                                                          ),),
                                                      ),

                                                      Align(
                                                        alignment: Alignment.centerRight,
                                                        child: Container(
                                                          height: 48,width: 48,
                                                          decoration: BoxDecoration(
                                                              borderRadius: BorderRadius.circular(60),
                                                              color: Colors.white
                                                          ),
                                                          child: Center(child: Icon(CupertinoIcons.arrow_right,size: 30,color: AppColor.primaryColor,)),
                                                        ),
                                                      ),
                                                    ],
                                                  )),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ));
                          }
                        });
                      },

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(width: 50,),
                          Text('Continue',style: GoogleFonts.jost(
                              color: Colors.white,
                              fontSize: AppConstants.LARGE,
                              fontWeight: FontWeight.w500
                          ),),

                          Container(
                            margin: EdgeInsets.zero,
                            height: 48,width: 48,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(60),
                                color: Colors.white
                            ),
                            child: Center(child: Icon(CupertinoIcons.arrow_right,size: 30,color: AppColor.primaryColor,)),
                          ),
                        ],
                      )),

                ),
              )
            ])));
  }
}
