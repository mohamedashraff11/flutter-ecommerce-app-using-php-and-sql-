import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class cardpaymentmethodcheckout extends StatelessWidget {
 final String title;
 final bool isactive;
  const cardpaymentmethodcheckout({Key? key,required this.title, required this.isactive}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
        padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color:isactive==true? AppColor.primaryColor:Colors.grey[300],
        ),
        child: Text('$title',style: TextStyle(color:isactive==true? Colors.white:AppColor.primaryColor,height:1,fontWeight: FontWeight.bold ),

        ));
  }
}
