// ignore_for_file: use_build_context_synchronously

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:ircf/color/app_color.dart';
import 'package:ircf/constants/app_constants.dart';
import 'package:ircf/cubit/login/login_cubit.dart';
import 'package:ircf/cubit/login/login_state.dart';
import 'package:ircf/main.dart';
import 'package:ircf/main_screen.dart';
import 'package:ircf/model/user_response.dart';
import 'package:ircf/screens/login/fill_profile.dart';
import 'package:ircf/screens/login/onboarding_screen.dart';
import 'package:ircf/utils/preferences_data.dart';
import 'package:ircf/widgets/otp_input.dart';
import 'package:ircf/widgets/show_snackbar.dart';
import 'package:ircf/widgets/title_bar.dart';

class OtpScreen extends StatefulWidget {
  final mobile;
  const OtpScreen({super.key, this.mobile});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final TextEditingController _fieldOne = TextEditingController();
  final TextEditingController _fieldTwo = TextEditingController();
  final TextEditingController _fieldThree = TextEditingController();
  final TextEditingController _fieldFour = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  String? otp;
  bool isLoading = false;
  @override
  void initState() {
    phoneController.text =  widget.mobile;
    super.initState();
  }
  _setPreferenceData(UserResponse? response) async {
    PreferenceData.setData('user_id', response!.user!.id.toString());
    PreferenceData.setData('user_name', response.user!.ppl_name.toString());
    PreferenceData.setData('user_mobile', response.user!.mobile.toString());
    PreferenceData.setData('user_dob', response.user!.ppl_dob.toString());
    PreferenceData.setData('user_email', response.user!.email.toString());
    PreferenceData.setData('user_gender', response.user!.ppl_gender.toString());
    PreferenceData.setData('user_type', response.user!.user_type.toString());
    token = response.access_token??'';
    PreferenceData.setData('token', token);
    PreferenceData.setData('login', 'true');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteBG,
      body:

        Padding(
        padding: const EdgeInsets.only(top: 45,bottom: 32,left: AppConstants.HORIZONTAL_PADDING,right: AppConstants.HORIZONTAL_PADDING),
        child: Column(
          children: [
            const TitleBar(title: 'Enter OTP',),
            BlocConsumer<LoginCubit, LoginState>(listener: (context, state) async {
              if (state is LoginSuccess) {
                _setPreferenceData(state.userResponse);
                var data = '';
                await PreferenceData.getData('showOnboard').then((value) {
                  setState(() {
                    data = value.toString();
                  });
                });

                if (data == "true") {
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const MainScreen(redirectPageName: "home")),
                      ModalRoute.withName("/Home"));
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const OnboardingScreen()),
                  );
                }

                // if(phoneController.text.isNotEmpty && otp!.isNotEmpty){
                //   Navigator.push(context, MaterialPageRoute(builder: (context) =>  const MainScreen(redirectPageName: 'home',)));
                // }
              }
              if (state is LoginError) {
                setState(() {
                  isLoading = false;
                });
                showSnackBar(context, state.message);
              }
              if(state is LoginLoading){
                setState(() {
                  isLoading = true;
                });
                if(isLoading){
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        insetPadding: const EdgeInsets.symmetric(vertical: 70, horizontal: 16),
                        contentPadding: EdgeInsets.zero,
                        shape: OutlineInputBorder(borderRadius: BorderRadius.circular(36), borderSide: BorderSide.none),
                        backgroundColor: Colors.white,
                        content: Container(
                          height: 460,
                          width: 360,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(36), color: Colors.white, image: const DecorationImage(image: AssetImage('assets/images/PROCESS.png'))),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 62),
                                  child: Image.asset(
                                    'assets/images/success_profile.png',
                                    height: 153,
                                    width: 153,
                                  ),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                Text(
                                  'Congratulations',
                                  style: GoogleFonts.jost(color: AppColor.textColor, fontWeight: FontWeight.w500, fontSize: AppConstants.XXLARGE),
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 40),
                                  child: Text(
                                    'Your Account is Ready to Use. You will be redirected to the Home Page in a Few Seconds.',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.mulish(color: AppColor.secondaryTextColor, fontWeight: FontWeight.bold, fontSize: AppConstants.SMALL),
                                  ),
                                ),
                                const SizedBox(
                                  height: 25,
                                ),
                                CupertinoActivityIndicator(
                                  color: AppColor.textColor,
                                  radius: 20,
                                )
                              ],
                            ),
                          ),
                        ),

                      ));
                }
              }
            }, builder: (context, state) {
              return   Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(padding: const EdgeInsets.only(top: 110,bottom: 80),
                      child: SizedBox(
                        height: 40,
                        child: Text('Enter a OTP Number to Login',style: GoogleFonts.mulish(
                          color: AppColor.secondaryTextColor,
                          fontSize: AppConstants.SMALL,fontWeight: FontWeight.bold
                        ),),
                      ),),
                    IntlPhoneField(
                      style: GoogleFonts.jost(color: Colors.black),
                      dropdownTextStyle: GoogleFonts.jost(color: Colors.black),
                      dropdownDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      disableLengthCheck: true,
                      flagsButtonMargin: EdgeInsets.zero,
                      flagsButtonPadding: const EdgeInsets.all(8),
                      dropdownIconPosition: IconPosition.trailing,
                      dropdownIcon: const Icon(Icons.keyboard_arrow_down_rounded, color: Color.fromRGBO(29, 29, 27, 1)),
                      decoration: InputDecoration(
                        labelText: phoneController.text.isNotEmpty?'':'Phone Number',
                        labelStyle: GoogleFonts.jost(color: Colors.black.withOpacity(.50)),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.circular(12)),
                      ),
                      initialCountryCode: 'IN',
                      pickerDialogStyle: PickerDialogStyle(
                          backgroundColor: AppColor.secondaryColor,
                          countryCodeStyle: GoogleFonts.jost(color: Colors.black),
                          countryNameStyle: GoogleFonts.jost(color: Colors.black),
                          searchFieldPadding: EdgeInsets.zero,
                          searchFieldInputDecoration: InputDecoration(
                            hintStyle: GoogleFonts.jost(
                              color: Colors.black,
                            ),
                            floatingLabelStyle: GoogleFonts.jost(color: Colors.black),
                            prefixIconColor: Colors.black,
                            labelStyle: GoogleFonts.jost(color: Colors.black),
                          )),
                      controller: phoneController,
                      onChanged: (phone) {
                        print(phone.completeNumber);

                      },
                    ),
                    const SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        OtpInput(_fieldOne, true),
                        OtpInput(_fieldTwo, false),
                        OtpInput(_fieldThree, false),
                        OtpInput(_fieldFour, false)
                      ],
                    ),

                  ],
                ),
              )
            );
            }
            )


          ],
        ),
      ),
      floatingActionButton:  Container(
        height: 60,width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.only(left: 60,right: 30,bottom: 10),
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
              setState(() {
                otp = _fieldOne.text +
                    _fieldTwo.text +
                    _fieldThree.text +
                    _fieldFour.text;
              });
              BlocProvider.of<LoginCubit>(context).login(phoneController.text,otp.toString());
            },

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(width: 48,),
                Center(
                  child: Text('Continue',style: GoogleFonts.jost(
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
    );
  }
}
