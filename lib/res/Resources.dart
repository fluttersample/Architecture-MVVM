


import 'package:flutter/cupertino.dart';
import 'package:test_mvvm/res/dimentions/AppDimensions.dart';

import 'colors/AppColors.dart';

class Resources {

  final BuildContext context;

  Resources(this.context);

  AppColors get color {
    return AppColors();
  }

  AppDimension get dimension {
    return AppDimension();
  }

  static Resources of(BuildContext context){
    return Resources(context);
  }
}