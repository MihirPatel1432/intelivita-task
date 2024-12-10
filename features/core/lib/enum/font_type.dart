import 'dart:ui';

//TODO:If you added any other font add in this below enum
enum FontFamilyType { prozaLibre }

enum FontWeightType { light, regular, medium, semiBold, bold }

getFontFamilyType(FontFamilyType? fontFamilyType) {
  switch (fontFamilyType) {
    case FontFamilyType.prozaLibre:
      return 'ProzaLibre';
    case null:
      return '';
  }
}

getFontWeightType(FontWeightType? fontWeightType) {
  switch (fontWeightType) {
    case FontWeightType.light:
      return FontWeight.w300;
    case FontWeightType.regular:
      return FontWeight.w400;
    case FontWeightType.medium:
      return FontWeight.w500;
    case FontWeightType.semiBold:
      return FontWeight.w600;
    case FontWeightType.bold:
      return FontWeight.w700;
    case null:
      return FontWeightType.regular;
  }
}
