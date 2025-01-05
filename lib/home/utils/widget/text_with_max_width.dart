import 'package:flutter/material.dart';

class TextWithMaxWidth extends StatelessWidget {
  const TextWithMaxWidth({
    super.key,
    required String text,
    required double maxWidth,
  })  : _text = text,
        _maxWidth = maxWidth;

  final String _text;
  final double _maxWidth;

  @override
  Widget build(BuildContext context) => ConstrainedBox(
        constraints: BoxConstraints(maxWidth: _maxWidth),
        child: Text(_text),
      );
}
