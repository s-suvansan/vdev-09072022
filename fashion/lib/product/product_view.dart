import 'package:fashion/product/product_view_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ProductView extends StatelessWidget {
  const ProductView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.nonReactive(
        viewModelBuilder: () => ProductViewModel(),
        builder: (context, model, _) {
          return Scaffold(
            body: Container(),
          );
        });
  }
}
