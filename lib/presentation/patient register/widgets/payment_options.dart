import 'package:amrita_treatment/application/register%20patient/payment_option_provider.dart';
import 'package:amrita_treatment/widgets/common/app_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Widget buildPaymentOptions(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text16Normal(text: "Payment Option", fontWeight: FontWeight.w500),
      SizedBox(height: 10),
      Container(
        width: double.infinity,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
        ),
        child: Consumer<PaymentOptionProvider>(
          builder: (context, paymentProvider, child) {
            return RadioGroup<String>(
              groupValue: paymentProvider.selectedPaymentOption,
              onChanged: (String? value) {
                if (value != null) {
                  paymentProvider.setPaymentOption(value);
                }
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: RadioListTile<String>(
                      title: Text('Cash', style: TextStyle(fontSize: 14)),
                      value: 'Cash',
                      contentPadding: EdgeInsets.zero,
                      visualDensity: VisualDensity.compact,
                      dense: true,
                    ),
                  ),
                  Expanded(
                    child: RadioListTile<String>(
                      title: Text('UPI', style: TextStyle(fontSize: 14)),
                      value: 'UPI',
                      contentPadding: EdgeInsets.zero,
                      visualDensity: VisualDensity.compact,
                      dense: true,
                    ),
                  ),
                  Expanded(
                    child: RadioListTile<String>(
                      title: Text('Card', style: TextStyle(fontSize: 14)),
                      value: 'Card',
                      contentPadding: EdgeInsets.zero,
                      visualDensity: VisualDensity.compact,
                      dense: true,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    ],
  );
}
