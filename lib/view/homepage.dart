import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:owl_reminder/control/homepagecontrol.dart';
import 'package:owl_reminder/style.dart';
import 'package:owl_reminder/view/calenderpage.dart';
import 'package:owl_reminder/view/edit_page.dart';
import 'package:owl_reminder/view/todaypage.dart';

class HomePage extends StatelessWidget {
  HomePageControl _control = Get.put(HomePageControl());
  List<Widget> pages = [
    TodayPage(),
    CalenderPage(),
    TodayPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(
          children: pages,
          controller: _control.controller,
          onPageChanged: (value) => _control.changeIndex(value),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(EditRemindPage(), transition: Transition.rightToLeft);
        },
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: Obx(() => bottomBar()),
    );
  }

  Widget bottomBar() => Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.4),
              // blurRadius:100,
              offset: Offset(0, 1)),
        ],
        // border: Border.all(color: yellow),
        borderRadius: BorderRadius.circular(30),
      ),
      padding: EdgeInsets.all(5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
          Expanded(
            child: GNav(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              iconSize: 24,
              // tabBorder: Border.all(color: Colors.grey, width: 1),

              activeColor: darkGray,
              padding: EdgeInsets.all(10),
              curve: Curves.fastOutSlowIn,
              selectedIndex: _control.index.value,

              onTabChange: (value) => _control.changPage(value),
              tabs: [
                GButton(
                  icon: LineIcons.home,
                  text: 'Today',
                  backgroundColor: yellow,
                ),
                GButton(
                  icon: Icons.calendar_today_outlined,
                  text: 'Likes',
                  backgroundColor: yellow,
                ),
                GButton(
                  icon: Icons.notifications,
                  text: 'Search',
                  backgroundColor: yellow,
                ),
              ],
            ),
          ),
        ],
      ));
}
