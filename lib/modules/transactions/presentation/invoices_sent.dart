import 'package:flutter/material.dart';

import '../data/invoices_list.dart';
import '../domain/invoice.dart';

class InvoicesSent extends StatelessWidget {
  const InvoicesSent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Invoices Sent",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListView.builder(
              padding: EdgeInsets.zero,
              physics: const ClampingScrollPhysics(),
              shrinkWrap: true,
              itemCount: invoicesList.length,
              itemBuilder: (context, index) {
                final invoice = invoicesList[index];
                return ListTile(
                  title: Text(invoice.title),
                  subtitle: Text(invoice.formattedDate),
                  trailing: Text(invoice.formattedAmount),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
