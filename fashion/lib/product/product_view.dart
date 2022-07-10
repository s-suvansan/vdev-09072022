import 'package:fashion/common/brand_color.dart';
import 'package:fashion/provider/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../common/app.dart';
import '../common/brand_text.dart';

class ProductView extends StatelessWidget {
  static const routeName = "Product";
  const ProductView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: BrandText.commonText(text: "Product", fontWeight: BrandText.bold, fontSize: 20.0, color: BrandColor.light),
      ),
      body: SafeArea(
        child: Consumer<ProductProvider>(builder: (context, value, _) {
          if (!value.isLoading && value.productModel != null) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: BrandColor.ash.withOpacity(0.2),
                  child: Image.network(
                    value.productModel?.image ?? "",
                    height: 200.0,
                    width: double.infinity,
                  ),
                ),
                const SizedBox(height: 8.0),
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.all(8.0),
                    children: [
                      BrandText.commonText(
                        text: "# ${App.capitalize(value.productModel?.category ?? "")}",
                        fontSize: 14.0,
                        fontWeight: BrandText.bold,
                        color: BrandColor.brandColor,
                      ),
                      const SizedBox(height: 8.0),
                      BrandText.commonText(
                        text: value.productModel?.title ?? "",
                        fontSize: 22.0,
                        maxLines: 5,
                        fontWeight: BrandText.bold,
                      ),
                      const SizedBox(height: 16.0),
                      Row(
                        children: [
                          Expanded(
                            child: BrandText.commonText(
                              text: App.price(12.4),
                              fontSize: 20.0,
                              fontWeight: BrandText.bold,
                              color: BrandColor.dark.withOpacity(0.8),
                            ),
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.star,
                                size: 20.0,
                                color: Colors.amber,
                              ),
                              const SizedBox(width: 4.0),
                              BrandText.commonText(
                                text: App.rating(value.productModel?.rating),
                                fontSize: 20.0,
                                fontWeight: BrandText.bold,
                                color: BrandColor.dark.withOpacity(0.8),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 16.0),
                      BrandText.commonText(
                        text: value.productModel?.description ?? "",
                        fontSize: 14.0,
                        maxLines: 50,
                      ),
                    ],
                  ),
                ),
              ],
            );
          } else if (value.isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return const SizedBox();
          }
        }),
      ),
    );
  }
}
