import 'dart:convert';
import 'dart:html';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class PdfServiceTwo {
  Future<void> printCustomersBillPdf() async {
    final pdf = pw.Document();

    pdf.addPage(pw.Page(
        pageFormat: PdfPageFormat.roll57.landscape,
        build: (pw.Context context) {
          return pw.Column(children: [


            pw.Text('Gyan Jyoti Nagpur'),
          ]); // Center
        })); // Page

    var savedFile = await pdf.save();
    List<int> fileInts = List.from(savedFile);
    AnchorElement(
        href:
            "data:application/octet-stream;charset=utf-16le;base64,${base64.encode(fileInts)}")
      ..setAttribute("download", "${DateTime.now().millisecondsSinceEpoch}.pdf")
      ..click();
  }
}
