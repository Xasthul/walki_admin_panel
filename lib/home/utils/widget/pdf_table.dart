import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:walki_admin_panel/home/utils/entity/generate_report_type.dart';

abstract class PdfTable {
  static Future<List<int>> generate({
    required String name,
    required GenerateReportType reportType,
    required List<PdfTableColumn> columns,
    required List<pw.TableRow> rows,
  }) async {
    final pdf = pw.Document();
    pdf.addPage(
      pw.Page(
        build: (_) => pw.Column(
          children: [
            pw.Center(
              child: pw.Text(
                'Walki',
                style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 20),
              ),
            ),
            pw.SizedBox(height: 20),
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Text(
                  name,
                  style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 16),
                ),
                pw.Column(
                  children: [
                    pw.Text(
                      DateFormat('HH:mm').format(DateTime.now()),
                      style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 10),
                    ),
                    pw.Text(
                      DateFormat('dd MMM yyyy').format(DateTime.now()),
                      style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 10),
                    ),
                  ],
                ),
              ],
            ),
            pw.SizedBox(height: 16),
            pw.Table(
              border: pw.TableBorder.all(color: PdfColors.grey),
              children: [
                pw.TableRow(
                  repeat: true,
                  children: columns
                      .map(
                        (column) => cell(
                          column.name,
                          bold: true,
                          endAlignment: column.isNumeric,
                        ),
                      )
                      .toList(),
                ),
                ...rows,
              ],
            ),
          ],
        ),
      ),
    );
    var savedFile = await pdf.save();
    return List.from(savedFile);
  }

  static pw.TableRow row(List<pw.Widget> cells) => pw.TableRow(
        verticalAlignment: pw.TableCellVerticalAlignment.full,
        children: cells,
      );

  static pw.Widget cell(
    String text, {
    bool endAlignment = false,
    bool bold = false,
  }) =>
      pw.ConstrainedBox(
        constraints: const pw.BoxConstraints(minWidth: 320, minHeight: 24, maxHeight: double.infinity),
        child: pw.Align(
          alignment: endAlignment ? pw.Alignment.centerRight : pw.Alignment.centerLeft,
          child: pw.Padding(
            padding: const pw.EdgeInsets.symmetric(horizontal: 4),
            child: pw.Text(
              text,
              style: pw.TextStyle(fontWeight: bold ? pw.FontWeight.bold : null),
            ),
          ),
        ),
      );
}

class PdfTableColumn {
  PdfTableColumn({
    required this.name,
    required this.isNumeric,
  });

  final String name;
  final bool isNumeric;
}
