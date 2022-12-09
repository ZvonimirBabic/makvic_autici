import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../constants/assets.dart';
import '../../constants/colors.dart';
import 'home_screen_controller.dart';
import 'home_widgets/bottom_navigation_bar/custom_bottom_navigation_bar.dart';

class HomeScreenView extends GetView<HomeScreenController> {
  const HomeScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(),
        bottomNavigationBar: CustomBottomNavigationBar(
          animationCurve: Curves.linearToEaseOut,
          bottomBarColor: MakvicAuticiColors.primaryBlue,
          buttonBackgroundColor: MakvicAuticiColors.primaryRed,
          items: [
            SvgPicture.asset(
              MakvicAuticiAssets.wishlistIcon,
              semanticsLabel: 'Wishlist icon unselected',
              width: 40,
              height: 40,
            ),
            SvgPicture.asset(
              MakvicAuticiAssets.storeIconSvg,
              semanticsLabel: 'Store icon unselected',
              width: 40,
              height: 40,
            ),
            SvgPicture.asset(
              MakvicAuticiAssets.profileIconSvg,
              semanticsLabel: 'Profile icon unselected',
              width: 40,
              height: 40,
            ),
          ],
          selectedItems: [
            SvgPicture.asset(
              MakvicAuticiAssets.wishlistIcon,
              semanticsLabel: 'Wishlist icon selected',
              color: Colors.white,
            ),
            SvgPicture.asset(
              MakvicAuticiAssets.storeIconSvg,
              semanticsLabel: 'Store icon selected',
              color: Colors.white,
            ),
            SvgPicture.asset(
              MakvicAuticiAssets.profileIconSvg,
              semanticsLabel: 'Acme Logo selected',
              color: Colors.white,
            ),
          ],
        ),
        body: Column(),
      );
}
