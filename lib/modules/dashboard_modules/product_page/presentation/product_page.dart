import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:task/modules/dashboard_modules/product_page/controller/product_controller.dart';
import 'package:task/modules/dashboard_modules/product_page/widget/product_widget.dart';
import 'package:task/res/app_colors.dart';
import 'package:task/res/assets_path.dart';
import 'package:task/res/strings_utils.dart';
import 'package:task/utils/navigation_utils/navigation.dart';
import 'package:task/utils/size_utils.dart';
import 'package:task/widget/app_text.dart';

class ProductPage extends StatelessWidget {
  ProductPage({Key? key}) : super(key: key);
  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: Column(
        children: [
          Container(
            color: AppColor.whiteColor,
            child: Padding(
              padding: EdgeInsets.only(
                top: SizeUtils.horizontalBlockSize * 9,
                bottom: SizeUtils.horizontalBlockSize * 3,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _headerRow(),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: SizeUtils.horizontalBlockSize * 4),
                    child: AppText(
                      AppString.NKB,
                      fontWeight: FontWeight.bold,
                      fontSize: SizeUtils.fSize_20(),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: SizeUtils.horizontalBlockSize * 4,
                      vertical: SizeUtils.horizontalBlockSize * 2,
                    ),
                    child: Obx(
                      () => AppText(
                        "${productController.product.value}${AppString.product}",
                        fontSize: SizeUtils.fSize_17(),
                        fontWeight: FontWeight.w600,
                        color: AppColor.blackColor.withOpacity(0.5),
                      ),
                    ),
                  ),
                  _chipRow(),
                ],
              ),
            ),
          ),
          Divider(
            height: 0,
            thickness: 1,
            color: AppColor.blackColor.withOpacity(0.2),
          ),
          Expanded(
            child: Obx(
              () => productController.isLoading.value
                  ? SpinKitSquareCircle(
                      color: AppColor.headerTextColor,
                      size: SizeUtils.horizontalBlockSize * 13,
                    )
                  : productController.productList.isEmpty
                      ? Center(
                          child: AppText(
                            AppString.noProduct,
                            fontWeight: FontWeight.bold,
                            fontSize: SizeUtils.fSize_20(),
                          ),
                        )
                      : GridView.builder(
                          padding: EdgeInsets.only(
                            top: SizeUtils.horizontalBlockSize * 3,
                            bottom: SizeUtils.horizontalBlockSize * 18,
                            left: SizeUtils.horizontalBlockSize * 3,
                            right: SizeUtils.horizontalBlockSize * 3,
                          ),
                          shrinkWrap: true,
                          controller: productController.scrollController,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 1 / 2.25,
                            crossAxisSpacing: 5,
                            mainAxisSpacing: 10,
                          ),
                          itemCount: productController.productList.length,
                          itemBuilder: (context, index) {
                            print(
                                "productList----${productController.productList.length}");
                            final data = productController.productList[index];
                            return Stack(
                              clipBehavior: Clip.none,
                              children: [
                                productCard(
                                  isBestSeller:
                                      (data.rating ?? 0) <= 3.5 ? true : false,
                                  ima: AssetsPath.product,
                                  mask: data.name ?? "",
                                  price: data.mrp.toString() ?? "",
                                  rating: data.rating ?? 0,
                                  offer:
                                      "${AppString.descount}${data.discountPercentage}%",
                                ),
                                Positioned(
                                  bottom: SizeUtils.horizontalBlockSize * -15,
                                  left: SizeUtils.horizontalBlockSize * -7,
                                  child: productController.productList.length -
                                              1 ==
                                          index
                                      ? SpinKitSquareCircle(
                                          color: AppColor.headerTextColor,
                                          size: SizeUtils.horizontalBlockSize *
                                              13,
                                        )
                                      : const SizedBox(),
                                ),
                              ],
                            );
                          },
                        ),
            ),
          ),
        ],
      ),
    );
  }

  _headerRow() {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            Navigation.pop();
          },
          icon: const Icon(
            Icons.arrow_back,
          ),
        ),
        AppText(
          AppString.nykaa.toUpperCase(),
          color: AppColor.headerTextColor,
          fontWeight: FontWeight.bold,
          fontSize: SizeUtils.fSize_20(),
          fontStyle: FontStyle.italic,
        ),
        const Spacer(),
        Icon(
          Icons.search,
          color: AppColor.blackColor.withOpacity(0.6),
        ),
        SizedBox(
          width: SizeUtils.horizontalBlockSize * 3,
        ),
        Icon(
          Icons.favorite_border,
          color: AppColor.blackColor.withOpacity(0.6),
        ),
        SizedBox(
          width: SizeUtils.horizontalBlockSize * 3,
        ),
        Icon(
          Icons.wallet_giftcard,
          color: AppColor.blackColor.withOpacity(0.6),
        ),
        SizedBox(
          width: SizeUtils.horizontalBlockSize * 3,
        ),
      ],
    );
  }

  _chipRow() {
    return Padding(
      padding: EdgeInsets.only(
        left: SizeUtils.horizontalBlockSize * 3,
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: SizeUtils.horizontalBlockSize * 1,
              ),
              child: headerChip(
                AppString.sheetMasks,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: SizeUtils.horizontalBlockSize * 1,
              ),
              child: headerChip(
                AppString.masks,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: SizeUtils.horizontalBlockSize * 1,
              ),
              child: headerChip(
                AppString.sleepingMasks,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
