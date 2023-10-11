import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class SaveWidget extends StatefulWidget {
  final bool favdata;
  const SaveWidget({Key? key, required this.favdata,}) : super(key: key);

  @override
  State<SaveWidget> createState() => _SaveWidgetState();
}

class _SaveWidgetState extends State<SaveWidget> {

  bool isFavourite = false;

  @override
  void initState() {
    isFavourite = widget.favdata;
    super.initState();
  }

  toggelButton() async {
    setState(() {
      isFavourite = !isFavourite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
            onTap: (){
              toggelButton();
            },
            child: isFavourite == false?
            SvgPicture.asset('assets/images/save.svg',height: 18,width: 15,):
            SvgPicture.asset('assets/images/saved.svg',height: 18,width: 15,));
  }
}
