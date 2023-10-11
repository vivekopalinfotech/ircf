import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ircf/color/app_color.dart';
import 'package:ircf/constants/app_constants.dart';
import 'package:ircf/screens/notification/notify_card.dart';
import 'package:ircf/widgets/title_bar.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  List<Notify> item = [
    Notify('assets/images/notification1.svg', 'New Category Course.!', 'New the 3D Design Course is Availa..', Colors.white,Colors.black),
    Notify('assets/images/notification2.svg', 'New Category Course.!', 'New the 3D Design Course is Availa..', AppColor.primaryColor,Colors.white),
    Notify('assets/images/notification3.svg', 'New Category Course.!', 'New the 3D Design Course is Availa..', Colors.white,Colors.black),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteBG,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 45, left: AppConstants.HORIZONTAL_PADDING, right: AppConstants.HORIZONTAL_PADDING, ),
            child: const TitleBar(title: 'Notifications',),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                  padding: const EdgeInsets.only( left: AppConstants.HORIZONTAL_PADDING, right: AppConstants.HORIZONTAL_PADDING,bottom: 53),
                  child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:  [

                      const SizedBox(height: 38,),
                      Text('Today',
                        textScaleFactor: 1,
                        style: GoogleFonts.jost(
                        fontSize: AppConstants.MEDIUM,
                        fontWeight: FontWeight.bold,color: AppColor.textColor
                      ),),
                      ListView.builder(
                        shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: item.length,
                          itemBuilder: (context,index){
                        return  NotifyCard(icon: item[index].icon,title: item[index].title,subTitle: item[index].subTitle,color: item[index].color,iconColor: item[index].iconColor,);
                      }),
                          const SizedBox(height: 30,),
                          Text('Yesterday',
                            textScaleFactor: 1,
                            style: GoogleFonts.jost(
                                fontSize: AppConstants.MEDIUM,
                                fontWeight: FontWeight.bold,color: AppColor.textColor
                            ),),
                          ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: 1,
                              itemBuilder: (context,index){
                                return  NotifyCard(icon: item[index].icon,title: item[index].title,subTitle: item[index].subTitle,color: item[index].color,iconColor: item[index].iconColor,);
                              }),
                          const SizedBox(height: 30,),
                          Text('Nov 20, 2022',
                            textScaleFactor: 1,
                            style: GoogleFonts.jost(
                                fontSize: AppConstants.MEDIUM,
                                fontWeight: FontWeight.bold,color: AppColor.textColor
                            ),),
                          ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: 1,
                              itemBuilder: (context,index){
                                return  NotifyCard(icon: item[index].icon,title: item[index].title,subTitle: item[index].subTitle,color: item[index].color,iconColor: item[index].iconColor,);
                              }),
                    ])
                  ])),
            ),
          ),
        ],
      ),
    );
  }
}
