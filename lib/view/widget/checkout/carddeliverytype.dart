import 'package:ecommercecourse/core/constant/color.dart';
import 'package:flutter/material.dart';

class carddeliverytype extends StatelessWidget {
 final String imagepath;
 final String title;
 final bool isactive;
  const carddeliverytype({Key? key, required this.imagepath, required this.title, required this.isactive}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColor.primaryColor),
          color:isactive==true? AppColor.primaryColor:Colors.white
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Image.asset('$imagepath',height: 70,width: 100,),
            Text('$title',
              style: TextStyle(color:isactive==true? Colors.white:AppColor.primaryColor ,fontWeight: FontWeight.bold,fontSize: 16),),
          ],
        ),
      ),
    );
  }
}
