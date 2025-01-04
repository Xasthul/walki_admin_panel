import 'package:flutter/material.dart';

class ReportGenerationComponent extends StatefulWidget {
  const ReportGenerationComponent({super.key});

  @override
  State<ReportGenerationComponent> createState() => _ReportGenerationComponentState();
}

class _ReportGenerationComponentState extends State<ReportGenerationComponent> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Create a report for: ',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Radio(
                value: ReportType.forRows,
                groupValue: ReportType.forRows,
                onChanged: (_) {},
              ),
              const SizedBox(width: 8),
              const Text('first '),
              SizedBox(
                width: 32,
                child: TextField(
                  controller: _controller,
                  maxLength: 3,
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                    counterText: '',
                  ),
                ),
              ),
              const Text(' rows'),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              Radio(
                value: ReportType.forSelected,
                groupValue: ReportType.forRows,
                onChanged: (_) {},
              ),
              const SizedBox(width: 8),
              const Text('selected rows '),
            ],
          ),
          const SizedBox(height: 16),
          FilledButton(
            onPressed: () {},
            child: const Text(
              'Generate',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      );
}

enum ReportType {
  forRows,
  forSelected,
}
