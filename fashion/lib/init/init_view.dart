import 'package:fashion/common/assets.dart';
import 'package:fashion/common/brand_color.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'init_view_model.dart';

class InitView extends StatelessWidget {
  const InitView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<InitViewModel>.nonReactive(
        viewModelBuilder: () => InitViewModel(),
        onModelReady: (model) => model.onInit(context),
        builder: (context, model, _) {
          return Scaffold(
            backgroundColor: BrandColor.brandColor,
            body: Center(
              child: Image.asset(
                logo,
                height: 128.0,
                width: 128.0,
              ),
            ),
          );
        });
  }
}
