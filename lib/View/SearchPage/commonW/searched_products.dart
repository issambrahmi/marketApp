import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:market_app/Controller/home_page_controller.dart';
import 'package:market_app/Core/Shared%20widgets/app_circle_indicator.dart';
import 'package:market_app/Model/Enums/request_enum.dart';
import 'package:market_app/Model/Models/product_model.dart';
import 'package:market_app/View/HomePage/commonW/product_card_home.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SearchedProducts extends StatelessWidget {
  const SearchedProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageController>(builder: (controller) {
      return Obx(() => Skeletonizer(
            enabled:
                controller.productsReqState.value == RequestEnum.waiting
                    ? true
                    : false,
            child: (controller.selectedCategorie.value != 0 &&
                        controller.categorieProducts.isEmpty) ||
                    (controller.selectedCategorie.value == 0 &&
                        controller.products.isEmpty)
                ? const Center(
                    child: Text('there is no product'),
                  )
                : GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.productsReqState.value ==
                            RequestEnum.waiting
                        ? 6
                        : controller.selectedCategorie.value == 0
                            ? (controller.isMaxProducts
                                ? controller.products.length
                                : controller.products.length + 1)
                            : (controller.isMaxCategorieProducts
                                ? controller.categorieProducts.length
                                : controller.categorieProducts.length + 1),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 20.w,
                      mainAxisSpacing: 10.h,
                      childAspectRatio: 0.8,
                    ),
                    itemBuilder: (context, index) {
                      if (controller.productsReqState.value ==
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
                        return controller.selectedCategorie.value == 0
                            ? (!controller.isMaxProducts &&
                                    index == controller.products.length
                                ? AppCircleIndicator(size: 15.sp)
                                : ProductCartHome(
                                    product: controller.products[index],
                                    index: index,
                                  ))
                            : (!controller.isMaxCategorieProducts &&
                                    index ==
                                        controller.categorieProducts.length
                                ? AppCircleIndicator(size: 15.sp)
                                : ProductCartHome(
                                    product:
                                        controller.categorieProducts[index],
                                    index: index,
                                  ));
                      }
                    },
                  ),
          ));
    });
  }
}
