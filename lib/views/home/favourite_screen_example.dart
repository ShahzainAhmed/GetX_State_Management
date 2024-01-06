import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_learning/controllers/favourite_controller.dart';
import 'package:getx_learning/data/constants/app_colors.dart';
import 'package:getx_learning/data/constants/app_typography.dart';

class FavouriteScreenExample extends StatefulWidget {
  const FavouriteScreenExample({super.key});

  @override
  State<FavouriteScreenExample> createState() => _FavouriteScreenExampleState();
}

class _FavouriteScreenExampleState extends State<FavouriteScreenExample> {
  FavouriteController favouriteController = Get.put(FavouriteController());

  // List<String> fruitList = ['Mangoes', 'Apples', 'Bananas', 'Oranges'];
  // List tempFruitList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "GetX Favourite Items",
          style: AppTypography.kBold16.copyWith(color: AppColors.kWhiteColor),
        ),
        backgroundColor: AppColors.kGreyColor,
        centerTitle: true,
      ),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: favouriteController.fruitList.length,
        itemBuilder: (context, index) {
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0),
            ),
            child: ListTile(
              onTap: () {
                if (favouriteController.tempFruitList.contains(
                    favouriteController.fruitList[index].toString())) {
                  favouriteController.removeFromFavourite(
                      favouriteController.fruitList[index].toString());
                } else {
                  favouriteController.addToFavourite(
                      favouriteController.fruitList[index].toString());
                }
              },
              title: Text(
                "${index + 1}.   ${favouriteController.fruitList[index]}",
                style: AppTypography.kBold14,
              ),
              trailing: Obx(
                () => Icon(
                  Icons.favorite,
                  color: favouriteController.tempFruitList.contains(
                          favouriteController.fruitList[index].toString())
                      ? AppColors.kRedColor
                      : AppColors.kWhiteColor.withOpacity(0.1),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
