import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class checkoutlistile extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool isactive;
  const checkoutlistile({Key? key, required this.title, required this.subtitle, required this.isactive}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        color: isactive==true?AppColor.primaryColor:null,
        child: ListTile(
          title: Text('$title',style: TextStyle(color:isactive==true? Colors.white:null),),
          subtitle: Text('$subtitle',style: TextStyle(color: isactive==true?Colors.white:null)),
        ),
      ),

    );
  }
}
