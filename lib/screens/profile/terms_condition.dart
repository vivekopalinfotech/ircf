import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ircf/color/app_color.dart';
import 'package:ircf/constants/app_constants.dart';
import 'package:ircf/widgets/title_bar.dart';

class TermsCondition extends StatefulWidget {
  const TermsCondition({super.key});

  @override
  State<TermsCondition> createState() => _TermsConditionState();
}

class _TermsConditionState extends State<TermsCondition> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.whiteBG,
        body: Padding(
            padding: const EdgeInsets.only(top: 45, left: AppConstants.HORIZONTAL_PADDING, right: AppConstants.HORIZONTAL_PADDING),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
              const TitleBar(
                title: 'Terms & Condition',
              ),

              Expanded(
                  child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 37,),
                    Text('Condition & Attending',
                    textScaleFactor: 1,
                    style: GoogleFonts.jost(
                      fontSize: AppConstants.XLARGE,
                      color: AppColor.textColor,
                      fontWeight: FontWeight.w500
                    ),),
                    const SizedBox(height: 10,),
                    Text("At enim hic etiam dolore. Dulce amarum, leve asperum, prope longe, stare movere, quadratum rotundum. At certe gravius. Nullus est igitur cuiusquam dies natalis. Paulum, cum regem Persem captum adduceret, eodem flumine invectio?\n\nQuare hoc videndum est, possitne nobis hoc ratio philosophorum dare.Sed finge non solum callidum eum, qui aliquid improbe faciat, verum etiam praepotentem, ut M.Est autem officium, quod ita factum est, ut eius facti probabilis ratio reddi possit.",
                      textScaleFactor: 1,
                      style: GoogleFonts.mulish(
                          fontSize: 15,
                          color: AppColor.secondaryTextColor,
                          fontWeight: FontWeight.bold,
                        height: 1.2
                      ),),
                    const SizedBox(height: 22,),
                    Text('Terms & Use',
                      textScaleFactor: 1,
                      style: GoogleFonts.jost(
                          fontSize: AppConstants.XLARGE,
                          color: AppColor.textColor,
                          fontWeight: FontWeight.w500
                      ),),
                    const SizedBox(height: 10,),
                    Text("Ut proverbia non nulla veriora sint quam vestra dogmata. Tamen aberramus a proposito, et, ne longius, prorsus, inquam, Piso, si ista mala sunt, placet. Omnes enim iucundum motum, quo sensus hilaretur. Cum id fugiunt, re eadem defendunt, quae Peripatetici, verba. Quibusnam praeteritis? Portenta haec esse dicit, quidem hactenus; Si id dicis, vicimus. Qui ita affectus, beatum esse numquam probabis; Igitur neque stultorum quisquam beatus neque sapientium non beatus.\n\nDicam, inquam, et quidem discendi causa magis, quam quo te aut Epicurum reprehensum velim. Dolor ergo, id est summum malum, metuetur semper, etiamsi non ader.",
                      textScaleFactor: 1,
                      style: GoogleFonts.mulish(
                          fontSize: 15,
                          color: AppColor.secondaryTextColor,
                          fontWeight: FontWeight.bold,
                          height: 1.2
                      ),),
                    const SizedBox(height: 90,),
                  ],
                ),
              ))
            ])));
  }
}
