import 'dart:convert';
import 'dart:html';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class PdfService {
  Future<void> printCustomersPdf() async {
    final pdf = pw.Document();

    pdf.addPage(pw.Page(
        pageFormat: PdfPageFormat.roll80,
        build: (pw.Context context) {
          return pw.Column(
            children: [
              pw.Text("ChanduRam's"),
              pw.Text("NN Bakers & Provisions"),
              pw.Text("Mangalam Arcade,Near Venus Book,"),
              pw.Text("Dharampeth,Nagpur-440011"),
              pw.Text("90214-98825/27,98224-66254"),
              pw.Text("FSSAI LICENSE NO 12479625892 "),
              pw.Text("GST NO: DF12479625892 "),
              pw.Divider(),
              pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Text("Memo No:231235/107", style: pw.TextStyle()),
                    pw.Text("12-12-2023 19:40")
                  ]),
              pw.Divider(),
              pw.Text("CASH MEMO "),
              pw.Divider(),
              pw.Table(
                  columnWidths: {
                    0: pw.FlexColumnWidth(1),
                    1: pw.FlexColumnWidth(3),
                    2: pw.FlexColumnWidth(1),
                    3: pw.FlexColumnWidth(1),
                    4: pw.FlexColumnWidth(2),
                    5: pw.FlexColumnWidth(1),
                  },
                  children: [
                        pw.TableRow(children: [
                          pw.Text("Sr no."),
                          pw.Text("Description"),
                          pw.Text("Qty"),
                          pw.Text("MRP"),
                          pw.Text("Rate"),
                          pw.Text("Amt."),
                        ])
                      ] +
                      List.generate(
                          8,
                          (index) => pw.TableRow(children: [
                                pw.Text('${index+1}'),
                                pw.Text('Good'),
                                pw.Text('50g'),
                                pw.Text('100.0'),
                                pw.Text('80.00'),
                                pw.Text('80.00'),
                              ]))),
              pw.Divider(),
              pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Text("Total"),
                    pw.Text("21"),
                    pw.Text("₹ 1599.00"),
                  ]),
              pw.Divider(),
              pw.Row(mainAxisAlignment: pw.MainAxisAlignment.end, children: [
                pw.Text("Net Saving: 82.00"),
              ]),
              pw.Row(mainAxisAlignment: pw.MainAxisAlignment.end, children: [
                pw.Text("Sub Total: 1681.00"),
              ]),
              pw.Divider(),
              pw.Row(mainAxisAlignment: pw.MainAxisAlignment.end, children: [
                pw.Text("₹ 1681.00"),
              ]),
            ],
          ); // Center
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
