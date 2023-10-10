import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:ircf/color/app_color.dart';
import 'package:ircf/constants/app_constants.dart';
import 'package:ircf/dashboard.dart';
import 'package:ircf/widgets/title_bar.dart';
enum Gender { Male, Female, Other }
class FillProfile extends StatefulWidget {
  const FillProfile({super.key});

  @override
  State<FillProfile> createState() => _FillProfileState();
}

class _FillProfileState extends State<FillProfile> {
  final fullNameController = TextEditingController();
  final nickNameController = TextEditingController();
  final dobController = TextEditingController();
  final emailController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  Gender selectedGender = Gender.Male;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColor.whiteBG,
      body: Padding(
        padding: const EdgeInsets.only(top: 45,bottom: 32,left: AppConstants.HORIZONTAL_PADDING,right: AppConstants.HORIZONTAL_PADDING),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:  [
            const TitleBar(title: 'Fill Your Profile',),

            Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(height: 42,),
                        Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: Image.asset('assets/images/Profile.png',height: 100,width: 100,),
                            ),
                            Positioned(bottom: 5,right: 5,
                              child: CircleAvatar(
                                backgroundColor: AppColor.tealColor,
                                radius: 12,
                                child: Center(
                                  child: Image.asset('assets/images/Icon.png',height: 14,width: 14,),
                                ),
                              ),)
                          ],
                        ),
                        const SizedBox(height: 30,),
                        Container(
                          height: 60,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(12))),
                          child: MediaQuery(
                            data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
                            child: TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              controller: fullNameController,
                              autofocus: false,
                              style: GoogleFonts.montserrat(
                                color: Colors.black,
                                fontStyle: FontStyle.normal,
                                fontSize: AppConstants.SMALL,
                                fontWeight: FontWeight.w400,
                              ),

                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                hintText: 'Full Name',
                                hintStyle: GoogleFonts.montserrat(
                                  color:  AppColor.hintColor,
                                  fontStyle: FontStyle.normal,
                                  fontSize: AppConstants.SMALL,
                                  fontWeight: FontWeight.w400,
                                ),

                                focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.transparent, width: 1.0),
                                    borderRadius: BorderRadius.all(Radius.circular(12))),
                                enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.transparent), borderRadius: BorderRadius.all(Radius.circular(30))),
                                counterText: "",
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20,),
                        Container(
                          height: 60,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(12))),
                          child: MediaQuery(
                            data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
                            child: TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              controller: nickNameController,
                              autofocus: false,
                              style: GoogleFonts.montserrat(
                                color: Colors.black,
                                fontStyle: FontStyle.normal,
                                fontSize: AppConstants.SMALL,
                                fontWeight: FontWeight.w400,
                              ),
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                hintText: 'Nick Name',
                                hintStyle: GoogleFonts.montserrat(
                                  color:  AppColor.hintColor,
                                  fontStyle: FontStyle.normal,
                                  fontSize: AppConstants.SMALL,
                                  fontWeight: FontWeight.w400,
                                ),
                                focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.transparent, width: 1.0),
                                    borderRadius: BorderRadius.all(Radius.circular(12))),
                                enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.transparent), borderRadius: BorderRadius.all(Radius.circular(30))),
                                counterText: "",
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20,),
                        Container(
                          height: 60,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(12))),
                          child: MediaQuery(
                            data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
                            child: TextFormField(

                              keyboardType: TextInputType.emailAddress,
                              controller: dobController,
                              autofocus: false,
                              style: GoogleFonts.montserrat(
                                color: Colors.black,
                                fontStyle: FontStyle.normal,
                                fontSize: AppConstants.SMALL,
                                fontWeight: FontWeight.w400,
                              ),

                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                hintText: 'Date of Birth',
                                hintStyle: GoogleFonts.montserrat(
                                  color:  AppColor.hintColor,
                                  fontStyle: FontStyle.normal,
                                  fontSize: AppConstants.SMALL,
                                  fontWeight: FontWeight.w400,
                                ),

                                prefixIconConstraints: const BoxConstraints(  minWidth: 50,
                                  minHeight: 20,),
                                prefixIcon: SvgPicture.asset('assets/images/dob.svg',),
                                focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.transparent, width: 1.0),
                                    borderRadius: BorderRadius.all(Radius.circular(12))),
                                enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.transparent), borderRadius: BorderRadius.all(Radius.circular(30))),
                                counterText: "",
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20,),
                        Container(
                          height: 60,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(12))),
                          child: MediaQuery(
                            data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
                            child: TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              controller: emailController,
                              autofocus: false,
                              style: GoogleFonts.montserrat(
                                color: Colors.black,
                                fontStyle: FontStyle.normal,
                                fontSize: AppConstants.SMALL,
                                fontWeight: FontWeight.w400,
                              ),
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                prefixIcon: SvgPicture.asset(
                                 'assets/images/email.svg',
                                  color: AppColor.hintColor,
                                ),
                                prefixIconConstraints: const BoxConstraints(
                                  minWidth: 50,
                                  minHeight: 14,
                                ),

                                hintText: 'Email',
                                hintStyle: GoogleFonts.montserrat(
                                  color: AppColor.hintColor,
                                  fontStyle: FontStyle.normal,
                                  fontSize: AppConstants.SMALL,
                                  fontWeight: FontWeight.w400,
                                ),
                                focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.transparent, width: 1.0),
                                    borderRadius: BorderRadius.all(Radius.circular(12))),
                                enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.transparent), borderRadius: BorderRadius.all(Radius.circular(30))),
                                counterText: "",
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20,),
                        IntlPhoneField(
                          style: GoogleFonts.jost(
                              color: Colors.black
                          ),
                          dropdownTextStyle: GoogleFonts.jost(
                              color: Colors.black
                          ),
                          dropdownDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          flagsButtonMargin: EdgeInsets.zero,
                          flagsButtonPadding: const EdgeInsets.all(8),
                          dropdownIconPosition: IconPosition.trailing,
                          dropdownIcon: const Icon(Icons.keyboard_arrow_down_rounded,color:Color.fromRGBO(29, 29, 27, 1)),
                          decoration:  InputDecoration(
                            labelText: 'Phone Number',
                            labelStyle: GoogleFonts.jost(
                                color: Colors.black.withOpacity(.50)
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(12)
                            ),
                          ),
                          initialCountryCode: 'US',
                          pickerDialogStyle: PickerDialogStyle(backgroundColor: AppColor.secondaryColor,
                              countryCodeStyle: GoogleFonts.jost(color: Colors.black),
                              countryNameStyle: GoogleFonts.jost(color: Colors.black),
                              searchFieldPadding: EdgeInsets.zero,
                              searchFieldInputDecoration: InputDecoration(
                                hintStyle: GoogleFonts.jost(
                                  color: Colors.black,
                                ),
                                floatingLabelStyle: GoogleFonts.jost(
                                    color: Colors.black
                                ),
                                prefixIconColor: Colors.black,
                                labelStyle: GoogleFonts.jost(
                                    color: Colors.black
                                ),
                              )),

                          onChanged: (phone) {
                            print(phone.completeNumber);
                          },
                        ),

                        Container(
                          height: 60,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(12))),
                          child: MediaQuery(
                            data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
                            child: DropdownButtonFormField<Gender>(
                              style: GoogleFonts.jost(
                                color: Colors.black
                              ),
                              decoration: const InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                              ),
                              iconEnabledColor: AppColor.secondaryTextColor,
                              iconSize: 26,
                              dropdownColor: Colors.white,

                              value: selectedGender,
                              onChanged: (Gender? newValue) {
                                setState(() {
                                  selectedGender = newValue!;
                                  genderController.text = newValue.toString().split('.')[1]; // Set the controller text
                                });
                              },

                              items: Gender.values.map<DropdownMenuItem<Gender>>((Gender gender) {
                                return DropdownMenuItem<Gender>(
                                  value: gender,
                                  child: Text(gender.toString().split('.')[1]), // Display text in the dropdown
                                );
                              }).toList(),
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                ),

            SizedBox(
              height: 60,width: MediaQuery.of(context).size.width,
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
                    showDialog(
                        context: context,
                        builder: (context) =>
                            AlertDialog(
                              insetPadding: const EdgeInsets.symmetric(vertical: 70, horizontal: 16),
                              contentPadding: EdgeInsets.zero,
                              shape: OutlineInputBorder(borderRadius: BorderRadius.circular(36), borderSide: BorderSide.none),
                              backgroundColor:  Colors.white,
                              content:  InkWell(
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => Dashboard()));
                                },
                                child: Container(
                                  height: 460,width: 360,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(36),
                                    color: Colors.white,
                                    image: const DecorationImage(image: AssetImage('assets/images/PROCESS.png'))
                                  ),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        Padding(padding: const EdgeInsets.only(top: 62),
                                        child: Image.asset('assets/images/success_profile.png',height: 153,width: 153,),),
                                        const SizedBox(height: 30,),
                                        Text('Congratulations',style: GoogleFonts.jost(
                                            color: AppColor.textColor,
                                            fontWeight: FontWeight.w500,
                                            fontSize: AppConstants.XXLARGE
                                        ),),
                                        const SizedBox(height: 12,),
                                        Padding(padding: const EdgeInsets.symmetric(horizontal: 40),
                                        child:  Text('Your Account is Ready to Use. You will be redirected to the Home Page in a Few Seconds.',
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.mulish(
                                            color: AppColor.secondaryTextColor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: AppConstants.SMALL
                                        ),),
                                        ),
                                        const SizedBox(height: 25,),
                                        CupertinoActivityIndicator(color: AppColor.textColor,radius: 20,)
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            )
                    );
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
            )
          ],
        ),
      ),
    );
  }
}
