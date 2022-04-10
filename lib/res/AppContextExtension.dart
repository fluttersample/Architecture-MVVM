

import 'package:flutter/cupertino.dart';
import 'package:test_mvvm/res/Resources.dart';

extension AppContext on BuildContext {
  Resources get resources => Resources.of(this);
}