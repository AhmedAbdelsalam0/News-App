import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/controller/news_controller.dart';

import 'bottom_nav_bar/health.dart';
import 'bottom_nav_bar/science.dart';
import 'bottom_nav_bar/sports.dart';
import 'bottom_nav_bar/technology.dart';

class HomePage extends GetWidget {

  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    NewsController controller = Get.put(NewsController());

    List<Widget> screens = [
      Health(),
      Science(),
      Sports(),
      Technology(),
    ];

    return Scaffold(
      body: Obx(
        () => screens[controller.currentIndex.value],
      ),
      bottomNavigationBar: Obx(
            () => BottomNavigationBar(
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          currentIndex: controller.currentIndex.value,
          onTap: (val) {
            controller.currentIndex.value = val;
          },
          items: const [
            BottomNavigationBarItem(
              label: "Health",
              icon: Icon(
                Icons.health_and_safety_outlined,
              ),
            ),
            BottomNavigationBarItem(
              label: "Science",
              icon: Icon(
                Icons.science_outlined,
              ),
            ),
            BottomNavigationBarItem(
              label: "Sports",
              icon: Icon(
                Icons.sports,
              ),
            ),
            BottomNavigationBarItem(
              label: "Technology",
              icon: Icon(
                Icons.sports_esports_outlined,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
