import 'dart:convert';
import 'dart:html';
import 'dart:ui';

import 'package:syncfusion_flutter_pdf/pdf.dart';

import '../data/models/pdf/invoice_customer.dart';

class PdfService {
  Future<void> printCustomersPdf(List<InvoiceCustomerModel> data) async {
    //Create a new PDF document
    PdfDocument document = PdfDocument();
    PdfGrid grid = PdfGrid();

    //Define number of columns in table
    grid.columns.add(count: 7);
    //Add header to the grid
    grid.headers.add(1);
    //Add the rows to the grid
    PdfGridRow header = grid.headers[0];
    header.cells[0].value = "orderedDate";
    header.cells[1].value = "orderNo";
    header.cells[2].value = "customerContact";
    header.cells[3].value = "customerName";
    header.cells[4].value = "paymentType";
    header.cells[5].value = "totalAmount";
    header.cells[6].value = "paymentStatus";
    //Add header style
    header.style = PdfGridCellStyle(
      backgroundBrush: PdfBrushes.lightGray,
      textBrush: PdfBrushes.black,
      font: PdfStandardFont(PdfFontFamily.timesRoman, 12),
    );

    //Add rows to grid
    for (final customer in data) {
      PdfGridRow row = grid.rows.add();
      row.cells[0].value = customer.orderedDate;
      row.cells[1].value = customer.orderNo;
      row.cells[2].value = customer.customerContact;
      row.cells[3].value = customer.customerName;
      row.cells[4].value = customer.paymentType;
      row.cells[5].value = customer.totalAmount;
      row.cells[6].value = customer.paymentStatus;
    }
    //Add rows style
    grid.style = PdfGridStyle(
      cellPadding: PdfPaddings(left: 10, right: 3, top: 4, bottom: 5),
      backgroundBrush: PdfBrushes.white,
      textBrush: PdfBrushes.black,
      font: PdfStandardFont(PdfFontFamily.timesRoman, 12),
    );

    //Draw the grid
    grid.draw(
        page: document.pages.add(), bounds: const Rect.fromLTWH(0, 0, 0, 0));
    List<int> bytes = await document.save();

    //Download document
    AnchorElement(
        href:
            "data:application/octet-stream;charset=utf-16le;base64,${base64.encode(bytes)}")
      ..setAttribute("download", "invoice.pdf")
      ..click();

    //Dispose the document
    document.dispose();
  }
}
