import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String titleappbar ;
  final void Function()? onPressedIcon ;
  final void Function()? onPressedSearch ;
  final void Function()? onPressedfavorite ;
  final void Function(String)? onchange;
  final TextEditingController ? mycontroller;
  const CustomAppBar({Key? key, required this.titleappbar,required this.onPressedIcon,required this.onPressedSearch,required this.onPressedfavorite, this.onchange,  this.mycontroller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Row(children: [
        Expanded(
            child: TextFormField(
              controller: mycontroller,
              onChanged: onchange,

          decoration: InputDecoration(
              prefixIcon: IconButton(icon: Icon(Icons.search) , onPressed: onPressedSearch),
              hintText: titleappbar,
              hintStyle: TextStyle(fontSize: 18),
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10)),
              filled: true,
              fillColor: Colors.grey[200]),
        )),
        SizedBox(width: 10),
        Container(
          decoration: BoxDecoration(
              color: Colors.grey[200], borderRadius: BorderRadius.circular(10)),
          width: 60,
          padding: EdgeInsets.symmetric(vertical: 8),
          child: IconButton(
              onPressed: onPressedIcon,
              icon: Icon(
                Icons.notifications_active_outlined,
                size: 30,
                color: Colors.grey[600],
              )),
        ),
        SizedBox(width: 10),
        Container(
          decoration: BoxDecoration(
              color: Colors.grey[200], borderRadius: BorderRadius.circular(10)),
          width: 60,
          padding: EdgeInsets.symmetric(vertical: 8),
          child: IconButton(
              onPressed: onPressedfavorite,
              icon: Icon(
                Icons.favorite_border_outlined,
                size: 30,
                color: Colors.grey[600],
              )),
        )
      ]),
    );
  }
}
