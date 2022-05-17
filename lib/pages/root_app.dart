import 'package:flutter/material.dart';
import 'package:flutter_whatsapp_clone/theme/colors.dart';
import 'package:line_icons/line_icons.dart';

class RootApp extends StatefulWidget {
  const RootApp({Key? key}) : super(key: key);

  @override
  State<RootApp> createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      bottomNavigationBar: getFooter(),
    );
  }

  Widget getFooter(){
    List iconItems = [
      LineIcons.circle,
      LineIcons.phoneSquare,
      LineIcons.camera,
      LineIcons.comment,
      LineIcons.gem,
    ];
    List textItems = [
      "Status",
      "Calls",
      "Camera",
      "Chats",
      "Settings"
    ];

    return Container(
      height: 90,
      width: double.infinity,
      decoration: BoxDecoration(
        color: greyColor
      ),

      child: Row(
        children: List.generate(textItems.length, (index){
          return Column(
            children: [
              Icon(iconItems[index], color: white.withOpacity(0.5),),
              const SizedBox(height: 5,),
            ],
          );
        }),
      ),

    );
  }

}
