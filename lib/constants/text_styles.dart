import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

class MakvicAuticiTextStyles {
  /// Title text styles - Normal
  static final title = GoogleFonts.roboto(
    color: MakvicAuticiColors.black,
    fontSize: 20,
    fontWeight: FontWeight.w500,
    height: 1.6,
  );
  static final titleError = GoogleFonts.roboto(
    color: MakvicAuticiColors.primaryRed,
    fontSize: 20,
    fontWeight: FontWeight.w500,
    height: 1.6,
  );

  /// Title text styles - Bold
  static final titleBold = GoogleFonts.roboto(
    color: MakvicAuticiColors.black,
    fontSize: 20,
    fontWeight: FontWeight.w700,
    height: 1.6,
  );
  static final titleErrorBold = GoogleFonts.roboto(
    color: MakvicAuticiColors.primaryRed,
    fontSize: 20,
    fontWeight: FontWeight.w700,
    height: 1.6,
  );

  /// Body text styles - Normal
  static final body = GoogleFonts.roboto(
    color: MakvicAuticiColors.black,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    height: 1.6,
  );
  static final bodyError = GoogleFonts.roboto(
    color: MakvicAuticiColors.primaryRed,
    fontSize: 14,
    fontWeight: FontWeight.w700,
    height: 1.6,
  );

  /// Body text styles - Bold
  static final bodyBold = GoogleFonts.roboto(
    color: MakvicAuticiColors.black,
    fontSize: 14,
    fontWeight: FontWeight.w700,
    height: 1.6,
  );
  static final bodyErrorBold = GoogleFonts.roboto(
    color: MakvicAuticiColors.primaryRed,
    fontSize: 14,
    fontWeight: FontWeight.w700,
    height: 1.6,
  );
}
