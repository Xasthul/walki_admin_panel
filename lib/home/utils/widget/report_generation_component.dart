import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:walki_admin_panel/home/utils/entity/generate_report_type.dart';

class ReportGenerationComponent extends StatefulWidget {
  const ReportGenerationComponent({
    super.key,
    required Function(GenerateReportType) onGenerateReport,
  }) : _onGenerateReport = onGenerateReport;

  final Function(GenerateReportType) _onGenerateReport;

  @override
  State<ReportGenerationComponent> createState() => _ReportGenerationComponentState();
}

class _ReportGenerationComponentState extends State<ReportGenerationComponent> {
  late TextEditingController _controller;

  _ReportType _selectedReportType = _ReportType.forNRows;

  void _onReportTypeChanged(_ReportType? reportType) {
    if (reportType == null) {
      return;
    }
    setState(() => _selectedReportType = reportType);
  }

  void _onGenerateReport() {
    switch (_selectedReportType) {
      case _ReportType.forNRows:
        widget._onGenerateReport(GenerateReportForNRows(
          numberOfRows: int.parse(_controller.text),
        ));
      case _ReportType.forSelectedRows:
        widget._onGenerateReport(GenerateReportForSelectedRows());
    }
  }

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController()
      ..addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) =>
      Column(
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
                value: _ReportType.forNRows,
                groupValue: _selectedReportType,
                onChanged: _onReportTypeChanged,
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
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),
              ),
              const Text(' rows'),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              Radio(
                value: _ReportType.forSelectedRows,
                groupValue: _selectedReportType,
                onChanged: _onReportTypeChanged,
              ),
              const SizedBox(width: 8),
              const Text('selected rows'),
            ],
          ),
          const SizedBox(height: 16),
          FilledButton(
            onPressed: (_controller.text.isNotEmpty && _selectedReportType == _ReportType.forNRows) ||
                _selectedReportType == _ReportType.forSelectedRows //
                ? _onGenerateReport
                : null,
            child: const Text(
              'Generate',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      );
}

enum _ReportType {
  forNRows,
  forSelectedRows,
}
