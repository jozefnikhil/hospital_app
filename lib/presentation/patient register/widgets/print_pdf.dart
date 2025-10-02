import 'package:amrita_treatment/core/app_colors.dart';
import 'package:amrita_treatment/core/images_res.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

void generatePdf(
  BuildContext context, {
  required String name,
  required String address,
  required String phone,
  required String dateNdTime,
  required String? treatmenttime,
  required String? treatmentId,
  required double totalAmount,
  required double discountAmount,
  required double advanceAmount,
  required double balanceAmount,
  required List<Map<String, dynamic>> patients,
}) async {
  final pdf = pw.Document();
  // Define column widths
  final col1Width = 220.0; // Treatment
  final col2Width = 60.0; // Price
  final col3Width = 50.0; // Male
  final col4Width = 60.0; // Female
  final col5Width = 50.0; // Total
  // Load custom fonts for Unicode support
  final ttf = await PdfGoogleFonts.robotoRegular();
  final ttfBold = await PdfGoogleFonts.robotoBold();

  final Uint8List imageData = await rootBundle
      .load(ImagesRes.logo)
      .then((value) => value.buffer.asUint8List());
  final pw.ImageProvider imageProvider = pw.MemoryImage(imageData);

  pdf.addPage(
    pw.Page(
      build: (context) {
        return pw.Column(
          children: [
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.start,
              children: [
                pw.Image(imageProvider, width: 100, height: 100),
                pw.SizedBox(width: 150),
                pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.end,
                  children: [
                    pw.Text(
                      'KUMARAKOM',
                      style: pw.TextStyle(font: ttfBold, fontSize: 10),
                    ),
                    pw.SizedBox(height: 2),
                    pw.Text(
                      'Cheepunkal P.O. Kumarakom, kottayam, Kerala - 686563',
                      style: pw.TextStyle(
                        font: ttf,
                        fontSize: 10,
                        color: PdfColor.fromInt(
                          AppColors.primaryTextElement.value,
                        ),
                      ),
                    ),
                    pw.SizedBox(height: 2),
                    pw.Text(
                      'e-mail: unknown@gmail.com',
                      style: pw.TextStyle(
                        font: ttf,
                        fontSize: 10,
                        color: PdfColor.fromInt(
                          AppColors.primaryTextElement.value,
                        ),
                      ),
                    ),
                    pw.SizedBox(height: 2),
                    pw.Text(
                      'Mob: +91 9876543210 | +91 9786543210',
                      style: pw.TextStyle(
                        font: ttf,
                        fontSize: 10,
                        color: PdfColor.fromInt(
                          AppColors.primaryTextElement.value,
                        ),
                      ),
                    ),
                    pw.SizedBox(height: 2),
                    pw.Text(
                      'GST No: 32AABCU9603R1ZW',
                      style: pw.TextStyle(
                        font: ttf,
                        fontSize: 10,
                        color: PdfColor.fromInt(
                          AppColors.primaryTextElement.value,
                        ),
                      ),
                    ),
                    pw.SizedBox(height: 2),
                  ],
                ),
              ],
            ),
            pw.SizedBox(height: 40),
            pw.Align(
              alignment: pw.Alignment.centerLeft,
              child: pw.Text(
                "Patient Details",
                style: pw.TextStyle(
                  font: ttfBold,
                  fontSize: 13,
                  color: PdfColor.fromInt(AppColors.buttoncolor.value),
                ),
              ),
            ),
            pw.SizedBox(height: 30),
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Container(
                      width: 200,
                      child: pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                        children: [
                          pw.Text("Name", style: pw.TextStyle(font: ttf)),
                          pw.Flexible(
                            child: pw.Text(
                              name,
                              textAlign: pw.TextAlign.right,
                              style: pw.TextStyle(font: ttf),
                            ),
                          ),
                        ],
                      ),
                    ),
                    pw.SizedBox(height: 30),
                    pw.Container(
                      width: 200,
                      child: pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                        children: [
                          pw.Text("Address", style: pw.TextStyle(font: ttf)),
                          pw.Flexible(
                            child: pw.Text(
                              address,
                              textAlign: pw.TextAlign.right,
                              style: pw.TextStyle(font: ttf),
                            ),
                          ),
                        ],
                      ),
                    ),
                    pw.SizedBox(height: 30),
                    pw.Container(
                      width: 200,
                      child: pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                        children: [
                          pw.Text(
                            "Whatsapp Number",
                            style: pw.TextStyle(font: ttf),
                          ),
                          pw.Flexible(
                            child: pw.Text(
                              phone,
                              textAlign: pw.TextAlign.right,
                              style: pw.TextStyle(font: ttf),
                            ),
                          ),
                        ],
                      ),
                    ),
                    pw.SizedBox(height: 30),
                  ],
                ),
                pw.SizedBox(width: 25),
                pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Container(
                      width: 200,
                      child: pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                        children: [
                          pw.Text("Booked on", style: pw.TextStyle(font: ttf)),
                          pw.Flexible(
                            child: pw.Text(
                              DateTime.now().toString().split(' ')[0],
                              textAlign: pw.TextAlign.right,
                              style: pw.TextStyle(font: ttf),
                            ),
                          ),
                        ],
                      ),
                    ),
                    pw.SizedBox(height: 30),
                    pw.Container(
                      width: 200,
                      child: pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                        children: [
                          pw.Text(
                            "Treatment Date",
                            style: pw.TextStyle(font: ttf),
                          ),
                          pw.Flexible(
                            child: pw.Text(
                              dateNdTime,
                              textAlign: pw.TextAlign.right,
                              style: pw.TextStyle(font: ttf),
                            ),
                          ),
                        ],
                      ),
                    ),
                    pw.SizedBox(height: 30),
                    pw.Container(
                      width: 200,
                      child: pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                        children: [
                          pw.Text(
                            "Treatment time",
                            style: pw.TextStyle(font: ttf),
                          ),
                          pw.Flexible(
                            child: pw.Text(
                              treatmenttime ?? '',
                              textAlign: pw.TextAlign.right,
                              style: pw.TextStyle(font: ttf),
                            ),
                          ),
                        ],
                      ),
                    ),
                    pw.SizedBox(height: 30),
                  ],
                ),
              ],
            ),
            pw.SizedBox(height: 20),

            pw.Row(
              children: [
                pw.Container(
                  width: col1Width,
                  child: pw.Text(
                    "Treatment",
                    style: pw.TextStyle(
                      font: ttfBold,
                      color: PdfColor.fromInt(AppColors.buttoncolor.value),
                    ),
                  ),
                ),
                pw.Container(
                  width: col2Width,
                  child: pw.Text(
                    "Price",
                    style: pw.TextStyle(
                      font: ttfBold,
                      color: PdfColor.fromInt(AppColors.buttoncolor.value),
                    ),
                  ),
                ),
                pw.Container(
                  width: col3Width,
                  child: pw.Text(
                    "Male",
                    style: pw.TextStyle(
                      font: ttfBold,
                      color: PdfColor.fromInt(AppColors.buttoncolor.value),
                    ),
                  ),
                ),
                pw.Container(
                  width: col4Width,
                  child: pw.Text(
                    "Female",
                    style: pw.TextStyle(
                      font: ttfBold,
                      color: PdfColor.fromInt(AppColors.buttoncolor.value),
                    ),
                  ),
                ),
                pw.Container(
                  width: col5Width,
                  child: pw.Text(
                    "Total",
                    style: pw.TextStyle(
                      font: ttfBold,
                      color: PdfColor.fromInt(AppColors.buttoncolor.value),
                    ),
                  ),
                ),
              ],
            ),
            pw.Divider(),

            // Table Data
            ...patients.map((patientMap) {
              final maleCount = patientMap["male"] ?? 0;
              final femaleCount = patientMap["female"] ?? 0;
              // final total = maleCount + femaleCount;

              return pw.Row(
                children: [
                  pw.Container(
                    width: col1Width,
                    child: pw.Text(
                      treatmentId ?? "",
                      style: pw.TextStyle(font: ttf),
                    ),
                  ),
                  pw.Container(
                    width: col2Width,
                    child: pw.Text(
                      totalAmount.toString(),
                      style: pw.TextStyle(font: ttf),
                    ),
                  ),
                  pw.Container(
                    width: col3Width,
                    child: pw.Text(
                      maleCount.toString(),
                      style: pw.TextStyle(font: ttf),
                    ),
                  ),
                  pw.Container(
                    width: col4Width,
                    child: pw.Text(
                      femaleCount.toString(),
                      style: pw.TextStyle(font: ttf),
                    ),
                  ),
                  pw.Container(
                    width: col5Width,
                    child: pw.Text(
                      totalAmount.toString(),
                      style: pw.TextStyle(font: ttf),
                    ),
                  ),
                ],
              );
            }),
            pw.Divider(),
            pw.SizedBox(height: 30),
            pw.Align(
              alignment: pw.Alignment.centerRight,
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.end,
                children: [
                  pw.Container(
                    width: 200,
                    child: pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                      children: [
                        pw.Text("Total Amount", style: pw.TextStyle(font: ttf)),
                        pw.Text(
                          totalAmount.toString(),
                          textAlign: pw.TextAlign.right,
                          style: pw.TextStyle(font: ttf),
                        ),
                      ],
                    ),
                  ),
                  pw.SizedBox(height: 10),
                  pw.Container(
                    width: 200,
                    child: pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                      children: [
                        pw.Text("Discount", style: pw.TextStyle(font: ttf)),
                        pw.Text(
                          discountAmount.toString(),
                          textAlign: pw.TextAlign.right,
                          style: pw.TextStyle(font: ttf),
                        ),
                      ],
                    ),
                  ),
                  pw.SizedBox(height: 10),
                  pw.Container(
                    width: 200,
                    child: pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                      children: [
                        pw.Text("Advance", style: pw.TextStyle(font: ttf)),
                        pw.Text(
                          advanceAmount.toString(),
                          textAlign: pw.TextAlign.right,
                          style: pw.TextStyle(font: ttf),
                        ),
                      ],
                    ),
                  ),
                  pw.SizedBox(height: 10),
                  pw.Container(
                    width: 200,
                    child: pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                      children: [
                        pw.Text("Balance", style: pw.TextStyle(font: ttf)),
                        pw.Text(
                          balanceAmount.toString(),
                          textAlign: pw.TextAlign.right,
                          style: pw.TextStyle(font: ttf),
                        ),
                      ],
                    ),
                  ),
                  pw.SizedBox(height: 50),
                ],
              ),
            ),
            pw.Align(
              alignment: pw.Alignment.centerRight,
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.end,
                children: [
                  pw.Text(
                    "Thank you for choosing us",
                    style: pw.TextStyle(
                      font: ttfBold,
                      fontSize: 16,
                      color: PdfColor.fromInt(AppColors.buttoncolor.value),
                    ),
                  ),
                  pw.SizedBox(height: 15),
                  pw.Text(
                    "Your well-being is our commitment, and we're honored",
                  ),
                  pw.Text("you've entrusted us with your health journey"),
                ],
              ),
            ),
          ],
        );
      },
    ),
  );

  // Display PDF directly in a new screen
  final pdfBytes = await pdf.save();

  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => Scaffold(
        appBar: AppBar(title: const Text('Treatment Invoice')),
        body: PdfPreview(
          build: (format) => pdfBytes,
          canChangeOrientation: false,
          canChangePageFormat: false,
          canDebug: false,
        ),
      ),
    ),
  );
}
