import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:ircf/color/app_color.dart';
import 'package:ircf/constants/app_constants.dart';

import 'package:ircf/cubit/register/register_cubit.dart';
import 'package:ircf/cubit/register/register_state.dart';
import 'package:ircf/screens/home/dashboard.dart';
import 'package:ircf/main_screen.dart';
import 'package:ircf/utils/app_utils.dart';
import 'package:ircf/widgets/show_snackbar.dart';
import 'package:ircf/widgets/title_bar.dart';

enum Gender { Male, Female, Other, }

class FillProfile extends StatefulWidget {
  var mobile;
   FillProfile({super.key, this.mobile});

  @override
  State<FillProfile> createState() => _FillProfileState();
}

class _FillProfileState extends State<FillProfile> {
  final fullNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final nickNameController = TextEditingController();
  final dobController = TextEditingController();
  final emailController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  Gender selectedGender = Gender.Other;
  final ImagePicker _picker = ImagePicker();
  File? imageFile;

  @override
  void initState() {
    print(widget.mobile);
     phoneController.text =  widget.mobile;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteBG,
      body:
      BlocConsumer<RegisterCubit, RegisterState>(listener: (context, state) async {
        if (state is RegisterSuccess) {
          phoneController.text.isNotEmpty && fullNameController.text.isNotEmpty &&
              dobController.text.isNotEmpty && emailController.text.isNotEmpty?

          Navigator.push(context, MaterialPageRoute(builder: (context) =>  const MainScreen(redirectPageName: 'home',))):showSnackBar(context, 'Please Enter details');

        }
        if (state is RegisterError) {

          showSnackBar(context, state.message.toString());
        }
        if(state is RegisterLoading){
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
      }, builder: (context, state) {
     return Padding(
        padding: const EdgeInsets.only(top: 45, bottom: 32, left: AppConstants.HORIZONTAL_PADDING, right: AppConstants.HORIZONTAL_PADDING),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const TitleBar(
              title: 'Fill Your Profile',
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 42,
                    ),
                    Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: imageFile != null
                              ? Container(
                                  height: 100,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(56),
                                    image: DecorationImage(
                                      image: FileImage(imageFile!),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                )
                              : Image.asset(
                                  'assets/images/Profile.png',
                                  height: 100,
                                  width: 100,
                                ),
                        ),
                        Positioned(
                          bottom: 5,
                          right: 5,
                          child: InkWell(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () {
                              _addImagePopUp();
                            },
                            child: CircleAvatar(
                              backgroundColor: AppColor.tealColor,
                              radius: 12,
                              child: Center(
                                child: Image.asset(
                                  'assets/images/Icon.png',
                                  height: 14,
                                  width: 14,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      height: 60,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(12))),
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
                              color: AppColor.hintColor,
                              fontStyle: FontStyle.normal,
                              fontSize: AppConstants.SMALL,
                              fontWeight: FontWeight.w400,
                            ),
                            focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent, width: 1.0), borderRadius: BorderRadius.all(Radius.circular(12))),
                            enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent), borderRadius: BorderRadius.all(Radius.circular(30))),
                            counterText: "",
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    Container(
                      height: 60,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(12))),
                      child: MediaQuery(
                        data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
                        child: TextFormField(
                          readOnly: true,
                          onTap: () async {
                            showModalBottomSheet(
                              shape: const OutlineInputBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)), borderSide: BorderSide.none),
                              backgroundColor: Colors.white,
                              context: context,
                              builder: (context) => Container(
                                  height: 500,
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
                                    color: AppColor.secondaryColor,
                                  ),
                                  child: _buildDefaultDatePickerWithValue()),
                            );
                          },
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
                              color: AppColor.hintColor,
                              fontStyle: FontStyle.normal,
                              fontSize: AppConstants.SMALL,
                              fontWeight: FontWeight.w400,
                            ),
                            prefixIconConstraints: const BoxConstraints(
                              minWidth: 50,
                              minHeight: 20,
                            ),
                            prefixIcon: SvgPicture.asset(
                              'assets/images/dob.svg',
                            ),
                            focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent, width: 1.0), borderRadius: BorderRadius.all(Radius.circular(12))),
                            enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent), borderRadius: BorderRadius.all(Radius.circular(30))),
                            counterText: "",
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 60,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(12))),
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
                            focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent, width: 1.0), borderRadius: BorderRadius.all(Radius.circular(12))),
                            enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent), borderRadius: BorderRadius.all(Radius.circular(30))),
                            counterText: "",
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
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
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 60,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(12))),
                      child: MediaQuery(
                        data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
                        child: DropdownButtonFormField<Gender>(
                          style: GoogleFonts.jost(color: Colors.black),
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
                      )),
                  onPressed: () {
                    BlocProvider.of<RegisterCubit>(context).register(fullNameController.text,
                     AppUtils.convertDate(selectedDate.toString()),emailController.text,phoneController.text,genderController.text == 'Male'?"0":genderController.text == 'Female'? "1":"2",
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(
                        width: 48,
                      ),
                      Center(
                        child: Text(
                          'Continue',
                          style: GoogleFonts.jost(color: Colors.white, fontSize: AppConstants.LARGE, fontWeight: FontWeight.w500),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          height: 48,
                          width: 48,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(60), color: Colors.white),
                          child: Center(
                              child: Icon(
                            CupertinoIcons.arrow_right,
                            size: 30,
                            color: AppColor.primaryColor,
                          )),
                        ),
                      ),
                    ],
                  )),
            )
          ],
        ),
      );
    }
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

  DateTime selectedDate = DateTime.now();

  Widget _buildDefaultDatePickerWithValue() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Theme(
          data: ThemeData.light().copyWith(
            primaryColor: AppColor.primaryColor,
            colorScheme:  ColorScheme.light(primary: AppColor.primaryColor),
            buttonTheme: const ButtonThemeData(textTheme: ButtonTextTheme.primary),
            textTheme:  const TextTheme(
              bodyLarge: TextStyle(color: Colors.black),
              titleMedium: TextStyle(color: Colors.blue),
            ),
          ),
          child: CalendarDatePicker(
            initialDate: DateTime.now(),
            firstDate: DateTime(1900),
            lastDate: DateTime.now(),
            onDateChanged: (date) {
              setState(() {
                selectedDate = date;
              });
            },
          ),
        ),
        const SizedBox(
          height: 18,
        ),
        InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () {
            print("Selected Date: $selectedDate");
            dobController.text = AppUtils.newDate(selectedDate.toString());
            Navigator.of(context).pop(true);
          },
          child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: AppColor.primaryColor,
              border: Border.all(
                color: Colors.transparent,
                width: 1,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(30),
              ),
            ),
            margin: const EdgeInsets.symmetric(horizontal: 40),
            padding: const EdgeInsets.all(12),
            child: Center(
              child: Text(
                "Select your date of Birth",
                textScaleFactor: 1,
                style: GoogleFonts.montserrat(
                  color: const Color(0xffFFFFFF),
                  fontStyle: FontStyle.normal,
                  fontSize: AppConstants.LARGE,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
