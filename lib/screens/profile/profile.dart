import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ircf/color/app_color.dart';
import 'package:ircf/constants/app_constants.dart';
import 'package:ircf/main.dart';
import 'package:ircf/screens/login/phone_screen.dart';
import 'package:ircf/screens/notification/notification.dart';
import 'package:ircf/screens/profile/edit_profile.dart';
import 'package:ircf/screens/profile/terms_condition.dart';
import 'package:ircf/utils/preferences_data.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final ImagePicker _picker = ImagePicker();
  File? imageFile;
  String name = '';
  String email = '';
  String dob = '';
  String mobile = '';
  String gender = '';
  String user_type = '';

  @override
  Widget build(BuildContext context) {
     PreferenceData.getData('user_name').then((value) {
      setState(() {
        name = value.toString();
      });
    });
     PreferenceData.getData('user_email').then((value) {
       setState(() {
         email = value.toString();
       });
     });
      PreferenceData.getData('user_dob').then((value) {
       setState(() {
         dob = value.toString();
       });
     });

      PreferenceData.getData('user_mobile').then((value) {
       setState(() {
         mobile = value.toString();
       });
     });
      PreferenceData.getData('user_gender').then((value) {
       setState(() {
         gender = value.toString();
       });
     });
      PreferenceData.getData('user_type').then((value) {
       setState(() {
         user_type = value.toString();
       });
     });

    return Scaffold(
        backgroundColor: AppColor.whiteBG,
        body: Stack(
          children: [
                Padding(
                padding: const EdgeInsets.only(
                  top: 45,
                ),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start, children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: AppConstants.HORIZONTAL_PADDING),
                    child: Text(
                      'Profile',
                      textScaleFactor: 1,
                      style: GoogleFonts.jost(color: AppColor.textColor, fontWeight: FontWeight.w500, fontSize: 21),
                    ),
                  ),
                  const SizedBox(
                    height: 54,
                  ),
                      Expanded(child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: AppConstants.HORIZONTAL_PADDING),
                          child: Card(
                            margin: EdgeInsets.zero,
                            elevation: 1,
                            clipBehavior: Clip.antiAlias,
                            shape:  OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
                            color: Colors.white,
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: Column(
                                children: [
                                  const SizedBox(height: 87),
                                  Text(name,
                                  style: GoogleFonts.jost(
                                    fontSize: AppConstants.XXLARGE,
                                    fontWeight: FontWeight.w500,
                                    color: AppColor.textColor
                                  ),),
                                  const SizedBox(height: 4,),
                                  Text(email,
                                    style: GoogleFonts.mulish(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                        color: AppColor.secondaryTextColor
                                    ),),
                                  const SizedBox(height: 26,),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 30),
                                    child: Column(
                                      children: [

                                      InkWell(
                                        splashColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: (){
                                          pushNewScreen(context, screen:  EditProfile(name: name, email: email, dob: dob,
                                            mobile: mobile, gender: gender , user_type: user_type,),pageTransitionAnimation: PageTransitionAnimation.fade,withNavBar: false);
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.only(bottom: 18.0),

                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Flexible(
                                                child: Row(
                                                  children: [
                                                    SvgPicture.asset('assets/images/profile.svg'),
                                                    const SizedBox(width: 14,),
                                                    Flexible(
                                                      child: Text('Edit Profile',
                                                      maxLines: 1,
                                                        textScaleFactor: 1,
                                                        overflow: TextOverflow.ellipsis,
                                                        style: GoogleFonts.mulish(
                                                        fontSize: 15,
                                                        fontWeight: FontWeight.bold,
                                                        color: AppColor.textColor
                                                      ),),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              SvgPicture.asset('assets/images/right_arrow.svg')
                                            ],
                                          ),)
                                        ),

                                    InkWell(
                                      splashColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: (){

                                      },
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(vertical: 18.0),
                                        child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Flexible(
                                                child: Row(
                                                  children: [
                                                    SvgPicture.asset('assets/images/payment.svg'),
                                                    const SizedBox(width: 14,),
                                                    Flexible(
                                                      child: Text('Payment Option',
                                                        maxLines: 1,
                                                        textScaleFactor: 1,
                                                        overflow: TextOverflow.ellipsis,
                                                        style: GoogleFonts.mulish(
                                                            fontSize: 15,
                                                            fontWeight: FontWeight.bold,
                                                            color: AppColor.textColor
                                                        ),),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              SvgPicture.asset('assets/images/right_arrow.svg')
                                            ],
                                          )),
                                        ),

                                    InkWell(
                                      splashColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: (){
                                        pushNewScreen(context, screen: const Notifications(),withNavBar: false,pageTransitionAnimation: PageTransitionAnimation.fade);
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(vertical: 18.0),

                                        child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Flexible(
                                                child: Row(
                                                  children: [
                                                    SvgPicture.asset('assets/images/notification.svg'),
                                                    const SizedBox(width: 14,),
                                                    Flexible(
                                                      child: Text('Notifications',
                                                        maxLines: 1,
                                                        textScaleFactor: 1,
                                                        overflow: TextOverflow.ellipsis,
                                                        style: GoogleFonts.mulish(
                                                            fontSize: 15,
                                                            fontWeight: FontWeight.bold,
                                                            color: AppColor.textColor
                                                        ),),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              SvgPicture.asset('assets/images/right_arrow.svg')
                                            ],
                                          ),)
                                        ),

                                    InkWell(
                                      splashColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: (){

                                      },
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(vertical: 18.0),

                                        child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Flexible(
                                                child: Row(
                                                  children: [
                                                    SvgPicture.asset('assets/images/security.svg'),
                                                    const SizedBox(width: 14,),
                                                    Flexible(
                                                      child: Text('Security',
                                                        maxLines: 1,
                                                        textScaleFactor: 1,
                                                        overflow: TextOverflow.ellipsis,
                                                        style: GoogleFonts.mulish(
                                                            fontSize: 15,
                                                            fontWeight: FontWeight.bold,
                                                            color: AppColor.textColor
                                                        ),),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              SvgPicture.asset('assets/images/right_arrow.svg')
                                            ],
                                          ),
                                        )),

                                        InkWell(
                                          splashColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: (){
                                            pushNewScreen(context, screen: const TermsCondition(),pageTransitionAnimation: PageTransitionAnimation.fade,withNavBar: false);
                                          },
                                          child: Container(
                                          padding: const EdgeInsets.symmetric(vertical: 18.0),
                                          child:  Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Flexible(
                                                  child: Row(
                                                    children: [
                                                      SvgPicture.asset('assets/images/terms.svg'),
                                                      const SizedBox(width: 14,),
                                                      Flexible(
                                                        child: Text('Terms & Conditions',
                                                          maxLines: 1,
                                                          textScaleFactor: 1,
                                                          overflow: TextOverflow.ellipsis,
                                                          style: GoogleFonts.mulish(
                                                              fontSize: 15,
                                                              fontWeight: FontWeight.bold,
                                                              color: AppColor.textColor
                                                          ),),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                SvgPicture.asset('assets/images/right_arrow.svg')
                                              ],
                                            ),
                                          ),
                                        ),

                                    InkWell(
                                      splashColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: (){

                                      },
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(vertical: 18.0),

                                        child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Flexible(
                                                child: Row(
                                                  children: [
                                                    SvgPicture.asset('assets/images/help.svg'),
                                                    const SizedBox(width: 14,),
                                                    Flexible(
                                                      child: Text('Help Center',
                                                        maxLines: 1,
                                                        textScaleFactor: 1,
                                                        overflow: TextOverflow.ellipsis,
                                                        style: GoogleFonts.mulish(
                                                            fontSize: 15,
                                                            fontWeight: FontWeight.bold,
                                                            color: AppColor.textColor
                                                        ),),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              SvgPicture.asset('assets/images/right_arrow.svg')
                                            ],
                                          )),
                                        ),

                                    InkWell(
                                      splashColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: (){

                                      },
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(vertical: 18.0),

                                        child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Flexible(
                                                child: Row(
                                                  children: [
                                                    SvgPicture.asset('assets/images/invite.svg'),
                                                    const SizedBox(width: 14,),
                                                    Flexible(
                                                      child: Text('Invite Friends',
                                                        maxLines: 1,
                                                        textScaleFactor: 1,
                                                        overflow: TextOverflow.ellipsis,
                                                        style: GoogleFonts.mulish(
                                                            fontSize: 15,
                                                            fontWeight: FontWeight.bold,
                                                            color: AppColor.textColor
                                                        ),),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              SvgPicture.asset('assets/images/right_arrow.svg')
                                            ],
                                          )),
                                        ),
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: ()async{

                                            showAlertDialog1(context);
                                          },
                                          child: Container(
                                              padding: const EdgeInsets.symmetric(vertical: 18.0),

                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Flexible(
                                                    child: Row(
                                                      children: [
                                                        const Icon(Icons.logout_outlined),
                                                        const SizedBox(width: 14,),
                                                        Flexible(
                                                          child: Text('Log Out',
                                                            maxLines: 1,
                                                            textScaleFactor: 1,
                                                            overflow: TextOverflow.ellipsis,
                                                            style: GoogleFonts.mulish(
                                                                fontSize: 15,
                                                                fontWeight: FontWeight.bold,
                                                                color: AppColor.textColor
                                                            ),),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  SvgPicture.asset('assets/images/right_arrow.svg')
                                                ],
                                              )),
                                        ),
                                        const SizedBox(height: 36,),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      ))

                ])),
            Positioned(
              left: 0,right: 0,top: MediaQuery.of(context).size.height*.1,
              child: Center(
                child:
                imageFile != null
                    ? Container(
                  height: 110,width: 110,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    image: DecorationImage(
                      image: FileImage(imageFile!),
                      fit: BoxFit.cover,
                    ),
                    border: Border.all(
                        color: AppColor.primaryColor,
                        width: 2
                    ),
                  ),
                ):
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: AppColor.offColor,
                    border: Border.all(
                      color: AppColor.primaryColor,
                      width: 2
                    ),

                  ),
                  height: 110,width: 110,

                ),
              )
            ),
            Positioned(
                left: 0,right: -50,top: MediaQuery.of(context).size.height*.2,
                child: Center(
                  child: InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: (){
                      _addImagePopUp();
                    },
                    child: SvgPicture.asset('assets/images/img.svg',
                    height: 36,width: 36),
                  ),
                )
            )
              ],
        ));
  }
  _getFromGallery() async {
    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }

  _getFromCamera() async {
    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }

  _addImagePopUp() {
    return showModalBottomSheet<dynamic>(
        isScrollControlled: true,
        context: context,
        backgroundColor: Colors.transparent,
        builder: (context) {
          return StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
            return Wrap(children: <Widget>[
              SizedBox(
                width: double.infinity,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 18, right: 15, top: 18, bottom: 18),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Select',
                          textScaleFactor: 1,
                          style: GoogleFonts.inter(
                            color: Colors.black,
                            fontStyle: FontStyle.normal,
                            fontSize: AppConstants.SMALL,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            InkWell(
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  Navigator.pop(context);
                                  _getFromGallery();
                                },
                                child: Image.asset(
                                  'assets/images/gallery.png',
                                  height: 52,
                                  width: 52,
                                )),
                            const SizedBox(
                              width: 16,
                            ),
                            InkWell(
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  Navigator.pop(context);
                                  _getFromCamera();
                                },
                                child: Image.asset(
                                  'assets/images/camera.png',
                                  height: 55,
                                  width: 55,
                                )),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              )
            ]);
          });
        });
  }
  void showAlertDialog1(BuildContext context) {
    // set up the button
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("Cancel", textScaleFactor: 1,style: GoogleFonts.montserrat(color: AppColor.primaryColor,fontSize: 16),),
      onPressed: () {
        Navigator.of(context, rootNavigator: true).pop();
      },
    );
    Widget continueButton = TextButton(
      child: Text("Logout", textScaleFactor: 1,style: GoogleFonts.montserrat(color: AppColor.primaryColor,fontSize: 16)),
      onPressed: ()  async {

        SharedPreferences sharedPreference = await SharedPreferences.getInstance();
        sharedPreference.remove('login');
        sharedPreference.remove('token');
        sharedPreference.clear();

        Navigator.of(context, rootNavigator: true)
            .pushAndRemoveUntil(
          MaterialPageRoute(
              builder: (context) => const PhoneScreen()),
              (Route<dynamic> route) => false,
        );
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
          color: Colors.white,
        ),
        padding:  EdgeInsets.symmetric(horizontal: AppConstants.HORIZONTAL_PADDING,vertical: 16),
        child: Column(
          children: [

            const SizedBox(height: 16,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset("assets/images/logo.png",height: 25,),
                SizedBox(width: 15,),
                Flexible(
                  child: Text("Do you want to log out from the application?", textScaleFactor: 1,
                    style: GoogleFonts.montserrat(
                        color: Colors.black,
                        fontSize: AppConstants.LARGE,fontWeight: FontWeight.w500
                    ),),
                ),
              ],
            ),
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
}
