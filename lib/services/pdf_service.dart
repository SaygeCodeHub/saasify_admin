import 'dart:convert';
import 'dart:core';
import 'dart:html';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import '../data/models/pdf/invoice.dart';
import '../data/models/pdf/invoice_customer.dart';

class PdfService {
  Future<void> printPOSInvoicePdf(
    List<InvoiceInfo> invoiceInfo,
  ) async {
    final pdf = pw.Document();

    pdf.addPage(pw.Page(
        pageFormat: PdfPageFormat.roll80,
        build: (pw.Context context) {
          return pw.Column(children: [
            pw.Text("ChanduRam's", style: const pw.TextStyle(fontSize: 14)),
            pw.Text("NN Bakers & Provisions",
                style:
                    pw.TextStyle(fontSize: 12, fontWeight: pw.FontWeight.bold)),
            pw.Text("Mangalam Arcade,Near Venus Book,",
                style: const pw.TextStyle(fontSize: 10)),
            pw.Text("Dharampeth,Nagpur-440011",
                style: const pw.TextStyle(fontSize: 10)),
            pw.Text("90214-98825/27,98224-66254",
                style:
                    pw.TextStyle(fontSize: 12, fontWeight: pw.FontWeight.bold)),
            pw.Text("FSSAI LICENSE NO 12479625892 ",
                style: const pw.TextStyle(fontSize: 10)),
            pw.Text("GST NO: DF12479625892 ",
                style: const pw.TextStyle(fontSize: 10)),
            pw.Divider(),
            pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Text("Memo No:23123",
                      style: const pw.TextStyle(fontSize: 10)),
                  pw.Text("12-12-2023 19:40",
                      style: const pw.TextStyle(fontSize: 10))
                ]),
            pw.Divider(),
            pw.Text("CASH MEMO ",
                style:
                    pw.TextStyle(fontSize: 10, fontWeight: pw.FontWeight.bold)),
            pw.Divider(),
            pw.Table(
                columnWidths: {
                  0: const pw.FlexColumnWidth(1),
                  1: const pw.FlexColumnWidth(3),
                  2: const pw.FlexColumnWidth(1),
                  3: const pw.FlexColumnWidth(1),
                  4: const pw.FlexColumnWidth(2),
                  5: const pw.FlexColumnWidth(1),
                },
                children: [
                      pw.TableRow(children: [
                        pw.Text("Sr no.",
                            style: pw.TextStyle(
                                fontSize: 10, fontWeight: pw.FontWeight.bold)),
                        pw.Text("Description",
                            style: pw.TextStyle(
                                fontSize: 10, fontWeight: pw.FontWeight.bold)),
                        pw.Text("Qty",
                            style: pw.TextStyle(
                                fontSize: 10, fontWeight: pw.FontWeight.bold)),
                        pw.Text("MRP",
                            style: pw.TextStyle(
                                fontSize: 10, fontWeight: pw.FontWeight.bold)),
                        pw.Text("Rate",
                            style: pw.TextStyle(
                                fontSize: 10, fontWeight: pw.FontWeight.bold)),
                        pw.Text("Amt.",
                            style: pw.TextStyle(
                                fontSize: 10, fontWeight: pw.FontWeight.bold)),
                      ])
                    ] +
                    List.generate(invoiceInfo.length, (index) {
                      return pw.TableRow(children: [
                        pw.Text('${index + 1}',
                            style: const pw.TextStyle(fontSize: 10)),
                        pw.Text(invoiceInfo[index].description,
                            style: const pw.TextStyle(fontSize: 10)),
                        pw.Text(invoiceInfo[index].qty,
                            style: const pw.TextStyle(fontSize: 10)),
                        pw.Text(invoiceInfo[index].mRP,
                            style: const pw.TextStyle(fontSize: 10)),
                        pw.Text(invoiceInfo[index].rate,
                            style: pw.TextStyle(
                                fontSize: 10, fontWeight: pw.FontWeight.bold)),
                        pw.Text(invoiceInfo[index].amount,
                            style: const pw.TextStyle(fontSize: 10)),
                      ]);
                    })),
            pw.Divider(),
            pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Text("Total",
                      style: pw.TextStyle(
                          fontSize: 10, fontWeight: pw.FontWeight.bold)),
                  pw.Text("21",
                      style: pw.TextStyle(
                          fontSize: 10, fontWeight: pw.FontWeight.bold)),
                  pw.Text("₹ 1599.00",
                      style: pw.TextStyle(
                          fontSize: 10, fontWeight: pw.FontWeight.bold)),
                ]),
            pw.Divider(),
            pw.Row(mainAxisAlignment: pw.MainAxisAlignment.end, children: [
              pw.Text("Net Saving: 82.00",
                  style: pw.TextStyle(
                      fontSize: 10, fontWeight: pw.FontWeight.bold))
            ]),
            pw.Row(mainAxisAlignment: pw.MainAxisAlignment.end, children: [
              pw.Text("Sub Total: 1681",
                  style: const pw.TextStyle(fontSize: 10)),
            ]),
            pw.Divider(),
            pw.Row(mainAxisAlignment: pw.MainAxisAlignment.end, children: [
              pw.Text("₹ 1681.00",
                  style: pw.TextStyle(
                      fontSize: 12, fontWeight: pw.FontWeight.bold))
            ])
          ]); // Center
        })); // Page

    var savedFile = await pdf.save();
    List<int> fileInts = List.from(savedFile);
    AnchorElement(
        href:
            "data:application/octet-stream;charset=utf-16le;base64,${base64.encode(fileInts)}")
      ..setAttribute("download", "invoice.pdf")
      ..click();
  }

  Future<void> printOrdersPdf(
    List<InvoiceCustomerModel> invoiceInfo,
  ) async {
    final pdf = pw.Document();

    pdf.addPage(pw.Page(
        pageFormat: PdfPageFormat.a4.landscape,
        build: (pw.Context context) {
          return pw.Column(children: [
            pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Text("Logo Name:Sassify",
                      style: const pw.TextStyle(fontSize: 12)),
                  pw.Text("Date:12-12-2023",
                      style: const pw.TextStyle(fontSize: 12))
                ]),
            pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Text("Branch:Nagpur",
                      style: const pw.TextStyle(fontSize: 12)),
                  pw.Text("Generated by:Admin",
                      style: const pw.TextStyle(fontSize: 12))
                ]),
            pw.SizedBox(height: 20),
            pw.Table(
                // border: const pw.TableBorder(left: pw.BorderSide()),
                columnWidths: {
                  0: const pw.FlexColumnWidth(1),
                  1: const pw.FlexColumnWidth(1),
                  2: const pw.FlexColumnWidth(1),
                  3: const pw.FlexColumnWidth(1),
                  4: const pw.FlexColumnWidth(1),
                  5: const pw.FlexColumnWidth(1),
                  6: const pw.FlexColumnWidth(1),
                },
                children: [
                      pw.TableRow(children: [
                        pw.Text("Ordered Date",
                            style: pw.TextStyle(
                                fontSize: 10, fontWeight: pw.FontWeight.bold)),
                        pw.Text("Order No",
                            style: pw.TextStyle(
                                fontSize: 10, fontWeight: pw.FontWeight.bold)),
                        pw.Text("Customer contact",
                            style: pw.TextStyle(
                                fontSize: 10, fontWeight: pw.FontWeight.bold)),
                        pw.Text("Customer Name",
                            style: pw.TextStyle(
                                fontSize: 10, fontWeight: pw.FontWeight.bold)),
                        pw.Text("Payment Type",
                            style: pw.TextStyle(
                                fontSize: 10, fontWeight: pw.FontWeight.bold)),
                        pw.Text("Total Amount",
                            style: pw.TextStyle(
                                fontSize: 10, fontWeight: pw.FontWeight.bold)),
                        pw.Text("Payment Status",
                            style: pw.TextStyle(
                                fontSize: 10, fontWeight: pw.FontWeight.bold)),
                      ])
                    ] +
                    List.generate(invoiceInfo.length, (index) {
                      return pw.TableRow(children: [
                        pw.Text(invoiceInfo[index].orderedDate,
                            style: const pw.TextStyle(fontSize: 10)),
                        pw.Text(invoiceInfo[index].orderNo,
                            style: const pw.TextStyle(fontSize: 10)),
                        pw.Text(invoiceInfo[index].customerContact,
                            style: const pw.TextStyle(fontSize: 10)),
                        pw.Text(invoiceInfo[index].customerName,
                            style: pw.TextStyle(
                                fontSize: 10, fontWeight: pw.FontWeight.bold)),
                        pw.Text(invoiceInfo[index].paymentType,
                            style: const pw.TextStyle(fontSize: 10)),
                        pw.Text(invoiceInfo[index].totalAmount,
                            style: const pw.TextStyle(fontSize: 10)),
                        pw.Text(invoiceInfo[index].paymentStatus,
                            style: const pw.TextStyle(fontSize: 10)),
                      ]);
                    })),
          ]); // Center
        })); // Page

    var savedFile = await pdf.save();
    List<int> fileInts = List.from(savedFile);
    AnchorElement(
        href:
            "data:application/octet-stream;charset=utf-16le;base64,${base64.encode(fileInts)}")
      ..setAttribute("download", "orders.pdf")
      ..click();
  }
}
