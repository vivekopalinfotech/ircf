import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ircf/color/app_color.dart';
import 'package:ircf/constants/app_constants.dart';
import 'package:ircf/cubit/next_module/next_module_cubit.dart';
import 'package:ircf/cubit/next_module/next_module_state.dart';
import 'package:ircf/screens/Center/center_screen.dart';
import 'package:ircf/screens/my_courses/certificate.dart';
import 'package:ircf/screens/my_courses/my_courses.dart';
import 'package:ircf/screens/payment/payment.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class FinalExam extends StatefulWidget {
  final question;
  final studentId;
  final moduleId;
  final id;

  const FinalExam({super.key, this.question,this.studentId, this.moduleId, this.id,});

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
  var percentage;
  int correctAnswerCount = 0;
  var value;
  List detail = [];
  var text;
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
                          '${currentIndex+1}/${widget.question.length}',
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
                      itemCount: widget.question.length,
                      physics: const NeverScrollableScrollPhysics(),
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
                              Text('Question ${currentIndex+1}- ${widget.question[i].question}',style: GoogleFonts.mulish(
                                  color: AppColor.textColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: AppConstants.SMALL
                              ),),

                              ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: widget.question[i].answer_options.length,
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
                                          value: '${widget.question[i].question}'  '$index',
                                          groupValue: value,
                                          onChanged: (val) {

                                            setState(() => value = val);
                                            val = widget.question[i].answer_options[index].answer;
                                            text = val;
                                            detail.add('${widget.question[i].question}, $text');
                                            print(detail);


                                            setState(() {
                                              if (widget.question[i].answer_options[index].is_correct == 1) {
                                                print(correctAnswerCount);
                                                correctAnswerCount++;
                                              }
                                            });
                                            print(correctAnswerCount);
                                          },
                                          title: Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(widget.question[i].answer_options[index].answer,
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
                          if (currentIndex < widget.question.length) {
                            _goToPage(currentIndex + 1);
                          }
                          if (currentIndex == widget.question.length -1){

                            percentage = correctAnswerCount/widget.question.length*100;
                            print(percentage);

                            percentage > 85?
                            showDialog(
                                barrierDismissible: false,
                                context: context,
                                builder: (context) => AlertDialog(
                                  insetPadding: const EdgeInsets.symmetric(vertical: 70, horizontal: 34),
                                  contentPadding: EdgeInsets.zero,
                                  shape: OutlineInputBorder(borderRadius: BorderRadius.circular(36), borderSide: BorderSide.none),
                                  backgroundColor: Colors.white,
                                  content:
                            BlocConsumer<NextModuleCubit, NextModuleState>(listener: (context, state) async {
                            if (state is NextModuleSuccess) {
                              Navigator.of(context).pushAndRemoveUntil(
                                CupertinoPageRoute(
                                  builder: (BuildContext context) {
                                    return MyCourses(studentId: widget.studentId.toString(),type: 'update',id:widget.id);
                                  },
                                ),(_) => false,
                              );
                            }
                            if (state is NextModuleError) {}
                            }, builder: (context, state) {
                              return Container(
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
                                        padding: const EdgeInsets.only(top: 90),
                                        child: Image.asset(
                                          'assets/images/pass.png',
                                          height: 130,
                                          width: 180,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      Text(
                                        'Congratulations!',
                                        textScaleFactor: 1,
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.jost(color: AppColor.textColor, fontWeight: FontWeight.w500, fontSize: AppConstants.XXLARGE),
                                      ),
                                      Text(
                                        'you have successfully completed the course',
                                        textScaleFactor: 1,
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.jost(color: AppColor.textColor, fontWeight: FontWeight.w500, fontSize: AppConstants.LARGE),
                                      ),



                                      const SizedBox(
                                        height: 24,
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
                                              BlocProvider.of<NextModuleCubit>(context).nextModule(widget.studentId.toString(), widget.moduleId.toString()).whenComplete(() =>
                                                  Navigator.of(context).pop(true));
                                            },
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                const SizedBox(),
                                                Center(
                                                  child: Text('Next Module',
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
                              );})
                                )):
                            showDialog(
                                barrierDismissible: false,
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
                                          // image: const DecorationImage(
                                          //     fit: BoxFit.cover,
                                          //     image: AssetImage('assets/images/PROCESS.png'))
                                      ),
                                      child: SingleChildScrollView(
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(top: 100),
                                              child: Image.asset(
                                                'assets/images/fail.png',
                                                height: 180,
                                                width: 104,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 30,
                                            ),
                                            Text(
                                              'Sorry! You failed the exam',
                                              style: GoogleFonts.jost(color: AppColor.textColor, fontWeight: FontWeight.w500, fontSize: AppConstants.XXLARGE),
                                            ),
                                            const SizedBox(
                                              height: 12,
                                            ),

                                            Center(
                                              child: Text('Please go back and give exam again',
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
                                                    Navigator.of(context).pop(true);
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Align(
                                                        alignment: Alignment.centerLeft,
                                                        child: Container(
                                                          height: 48,width: 48,
                                                          decoration: BoxDecoration(
                                                              borderRadius: BorderRadius.circular(60),
                                                              color: Colors.white
                                                          ),
                                                          child: Center(child: Icon(CupertinoIcons.arrow_left,size: 30,color: AppColor.primaryColor,)),
                                                        ),
                                                      ),
                                                      Center(
                                                        child: Text('Go Back',
                                                          textScaleFactor: 1,
                                                          style: GoogleFonts.jost(
                                                              color: Colors.white,
                                                              fontSize: AppConstants.LARGE,
                                                              fontWeight: FontWeight.w500
                                                          ),),
                                                      ),
                                                      const SizedBox(),

                                                    ],
                                                  )),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ));
                            ;
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
/*

*/