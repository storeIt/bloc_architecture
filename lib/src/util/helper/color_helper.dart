import 'dart:async';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

class ColorHelper {
  static Future<PaletteGenerator> _getPaletteGenerator(ui.Image image) async {
    Completer<PaletteGenerator> completer = Completer();
    PaletteGenerator paletteGenerator =
        PaletteGenerator.fromImage(image).then((value) => completer.complete(value)) as PaletteGenerator;
    completer.complete(paletteGenerator);
    return completer.future;
  }

  static Future<Color> getDominantColor(ui.Image image) async {
    Color dominantColor = Colors.white;
    PaletteGenerator paletteGenerator = await _getPaletteGenerator(image);
    if (paletteGenerator.dominantColor != null) {
      dominantColor = paletteGenerator.dominantColor!.color;
    }
    return dominantColor;
  }
}
