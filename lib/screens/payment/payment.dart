import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ircf/color/app_color.dart';
import 'package:ircf/constants/app_constants.dart';
import 'package:ircf/cubit/payment/payment_cubit.dart';
import 'package:ircf/cubit/payment/payment_state.dart';
import 'package:ircf/screens/home/curriculum.dart';
import 'package:ircf/screens/home/dashboard.dart';
import 'package:ircf/screens/login/onboarding_screen.dart';
import 'package:ircf/utils/preferences_data.dart';
import 'package:ircf/widgets/title_bar.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class PaymentMethod extends StatefulWidget {
  final id;
  final img;
  final short_name;
  final name;
  final amount;
  const PaymentMethod({super.key, this.id, this.img, this.short_name, this.name, this.amount});

  @override
  State<PaymentMethod> createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  
  List<Payment> payment =[
    Payment('Google Pay'),
    Payment('Apple Pay'),
    Payment('Net Banking'),
  ];
  var value;
  var user_id;

  getUser()async{
    await PreferenceData.getData('user_id').then((value) {
      setState(() {
        user_id = value.toString();
      });
    });
  }
  @override
  void initState() {
    getUser();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {


    return  Scaffold(
      backgroundColor: AppColor.whiteBG,
      body:
      BlocConsumer<PaymentCubit, PaymentState>(listener: (context, state) async {
      if (state is PaymentSuccess) {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
              insetPadding: const EdgeInsets.symmetric(vertical: 70, horizontal: 34),
              contentPadding: EdgeInsets.zero,
              titlePadding: EdgeInsets.zero,
              shape: OutlineInputBorder(borderRadius: BorderRadius.circular(36), borderSide: BorderSide.none),
              backgroundColor: Colors.white,
              content: InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () {

                },
                child: Container(
                  height: 490,
                  width: 360,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(36),
                      color: Colors.white,
                      image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/images/SUCCESSFULLY.png'))),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 113),
                          child: SvgPicture.asset(
                            'assets/images/ICON.svg',
                            height: 116,
                            width: 131,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          'Congratulations',
                          textScaleFactor: 1,
                          style: GoogleFonts.jost(color: AppColor.textColor, fontWeight: FontWeight.w500, fontSize: AppConstants.XXLARGE),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Text(
                            'Your Payment is Successfully. Purchase a New Course',
                            textScaleFactor: 1,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.mulish(color: AppColor.secondaryTextColor, fontWeight: FontWeight.bold, fontSize: AppConstants.SMALL),
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: (){
                            pushNewScreen(context, screen: const Curriculum(type:'',amount: '',),pageTransitionAnimation: PageTransitionAnimation.fade,withNavBar: false);
                          },
                          child: Text(
                            'Watch the Course',
                            textScaleFactor: 1,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.jost(
                                color: AppColor.activeColor,
                                fontWeight: FontWeight.w500,
                                fontSize: AppConstants.SMALL,
                                decoration: TextDecoration.underline),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
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
                                Navigator.of(context).pushAndRemoveUntil(
                                  CupertinoPageRoute(
                                    builder: (BuildContext context) {
                                      return const OnboardingScreen();
                                    },
                                  ),(_) => false,
                                );
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const SizedBox(),
                                  Center(
                                    child: Text('Back to Home',
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
            )
        );

      }
      if (state is PaymentError) {}
    }, builder: (context, state) {
        return

      Stack(
        children: [
          Padding(
              padding: const EdgeInsets.only(top: 45, left: AppConstants.HORIZONTAL_PADDING, right: AppConstants.HORIZONTAL_PADDING),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                const TitleBar(
                  title: 'Payment Methods',
                ),
                const SizedBox(height: 18,),
                Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Card(
                            margin: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Row(
                                children: [
                                  Container(
                                    height: 100,width: 100,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),
                                      image: DecorationImage(
                                        image: NetworkImage(widget.img.toString())
                                      )
                                    ),
                                  ),
                                  const SizedBox(width: 12,),
                                  Flexible(child:
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(widget.short_name.toString(),
                                        textScaleFactor: 1,
                                        style: GoogleFonts.mulish(
                                            color: AppColor.activeColor,fontSize: AppConstants.XSMALL,
                                            fontWeight: FontWeight.bold
                                        ),),
                                      const SizedBox(height: 6,),
                                      Text(widget.name.toString(),
                                        textScaleFactor: 1,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: GoogleFonts.jost(
                                            color: AppColor.textColor,fontSize: AppConstants.LARGE,
                                            fontWeight: FontWeight.w500
                                        ),),

                                    ],
                                  ))
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 20,),
                          Text('Select the Payment Methods you Want to Use',
                          style: GoogleFonts.mulish(
                            fontSize: AppConstants.SMALL,
                            fontWeight: FontWeight.bold,
                            color: AppColor.secondaryTextColor
                          ),),
                          const SizedBox(height: 18),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: payment.length,
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
                                    title: Text(payment[index].title,
                                      style:  GoogleFonts.mulish(
                                        color: AppColor.textColor,
                                          fontSize: AppConstants.SMALL, fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              );

                          })
                        ],
                      ),
                    ))
              ])),
          Positioned(
            bottom: 36,left: 0,right: 0,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 32),
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
                    BlocProvider.of<PaymentCubit>(context).payment(user_id, widget.id,);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(width: 48,),
                      Center(
                        child: Text('Enroll Course  ₹ ${widget.amount}',
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
            ),
          ),
          // Positioned(
          //   bottom: 100,right: MediaQuery.of(context).size.width*.10,
          //   child: SizedBox(
          //     height: 63,width: 63,
          //     child:
          //     ElevatedButton(
          //       style: ButtonStyle(
          //         padding: const MaterialStatePropertyAll(EdgeInsets.symmetric(horizontal: 8)),
          //         backgroundColor: MaterialStatePropertyAll<Color>(AppColor.primaryColor),
          //         shape: MaterialStatePropertyAll(
          //           RoundedRectangleBorder(
          //             borderRadius: BorderRadius.circular(60),
          //           ),
          //         ),
          //       ),
          //       onPressed: () {  },
          //       child:  Center(
          //         child: SvgPicture.asset('assets/images/add.svg',color: Colors.white,),
          //       ),
          //     ),
          //   ),),
        ],
      );}),

    );
  }

}

class Payment{
final title;

  Payment(this.title);
}
