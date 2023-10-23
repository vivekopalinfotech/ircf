// ignore_for_file: use_build_context_synchronously
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:ircf/color/app_color.dart';
import 'package:ircf/constants/app_constants.dart';
import 'package:ircf/widgets/show_snackbar.dart';
import 'package:ircf/widgets/title_bar.dart';
import 'package:http/http.dart' as http;

class Certificate extends StatefulWidget {
  final title;
  const Certificate({super.key, this.title});

  @override
  State<Certificate> createState() => _CertificateState();
}

class _CertificateState extends State<Certificate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteBG,
      body: Padding(
      padding: const EdgeInsets.only(top: 45,left: AppConstants.HORIZONTAL_PADDING,right: AppConstants.HORIZONTAL_PADDING,bottom: 53 ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(

          children: [
            TitleBar(title: widget.title,),
            const SizedBox(height: 24,),

            Container(
                height: 560,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(12),bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12)),

                ),
              child:   CachedNetworkImage(
                imageUrl: 'https://priyadogra.com/wp-content/uploads/2020/08/Career-Development-College-London-Free-Online-Course-with-Certificate-Priya.png',
                  fit: BoxFit.cover,
                progressIndicatorBuilder: (context, url, progress) => const CupertinoActivityIndicator(),
              ),
            )
          ],
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
                downloadAndSaveImage('https://static.vecteezy.com/system/resources/previews/000/636/497/original/vector-portrait-luxury-certificate-template-with-elegant-border-frame-diploma-design-for-graduation-or-completion.jpg');
              },

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(width: 48,),
                  Center(
                    child: Text('Download Certificate',style: GoogleFonts.jost(
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
    )));
  }
  Future<void> downloadAndSaveImage(image) async {
    String imageUrl = image;
    var response = await http.get(Uri.parse(imageUrl));
    if (response.statusCode == 200) {
      await ImageGallerySaver.saveImage(Uint8List.fromList(response.bodyBytes));
      showSuccessSnackBar(context,'Image saved to gallery');
    } else {
      print('Failed to download image');
    }
  }

}

