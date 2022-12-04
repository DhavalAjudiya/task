import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:task/res/app_colors.dart';
import 'package:task/res/assets_path.dart';
import 'package:task/res/strings_utils.dart';
import 'package:task/utils/size_utils.dart';
import 'package:task/widget/app_text.dart';

Widget productCard({
  bool isBestSeller = false,
  int isRating = 0,
  String image = "",
  String mask = "",
  String ima = "",
  String ml = "",
  String price = "",
  String offer = "",
  int rating = 0,
}) {
  return Container(
    decoration: BoxDecoration(
      color: AppColor.whiteColor,
      boxShadow: [
        BoxShadow(
          color: AppColor.blackColor.withOpacity(0.1),
          blurRadius: 3,
          offset: Offset(0, 2),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: SizeUtils.horizontalBlockSize * 1.5,
            left: SizeUtils.horizontalBlockSize * 2,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText(
                AppString.featured,
                fontWeight: FontWeight.w600,
                color: AppColor.headerTextColor,
                fontSize: SizeUtils.fSize_12(),
                letterSpacing: 0.7,
              ),
              isBestSeller == true
                  ? const SizedBox()
                  : AppText(
                      AppString.bestSeller.toUpperCase(),
                      fontWeight: FontWeight.w600,
                      color: AppColor.offerColor,
                      fontSize: SizeUtils.fSize_12(),
                      letterSpacing: 0.7,
                    ),
            ],
          ),
        ),
        Image.asset(
          ima,
          width: SizeUtils.horizontalBlockSize * 43,
        ),
        SizedBox(
          height: SizeUtils.horizontalBlockSize * 1.5,
        ),
        Center(
          child: SizedBox(
            width: SizeUtils.horizontalBlockSize * 40,
            child: AppText(
              mask,
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
              color: AppColor.blackColor,
              fontSize: SizeUtils.fSize_16(),
              fontWeight: FontWeight.w500,
              textAlign: TextAlign.center,
            ),
          ),
        ),
        SizedBox(
          height: SizeUtils.horizontalBlockSize * 2,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AssetsPath.rupeey,
              width: SizeUtils.horizontalBlockSize * 2.3,
            ),
            AppText(
              price,
              color: AppColor.blackColor,
              fontSize: SizeUtils.fSize_16(),
              fontWeight: FontWeight.w500,
            ),
          ],
        ),
        SizedBox(
          height: SizeUtils.horizontalBlockSize * 1.5,
        ),
        Center(
          child: AppText(
            offer,
            fontWeight: FontWeight.w500,
            color: AppColor.offerColor,
            fontSize: SizeUtils.fSize_16(),
          ),
        ),
        SizedBox(
          height: SizeUtils.horizontalBlockSize * 1.5,
        ),
        Center(
          child: SizedBox(
            height: SizeUtils.verticalBlockSize * 2,
            child: rating == 0
                ? AppText(
                    AppString.noRating,
                    fontWeight: FontWeight.w500,
                    color: AppColor.blackColor.withOpacity(0.5),
                  )
                : RatingBarIndicator(
                    rating: double.parse("$rating"),
                    itemBuilder: (context, index) => Icon(
                      Icons.star,
                      color: AppColor.blackColor.withOpacity(0.5),
                    ),
                    // itemCount: data.rating ?? 0,
                    itemSize: SizeUtils.verticalBlockSize * 2,
                    direction: Axis.horizontal,
                  ),
          ),
        ),
        const Spacer(),
        Row(
          children: [
            Container(
              alignment: Alignment.center,
              height: SizeUtils.verticalBlockSize * 5,
              width: SizeUtils.horizontalBlockSize * 13,
              color: AppColor.whiteColor,
              child: Icon(Icons.favorite_border, color: AppColor.addToBag),
            ),
            Container(
              alignment: Alignment.center,
              height: SizeUtils.verticalBlockSize * 5,
              width: SizeUtils.horizontalBlockSize * 33.3,
              color: AppColor.addToBag,
              child: AppText(
                "Add to Bag",
                color: AppColor.whiteColor,
                fontWeight: FontWeight.w700,
                fontSize: SizeUtils.fSize_18(),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

headerChip(String text) {
  return Chip(
    side: BorderSide(
      color: AppColor.blackColor.withOpacity(0.1),
    ),
    backgroundColor: AppColor.whiteColor,
    label: Text(text),
    labelStyle: TextStyle(
      color: AppColor.blackColor.withOpacity(0.6),
      fontWeight: FontWeight.w600,
    ),
  );
}
