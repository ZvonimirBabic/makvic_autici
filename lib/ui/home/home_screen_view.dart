import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_screen_controller.dart';

class HomeScreenView extends GetView<HomeScreenController> {
  const HomeScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.abc,
                  color: Colors.red,
                ),
                label: '1'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.abc,
                  color: Colors.red,
                ),
                label: '2')
          ],
        ),
        body: Column(),
      );
}
