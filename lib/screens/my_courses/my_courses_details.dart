// ignore_for_file: depend_on_referenced_packages, use_build_context_synchronously, prefer_typing_uninitialized_variables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:ircf/color/app_color.dart';
import 'package:ircf/constants/app_constants.dart';
import 'package:ircf/cubit/course_module/course_module_cubit.dart';
import 'package:ircf/cubit/course_module/course_module_state.dart';
import 'package:ircf/screens/home/detail_tabs.dart';
import 'package:http/http.dart' as http;
import 'package:ircf/screens/my_courses/final_exam.dart';
import 'package:ircf/screens/my_courses/video_player.dart';
import 'package:ircf/widgets/show_snackbar.dart';
import 'package:ircf/widgets/title_bar.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:url_launcher/url_launcher.dart';

class MyCoursesDetail extends StatefulWidget {
  final String type;
  final id;
  const MyCoursesDetail({super.key, required this.type, this.id});

  @override
  State<MyCoursesDetail> createState() => _MyCoursesDetailState();
}

class _MyCoursesDetailState extends State<MyCoursesDetail> {
  List<Curriculcum> item = [
    Curriculcum('01', 'Chapter - 1', '15 Mins'),
    Curriculcum('02', 'Chapter - 2', '10 Mins'),
  ];

  List<Curriculcum> item1 = [
    Curriculcum('03', 'Chapter - 1', '08 Mins'),
    Curriculcum('04', 'Chapter - 2', '25 Mins'),
    Curriculcum('05', 'Chapter - 2', '12 Mins'),
    Curriculcum('06', 'Chapter - 2', '10 Mins'),
  ];

  List<Curriculcum> item2 = [
    Curriculcum('07', 'Chapter - 1', '15 Mins'),
    Curriculcum('08', 'Chapter - 2', '30 Mins'),
    Curriculcum('09', 'Chapter - 2', '42 Mins'),
  ];

  @override
  void initState() {
    BlocProvider.of<CourseModuleCubit>(context).courseModule(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteBG,
      body: Stack(
        children: [
          Padding(
              padding: const EdgeInsets.only(top: 45, left: AppConstants.HORIZONTAL_PADDING, right: AppConstants.HORIZONTAL_PADDING),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                const TitleBar(
                  title: 'My Courses',
                ),
                const SizedBox(
                  height: 18,
                ),
                BlocConsumer<CourseModuleCubit, CourseModuleState>(listener: (context, state) async {
                  if (state is CourseModuleSuccess) {}
                  if (state is CourseModuleError) {}
                }, builder: (context, state) {
                  if (state is CourseModuleSuccess) {
                    return Expanded(
                        child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Card(
                            margin: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                            color: Colors.white,
                            child: Padding(
                                padding: const EdgeInsets.only(left: 14, right: 14, bottom: 25),
                                child: ListView.separated(
                                  itemCount: state.courseModuleResponse.course_module!.length,
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Flexible(
                                                child: RichText(
                                                    textScaleFactor: 1,
                                                    maxLines: 1,
                                                    overflow: TextOverflow.ellipsis,
                                                    text: TextSpan(text: '${index + 1} - ', style: GoogleFonts.jost(fontSize: 15, fontWeight: FontWeight.w500, color: AppColor.textColor), children: [
                                                      TextSpan(
                                                        text: state.courseModuleResponse.course_module![index].main_module!.module_title,
                                                        style: GoogleFonts.jost(fontSize: 15, fontWeight: FontWeight.w500, color: AppColor.primaryColor),
                                                      )
                                                    ]))),
                                            Text(
                                              state.courseModuleResponse.course_module![index].main_module!.sub_module != null
                                                  ? '(${state.courseModuleResponse.course_module![index].main_module!.sub_module!.length})'
                                                  : '',
                                              style: GoogleFonts.jost(fontWeight: FontWeight.w500, fontSize: AppConstants.SMALL, color: AppColor.textColor),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        state.courseModuleResponse.course_module![index].main_module!.sub_module != null
                                            ? const SizedBox()
                                            : Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Video: ',
                                                    style: GoogleFonts.jost(fontWeight: FontWeight.w500, fontSize: AppConstants.SMALL, color: AppColor.tealColor),
                                                  ),
                                                  ListView.builder(
                                                    itemCount: state.courseModuleResponse.course_module![index].main_module!.course_videos != null
                                                        ? state.courseModuleResponse.course_module![index].main_module!.course_videos!.length
                                                        : 0,
                                                    shrinkWrap: true,
                                                    physics: const NeverScrollableScrollPhysics(),
                                                    itemBuilder: (context, index1) {
                                                      return Padding(
                                                        padding: const EdgeInsets.all(8.0),
                                                        child: Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            Flexible(
                                                              child: Text(
                                                                state.courseModuleResponse.course_module![index].main_module!.course_videos![index1].course_video.toString(),
                                                                maxLines: 2,
                                                                style: GoogleFonts.jost(fontWeight: FontWeight.w500, fontSize: AppConstants.SMALL, color: AppColor.textColor),
                                                              ),
                                                            ),
                                                            InkWell(
                                                                splashColor: Colors.transparent,
                                                                highlightColor: Colors.transparent,
                                                                onTap: () {
                                                                  pushNewScreen(context,
                                                                      screen: VideoPlayerScreen(
                                                                        url: '${state.courseModuleResponse.course_module![index].main_module!.course_videos![index1].course_video}',
                                                                        title: state.courseModuleResponse.course_module![index].main_module!.module_title,
                                                                      ),
                                                                      pageTransitionAnimation: PageTransitionAnimation.fade,
                                                                      withNavBar: false);
                                                                },
                                                                child: SizedBox(height: 20, width: 20, child: SvgPicture.asset('assets/images/watch.svg'))),
                                                          ],
                                                        ),
                                                      );
                                                    }, ),
                                                  const SizedBox(
                                                    height: 8,
                                                  ),
                                                  Text(
                                                    'pdf: ',
                                                    style: GoogleFonts.jost(fontWeight: FontWeight.w500, fontSize: AppConstants.SMALL, color: AppColor.activeColor),
                                                  ),
                                                  ListView.builder(
                                                    itemCount: state.courseModuleResponse.course_module![index].main_module!.course_pdfs != null
                                                        ? state.courseModuleResponse.course_module![index].main_module!.course_pdfs!.length
                                                        : 0,
                                                    shrinkWrap: true,

                                                    physics: const NeverScrollableScrollPhysics(),
                                                    itemBuilder: (context, index1) {
                                                      return Padding(
                                                        padding: const EdgeInsets.all(8.0),
                                                        child: Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            Flexible(
                                                              child: Text(
                                                                state.courseModuleResponse.course_module![index].main_module!.course_pdfs![index1].course_pdf.toString(),
                                                                maxLines: 2,
                                                                style: GoogleFonts.jost(fontWeight: FontWeight.w500, fontSize: AppConstants.SMALL, color: AppColor.textColor),
                                                              ),
                                                            ),
                                                            InkWell(
                                                              splashColor: Colors.transparent,
                                                              highlightColor: Colors.transparent,
                                                              onTap: () {
                                                                _openUrl('${AppConstants.VIDEO_URL}${state.courseModuleResponse.course_module![index].main_module!.course_pdfs![index1].course_pdf}');
                                                              },
                                                              child: SizedBox(
                                                                  height: 20,
                                                                  width: 20,
                                                                  child: Icon(
                                                                    Icons.picture_as_pdf_outlined,
                                                                    color: AppColor.primaryColor,
                                                                  )),
                                                            ),
                                                          ],
                                                        ),
                                                      );
                                                    },),
                                                ],
                                              ),
                                        ListView.separated(
                                          itemCount: state.courseModuleResponse.course_module![index].main_module!.sub_module != null
                                              ? state.courseModuleResponse.course_module![index].main_module!.sub_module!.length
                                              : 0,
                                          shrinkWrap: true,
                                          physics: const NeverScrollableScrollPhysics(),
                                          itemBuilder: (context, index1) {
                                            return Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    Center(
                                                      child: Text(
                                                        '${index + 1}.${index1 + 1}',
                                                        style: GoogleFonts.jost(fontWeight: FontWeight.w500, fontSize: AppConstants.SMALL, color: AppColor.textColor),
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      width: 12,
                                                    ),
                                                    Flexible(
                                                      flex: 3,
                                                      child: Text(
                                                        '${state.courseModuleResponse.course_module![index].main_module!.sub_module![index1].module_title} ',
                                                        textScaleFactor: 1,
                                                        maxLines: 1,
                                                        overflow: TextOverflow.ellipsis,
                                                        style: GoogleFonts.jost(fontWeight: FontWeight.w500, fontSize: AppConstants.MEDIUM, color: AppColor.textColor),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 8,
                                                ),
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Video: ',
                                                      style: GoogleFonts.jost(fontWeight: FontWeight.w500, fontSize: AppConstants.SMALL, color: AppColor.tealColor),
                                                    ),
                                                    ListView.separated(
                                                        itemCount: state.courseModuleResponse.course_module![index].main_module!.sub_module![index1].course_videos != null
                                                            ? state.courseModuleResponse.course_module![index].main_module!.sub_module![index1].course_videos!.length
                                                            : 0,
                                                        shrinkWrap: true,
                                                        physics: const NeverScrollableScrollPhysics(),
                                                        itemBuilder: (context, index2) {
                                                          return Padding(
                                                            padding: const EdgeInsets.all(8.0),
                                                            child: Row(
                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                              children: [
                                                                Flexible(
                                                                  child: Text(
                                                                    state.courseModuleResponse.course_module![index].main_module!.sub_module![index1].course_videos![index2].course_video.toString(),
                                                                    maxLines: 2,
                                                                    style: GoogleFonts.jost(fontWeight: FontWeight.w500, fontSize: AppConstants.SMALL, color: AppColor.textColor),
                                                                  ),
                                                                ),
                                                                InkWell(
                                                                    splashColor: Colors.transparent,
                                                                    highlightColor: Colors.transparent,
                                                                    onTap: () {
                                                                      pushNewScreen(context,
                                                                          screen: VideoPlayerScreen(
                                                                            url: state.courseModuleResponse.course_module![index].main_module!.sub_module != null
                                                                                ? '${state.courseModuleResponse.course_module![index].main_module!.sub_module![index1].course_videos![index2].course_video}'
                                                                                : '${state.courseModuleResponse.course_module![index].main_module!.course_videos![index1].course_video}',
                                                                            title: state.courseModuleResponse.course_module![index].main_module!.module_title,
                                                                          ),
                                                                          pageTransitionAnimation: PageTransitionAnimation.fade,
                                                                          withNavBar: false);
                                                                    },
                                                                    child: SizedBox(height: 20, width: 20, child: SvgPicture.asset('assets/images/watch.svg'))),
                                                              ],
                                                            ),
                                                          );
                                                        }, separatorBuilder: (BuildContext context, int index) {
                                                          return Center(
                                                            child: Container(
                                                              height: 1,width: 200,
                                                              color: Colors.grey,
                                                            ),
                                                          );
                                                    },),
                                                    const SizedBox(
                                                      height: 8,
                                                    ),
                                                    Text(
                                                      'pdf: ',
                                                      style: GoogleFonts.jost(fontWeight: FontWeight.w500, fontSize: AppConstants.SMALL, color: AppColor.activeColor),
                                                    ),
                                                    ListView.separated(
                                                        itemCount: state.courseModuleResponse.course_module![index].main_module!.sub_module![index1].course_pdfs != null
                                                            ? state.courseModuleResponse.course_module![index].main_module!.sub_module![index1].course_pdfs!.length
                                                            : 0,
                                                        shrinkWrap: true,
                                                        physics: const NeverScrollableScrollPhysics(),
                                                        itemBuilder: (context, index2) {
                                                          return  Padding(
                                                            padding: const EdgeInsets.all(8.0),
                                                            child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Flexible(
                                                            flex: 2,
                                                            child: Text(
                                                              state.courseModuleResponse.course_module![index].main_module!.sub_module![index1].course_pdfs![index2].course_pdf.toString(),
                                                              style: GoogleFonts.jost(fontWeight: FontWeight.w500, fontSize: AppConstants.SMALL, color: AppColor.textColor),
                                                            ),
                                                        ),
                                                        InkWell(
                                                            splashColor: Colors.transparent,
                                                            highlightColor: Colors.transparent,
                                                            onTap: () {
                                                              _openUrl('${AppConstants.VIDEO_URL}${state.courseModuleResponse.course_module![index].main_module!.sub_module![index1].course_pdfs![index2].course_pdf}');
                                                            },
                                                            child: SizedBox(
                                                                height: 20,
                                                                width: 20,
                                                                child: Icon(
                                                                  Icons.picture_as_pdf_outlined,
                                                                  color: AppColor.primaryColor,
                                                                )),
                                                        ),
                                                      ],
                                                    ),
                                                          );}, separatorBuilder: (BuildContext context, int index) {
                                                          return Center(
                                                            child: Container(
                                                              height: 1,width: 200,
                                                              color: Colors.grey,
                                                            ),
                                                          );
                                                    },)
                                                  ],
                                                ),
                                              ],
                                            );
                                          },
                                          separatorBuilder: (BuildContext context, int index) {
                                            return const Divider(
                                              color: Colors.black45,
                                              height: 32,
                                            );
                                          },
                                        )
                                      ],
                                    );
                                  },
                                  separatorBuilder: (BuildContext context, int index) {
                                    return const Divider(
                                      height: 48,
                                      color: Colors.black45,
                                    );
                                  },
                                )),
                          ),
                          const SizedBox(
                            height: 130,
                          ),
                        ],
                      ),
                    ));
                  }
                  return AppConstants.LOADER;
                })
              ])),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 106,
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: AppConstants.HORIZONTAL_PADDING),
              child: widget.type == 'Completed'
                  ? Row(
                      children: [
                        InkWell(
                          onTap: () {
                            downloadAndSaveImage(
                                'https://static.vecteezy.com/system/resources/previews/000/636/497/original/vector-portrait-luxury-certificate-template-with-elegant-border-frame-diploma-design-for-graduation-or-completion.jpg');
                          },
                          child: Container(
                            height: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(60),
                              color: AppColor.cardColor,
                              border: Border.all(color: AppColor.offColor),
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 22),
                            child: Center(
                              child: SvgPicture.asset('assets/images/certificate.svg'),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          height: 60,
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
                                pushNewScreen(context, screen: const FinalExam(), pageTransitionAnimation: PageTransitionAnimation.fade, withNavBar: false);
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Center(
                                    child: Text(
                                      'Start Course Again',
                                      textScaleFactor: 1,
                                      style: GoogleFonts.jost(color: Colors.white, fontSize: AppConstants.LARGE, fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 8,
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
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
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
                              onPressed: () {},
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const SizedBox(
                                    width: 48,
                                  ),
                                  Center(
                                    child: Text(
                                      'Continue Courses',
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
                        ),
                      ],
                    ),
            ),
          )
        ],
      ),
    );
  }

  Future<void> downloadAndSaveImage(image) async {
    String imageUrl = image;
    var response = await http.get(Uri.parse(imageUrl));
    if (response.statusCode == 200) {
      await ImageGallerySaver.saveImage(Uint8List.fromList(response.bodyBytes));
      showSuccessSnackBar(context, 'Certificate Successfully downloaded');
    } else {
      //print('Failed to download image');
    }
  }
  _openUrl(uri) async {
    var url = Uri.parse(uri);
    await launchUrl(url);
  }
}
