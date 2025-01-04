import 'package:flutter/material.dart';

class TableHeaderComponent extends StatelessWidget {
  const TableHeaderComponent({
    super.key,
    required int total,
    required int selected,
  })  : _total = total,
        _selected = selected;

  final int _total;
  final int _selected;

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Total: $_total',
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 8),
          Text(
            'Selected: $_selected',
            style: const TextStyle(fontSize: 16),
          ),
        ],
      );
}
