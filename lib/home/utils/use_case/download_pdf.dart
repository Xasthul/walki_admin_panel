import 'dart:convert';
import 'dart:html' as html; // ignore: avoid_web_libraries_in_flutter

void downloadPdf({
  required String name,
required  List<int> bytes,
}) {
  html.AnchorElement anchorElement =
      html.AnchorElement(href: "data:application/octet-stream;charset=utf-16le;base64,${base64.encode(bytes)}");
  anchorElement.download = '$name.pdf';
  anchorElement.click();
}
