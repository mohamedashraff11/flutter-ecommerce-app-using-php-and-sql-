import 'package:ecommercecourse/core/constant/color.dart';
import 'package:flutter/material.dart';
class customitemcartlist extends StatelessWidget {
  final String price ;
  final String name;
  final String count;
  final String image;

   customitemcartlist({Key? key, required this.price, required this.name, required this.count, required this.image,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        child: Row(
          children: [
            Expanded(
                child: Image.network('$image')),
            Expanded(
                child: ListTile(
                  title: Text('$name',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
                  subtitle: Text('$price\$',style: TextStyle(fontSize: 15,color: AppColor.primaryColor),),
                )),
            Expanded(child: Column(
              children: [

                Column(
                  children: [
                    Text('count',style: TextStyle(fontFamily: 'sans',color: AppColor.primaryColor,fontSize: 15,fontWeight: FontWeight.bold)),
                    Container(
                      child: Text('$count',style: TextStyle(fontFamily: 'sans'),),
                    ),
                  ],
                ),

              ],
            )),
          ],
        ),
      ),
    );
  }
}
