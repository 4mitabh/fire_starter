import 'package:fire_starter/ui/auth/auth.dart';
import 'package:fire_starter/ui/components/widgets/navbar.dart';
import 'package:flutter/material.dart';
import 'package:fire_starter/ui/ui.dart';
import 'package:get/get.dart';

class SignedInHomeController extends GetxController {
  final navMenuIndex = 0.obs;

  List<NavbarItem> _navMenuItems;

  List<NavbarItem> get navMenuItems => _navMenuItems ??= [
        NavbarItem(icon: Icons.home, label: 'home', page: HomeUI()),
        NavbarItem(icon: Icons.favorite, label: 'favourite', page: FavouritesUI()),
        NavbarItem(icon: Icons.search, label: 'search', page: SearchUI()),
        NavbarItem(icon: Icons.person, label: 'profile', page: UpdateProfileUI()),
        NavbarItem(icon: Icons.settings, label: 'settings', page: SettingsUI())
      ];

  Widget get page => navMenuItems[navMenuIndex.value].page;
}

class SignedInHome extends GetView {
  static Widget builder([RouteSettings routeSettings]) =>
      GetBuilder<SignedInHomeController>(init: SignedInHomeController(), builder: (controller) => SignedInHome(controller, routeSettings));
  final SignedInHomeController controller;
  final RouteSettings routeSettings;
  SignedInHome(this.controller, this.routeSettings);

  @override
  Widget build(BuildContext context) {
    // final labels = AppLocalizations.of(context);
    return Scaffold(
      body: Obx(
        () => controller.page,
      ),
      bottomNavigationBar: Obx(
        () => Navbar(
          currentIndex: controller.navMenuIndex(),
          items: controller.navMenuItems,
          onTap: (index) {
            controller.navMenuIndex(index);
            // Get.toNamed('/home/${controller.navMenuItems[index].label}');
          },
        ),
      ),
    );
  }
}
