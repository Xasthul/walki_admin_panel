import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:walki_admin_panel/app/utils/di/getIt.dart';
import 'package:walki_admin_panel/home/places/store/places_store.dart';
import 'package:walki_admin_panel/home/places/utils/widget/places_table.dart';
import 'package:walki_admin_panel/home/utils/entity/generate_report_type.dart';
import 'package:walki_admin_panel/home/utils/entity/place.dart';
import 'package:walki_admin_panel/home/utils/use_case/download_pdf.dart';
import 'package:walki_admin_panel/home/utils/widget/pdf_table.dart';
import 'package:walki_admin_panel/home/utils/widget/report_generation_component.dart';
import 'package:walki_admin_panel/home/utils/widget/table_header_component.dart';

class PlacesContent extends StatefulWidget {
  const PlacesContent({super.key});

  @override
  State<PlacesContent> createState() => _PlacesContentState();
}

class _PlacesContentState extends State<PlacesContent> {
  final _store = getIt<PlacesStore>();

  @override
  Widget build(BuildContext context) => Observer(
        builder: (context) {
          if (_store.places.isNotEmpty) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TableHeaderComponent(
                      total: _store.places.length,
                      selected: _store.selectedPlaces.length,
                    ),
                    const SizedBox(height: 12),
                    const PlacesTable(),
                  ],
                ),
                const SizedBox(width: 48),
                ReportGenerationComponent(onGenerateReport: _generateReport),
                const SizedBox(width: 12),
              ],
            );
          }
          return const Text(
            'There are no places yet.',
            style: TextStyle(fontSize: 16),
          );
        },
      );

  Future<void> _generateReport(GenerateReportType reportType) async {
    List<Place> places;
    switch (reportType) {
      case GenerateReportForNRows():
        places = _store.places.take(reportType.numberOfRows).toList();
      case GenerateReportForSelectedRows():
        places = _store.places.where(_store.selectedPlaces.contains).toList();
    }
    if (places.isEmpty) {
      return;
    }
    final pdfBytes = await PdfTable.generate(
      reportType: reportType,
      columns: [
        PdfTableColumn(name: 'Name', isNumeric: false),
        PdfTableColumn(name: 'Times Visited', isNumeric: true),
        PdfTableColumn(name: 'Number of Reviews', isNumeric: true),
      ],
      rows: places
          .map(
            (place) => PdfTable.row(
              [
                PdfTable.cell(place.name),
                PdfTable.cell('${place.timesVisited}', endAlignment: true),
                PdfTable.cell('${place.reviewsNumber}', endAlignment: true),
              ],
            ),
          )
          .toList(),
    );
    downloadPdf(
      name: "Walki Report Places ${DateTime.now().millisecondsSinceEpoch}",
      bytes: pdfBytes,
    );
  }
}
