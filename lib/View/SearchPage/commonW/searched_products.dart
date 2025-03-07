import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:market_app/Controller/home_page_controller.dart';
import 'package:market_app/Controller/search_controller.dart';
import 'package:market_app/Core/Shared%20widgets/app_circle_indicator.dart';
import 'package:market_app/Model/Enums/request_enum.dart';
import 'package:market_app/Model/Models/product_model.dart';
import 'package:market_app/View/HomePage/commonW/product_card_home.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SearchedProducts extends StatelessWidget {
  const SearchedProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchPageController>(
        id: 'searched products',
        builder: (controller) {
          return Obx(() => Skeletonizer(
                enabled: controller.searchReqState.value == RequestEnum.waiting
                    ? true
                    : false,
                child: controller.searchedProducts.isEmpty
                    ? const Center(
                        child: Text('there is no product'),
                      )
                    : GridView.builder(
                        controller: controller.searchedProductsScrollController,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.searchReqState.value ==
                                RequestEnum.waiting
                            ? 6
                            : controller.isMaxSearchedProducts == false
                                ? controller.searchedProducts.length + 1
                                : controller.searchedProducts.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 20.w,
                          mainAxisSpacing: 10.h,
                          childAspectRatio: 0.8,
                        ),
                        itemBuilder: (context, index) {
                          if (controller.searchReqState.value ==
                              RequestEnum.waiting) {
                            return ProductCartHome(
                                product: ProductModel(
                                    id: 1,
                                    name: 'product11',
                                    isFavorite: true.obs,
                                    priceD: 12,
                                    priceG: 12,
                                    priceSG: 21,
                                    minQntG: 12,
                                    minQntSG: 21),
                                index: index);
                          } else {
                            return !controller.isMaxSearchedProducts &&
                                    index == controller.searchedProducts.length
                                ? SizedBox(
                                    height: 30.h,
                                    child: AppCircleIndicator(size: 12.sp))
                                : ProductCartHome(
                                    product: controller.searchedProducts[index],
                                    index: index,
                                  );
                          }
                        },
                      ),
              ));
        });
  }
}
