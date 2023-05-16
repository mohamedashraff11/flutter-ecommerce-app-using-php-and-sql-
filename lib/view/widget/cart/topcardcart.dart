import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';
class topcardcart extends StatelessWidget {
 final String itemscount;
  const topcardcart({Key? key, required this.itemscount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      height: 35,
      decoration: BoxDecoration(
        color: AppColor.thirdColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text('you have $itemscount items in your list',style: TextStyle(color: Colors.grey[700],fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
    );
  }
}
