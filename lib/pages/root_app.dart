import 'package:flutter/material.dart';
import 'package:flutter_whatsapp_clone/pages/calls_page.dart';
import 'package:flutter_whatsapp_clone/pages/camera_page.dart';
import 'package:flutter_whatsapp_clone/pages/chat_page.dart';
import 'package:flutter_whatsapp_clone/pages/settings_page.dart';
import 'package:flutter_whatsapp_clone/pages/status_page.dart';
import 'package:flutter_whatsapp_clone/theme/colors.dart';
import 'package:line_icons/line_icons.dart';

class RootApp extends StatefulWidget {
  const RootApp({Key? key}) : super(key: key);

  @override
  State<RootApp> createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      bottomNavigationBar: getFooter(),
      body: getBody(),
    );
  }

  Widget getBody(){
    return IndexedStack(
      index: pageIndex,
      children: const [
        StatusPage(),
        CallsPage(),
        CameraPage(),
        ChatPage(),
        SettingsPage(),
      ],
    );
  }

  Widget getFooter() {
    List iconItems = [
      LineIcons.circle,
      LineIcons.phone,
      LineIcons.camera,
      LineIcons.comment,
      LineIcons.gem,
    ];
    List textItems = ["Status", "Calls", "Camera", "Chats", "Settings"];

    return Container(
      height: 90,
      width: double.infinity,
      decoration: const BoxDecoration(color: greyColor),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(textItems.length, (index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  pageIndex = index;
                });
              },
              child: Column(
                children: [
                  Icon(
                    iconItems[index],
                    color:
                        pageIndex == index ? primary : white.withOpacity(0.5),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    textItems[index],
                    style: TextStyle(
                        fontSize: 10,
                        color: pageIndex == index
                            ? primary
                            : white.withOpacity(0.5)),
                  )
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
