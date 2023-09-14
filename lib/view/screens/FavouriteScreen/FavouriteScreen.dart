import 'package:ecommerce/controller/Favourite/FavouriteController.dart';
import 'package:ecommerce/core/class/statusRequest.dart';
import 'package:ecommerce/core/shared/HandleingRequsetData.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/shared/Searchbar_with_NotificationIcon.dart';
import '../../widgets/Favourites/FavouritesProducts.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(FavouriteControllerImp());
    return Scaffold(
      body: GetBuilder<FavouriteControllerImp>(builder: (controller) {
        return HandleingRequsetData(
            statusRequest: controller.statusRequest!,
            widget: ListView(
              children: [
                controller.favouriteProducts.isEmpty
                    ? SizedBox()
                    : Searchbar_with_NotificationIcon(),
                (controller.statusRequest == StatusRequest.none ||
                        controller.favouriteProducts.isEmpty)
                    ? Padding(
                        padding: const EdgeInsets.only(top: 350),
                        child: Center(
                            child: Text("No Products in your Favourit List",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold))))
                    : FavouritesProducts()
              ],
            ));
      }),
    );
  }
}
