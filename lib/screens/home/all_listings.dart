import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ircf/color/app_color.dart';
import 'package:ircf/constants/app_constants.dart';
import 'package:ircf/cubit/all_listings/all_listings_cubit.dart';
import 'package:ircf/cubit/all_listings/all_listings_state.dart';
import 'package:ircf/screens/home/dashboard.dart';
import 'package:ircf/screens/home/listing_detail.dart';
import 'package:ircf/widgets/save.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class AllListings extends StatefulWidget {
  const AllListings({super.key});

  @override
  State<AllListings> createState() => _AllListingsState();
}

class _AllListingsState extends State<AllListings> {
  bool isSaved = false;

  toggelButton() async {
    setState(() {
      isSaved = !isSaved;
    });
  }

  @override
  void initState() {
    BlocProvider.of<AllListingCubit>(context).allListing();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.whiteBG,
        body: BlocConsumer<AllListingCubit, AllListingState>(listener: (context, state) async {
          if (state is AllListingSuccess) {}
          if (state is AllListingError) {}
        }, builder: (context, state) {
          if (state is AllListingSuccess) {
            return ListView.builder(
                itemCount: state.allListingResponse.course!.length,
                padding: const EdgeInsets.symmetric(horizontal: AppConstants.HORIZONTAL_PADDING, vertical: 17),
                itemBuilder: (context, index) {
                  return Card(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      elevation: 2,
                      shape: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
                      color: Colors.white,
                      child: Row(
                        children: [
                          Container(
                            height: 130,
                            width: 130,
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(16),
                                  bottomLeft: Radius.circular(16),
                                ),
                                color: Colors.black),
                          ),
                          Flexible(
                              child: Padding(
                            padding: const EdgeInsets.all(14),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      state.allListingResponse.course![index].crs_short_name.toString(),
                                      textScaleFactor: 1,
                                      style: GoogleFonts.mulish(fontSize: AppConstants.XSMALL, fontWeight: FontWeight.bold, color: AppColor.activeColor),
                                    ),
                                    const SaveWidget(
                                      favdata: false,
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  state.allListingResponse.course![index].crs_name.toString(),
                                  textScaleFactor: 1,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: GoogleFonts.jost(fontSize: AppConstants.MEDIUM, fontWeight: FontWeight.w500, color: AppColor.textColor),
                                ),
                                const SizedBox(height: 4),
                                RichText(
                                    textScaleFactor: 1,
                                    text:
                                        TextSpan(text: '${state.allListingResponse.course![index].crs_amount} ', style: GoogleFonts.mulish(fontSize: 17, fontWeight: FontWeight.bold, color: AppColor.primaryColor), children: [
                                      TextSpan(
                                        text: state.allListingResponse.course![index].crs_amount,
                                        style: GoogleFonts.mulish(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                          color: AppColor.offColor,
                                          decoration: TextDecoration.lineThrough,
                                        ),
                                      )
                                    ])),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    const SizedBox(),
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () {
                                        pushNewScreen(context, screen:  ListingDetail(title: state.allListingResponse.course![index].crs_short_name.toString(),type:'all',course: state.allListingResponse.course,), withNavBar: false, pageTransitionAnimation: PageTransitionAnimation.fade);
                                      },
                                      child: Row(
                                        children: [
                                          Text(
                                            'VIEW ',
                                            textScaleFactor: 1,
                                            style: GoogleFonts.mulish(color: AppColor.primaryColor, fontWeight: FontWeight.bold, fontSize: AppConstants.XSMALL),
                                          ),
                                          Icon(
                                            Icons.arrow_forward_ios_rounded,
                                            size: 14,
                                            color: AppColor.primaryColor,
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ))
                        ],
                      ));
                });
          }
          return AppConstants.LOADER;
        }));
  }
}
