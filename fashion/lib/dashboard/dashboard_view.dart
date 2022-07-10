import 'dart:math';

import 'package:fashion/common/brand_color.dart';
import 'package:fashion/common/brand_text.dart';
import 'package:fashion/provider/dashboard_provider.dart';
import 'package:fashion/widget/common_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

import '../common/app.dart';
import '../model/product_model.dart';
import 'dashboard_view_model.dart';

class DashboardView extends StatelessWidget {
  static const routeName = "Dashboard";
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DashboardViewModel>.nonReactive(
        viewModelBuilder: () => DashboardViewModel(),
        onModelReady: (model) => model.onInit(context),
        builder: (context, model, _) {
          return Scaffold(
            body: SafeArea(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        BrandText.commonText(text: model.userLoginStatusModel?.userEmail ?? "", fontWeight: BrandText.medium),
                        const SizedBox(width: 8.0),
                        CommonButton(text: "Sign-out", onTap: () => model.onSignOut(context))
                      ],
                    ),
                  ),
                  Expanded(
                    child: _ProductCategories(),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        BrandText.commonText(text: "Signed-in at: ", fontWeight: BrandText.medium),
                        BrandText.commonText(text: App.formattedDateTime(model.userLoginStatusModel?.signInDate)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}

class _ProductCategories extends ViewModelWidget<DashboardViewModel> {
  @override
  Widget build(BuildContext context, DashboardViewModel viewModel) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: BrandText.commonText(
              text: "Product categories",
              fontWeight: BrandText.bold,
              fontSize: 22.0,
            ),
          ),
          const SizedBox(height: 8.0),
          Expanded(child: _CategoryList()),
        ],
      ),
    );
  }
}

class _CategoryList extends ViewModelWidget<DashboardViewModel> {
  @override
  Widget build(BuildContext context, DashboardViewModel viewModel) {
    return Consumer<DashboardProvider>(builder: (context, value, _) {
      if (!value.isLoading) {
        if (value.productList.isNotEmpty) {
          return ListView.builder(
            padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 8.0),
            shrinkWrap: true,
            itemCount: value.productList.length,
            itemBuilder: ((context, index) {
              String categoryName = value.productList.keys.elementAt(index);
              List<ProductModel>? products = value.productList[categoryName];
              if (products != null && products.isNotEmpty) {
                products.sort(
                  (a, b) => a.title!.compareTo(b.title!),
                );
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
                  decoration: BoxDecoration(
                      border: Border(
                          left: borderSide(),
                          right: borderSide(),
                          bottom: borderSide(),
                          top: index == 0 ? borderSide() : BorderSide.none)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BrandText.commonText(text: App.capitalize(categoryName), fontSize: 18.0),
                      const SizedBox(height: 8.0),
                      _ProductList(
                        key: UniqueKey(),
                        products: products,
                      ),
                    ],
                  ),
                );
              } else {
                return const SizedBox();
              }
            }),
          );
        } else {
          return const SizedBox();
        }
      } else {
        return const Center(child: CircularProgressIndicator());
      }
    });
  }

  BorderSide borderSide() => BorderSide(color: BrandColor.dark, width: 0.8);
}

class _ProductList extends ViewModelWidget<DashboardViewModel> {
  final List<ProductModel>? products;
  const _ProductList({Key? key, required this.products}) : super(key: key);
  @override
  Widget build(BuildContext context, DashboardViewModel viewModel) {
    return ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => viewModel.openProductView(context, products![index]),
            child: Container(
              // height: 90.0,
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(color: BrandColor.brandColor.withOpacity(0.2), borderRadius: BorderRadius.circular(4.0)),
              child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Expanded(
                  child: SizedBox(
                    height: 80.0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BrandText.commonText(
                            text: products![index].title.toString(), fontSize: 14.0, maxLines: 2, fontWeight: BrandText.medium),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            BrandText.commonText(text: App.price(products![index].price), fontSize: 12.0),
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  size: 14.0,
                                  color: BrandColor.dark.withOpacity(0.6),
                                ),
                                BrandText.commonText(text: App.rating(products![index].rating), fontSize: 12.0),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 8.0),
                ClipRRect(
                  borderRadius: BorderRadius.circular(4.0),
                  child: Container(
                    color: BrandColor.light,
                    child: Image.network(
                      products![index].image.toString(),
                      width: 80.0,
                      height: 80.0,
                    ),
                  ),
                )
              ]),
            ),
          );
        },
        separatorBuilder: (_, __) => const SizedBox(height: 8.0),
        itemCount: products?.length ?? 0);
  }
}
