import 'package:flutter/material.dart';

class AppSizes {
  static const kEmptyWidget = SizedBox.shrink();

  static const kPadding8 = EdgeInsets.all(8.0);
  static const kPaddingH16V8 = EdgeInsets.symmetric(
    horizontal: 16.0,
    vertical: 8.0,
  );
  static const kPaddingH12 = EdgeInsets.symmetric(horizontal: 12);
  static const kPaddingH4V8 = EdgeInsets.symmetric(
    horizontal: 4.0,
    vertical: 8.8,
  );
  static const kPadding16 = EdgeInsets.all(16.0);
  static const kPadding8Bottom64 = EdgeInsets.only(
    right: 8.0,
    left: 8.0,
    top: 8.0,
    bottom: 64.0,
  );

  static const kMarginV16 = EdgeInsets.symmetric(vertical: 16.0);
  static const kMarginV32 = EdgeInsets.symmetric(vertical: 32);
  static const kMarginTop16 = EdgeInsets.only(top: 16);
  static const kMarginBottom20 = EdgeInsets.only(bottom: 20);

  static final kBorderRadius6 = BorderRadius.circular(6);
  static final kBorderRadius8 = BorderRadius.circular(8);
  static final kBorderRadius12 = BorderRadius.circular(12);
  static final kBorderRadius40 = BorderRadius.circular(40.0);

  static const kSizeH4 = SizedBox(height: 4.0);
  static const kSizeH8 = SizedBox(height: 8.0);
  static const kSizeH12 = SizedBox(height: 12.0);
  static const kSizeH16 = SizedBox(height: 16.0);
  static const kSizeH20 = SizedBox(height: 20);
  static const kSizeH24 = SizedBox(height: 24);
  static const kSizeH32 = SizedBox(height: 32);
  static const kSizeH40 = SizedBox(height: 40);
  static const kSizeW40 = SizedBox(width: 40.0);

  static const double kSpacing8 = 8.0;
  static const double kSpacing4 = 4.0;
  static const double kSpacing16 = 16.0;
  static const double kSpacing32 = 32.0;
}
