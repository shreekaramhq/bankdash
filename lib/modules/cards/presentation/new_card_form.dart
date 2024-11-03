import 'package:bankdash/widgets/barrel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NewCardForm extends StatefulWidget {
  const NewCardForm({super.key});

  @override
  State<NewCardForm> createState() => _NewCardFormState();
}

class _NewCardFormState extends State<NewCardForm> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Add New Card",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Credit Card generally means a plastic card issued by Scheduled Commercial Banks assigned to a Cardholder, with a credit limit, that can be used to purchase goods and services on credit or obtain cash advances.",
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xff718EBF),
                ),
              ),
              const SizedBox(height: 20),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    DashInput(
                      label: "Card Type",
                      placeholder: "Classic",
                      validator: (p0) {
                        if (p0 == null || p0.isEmpty) {
                          return "Please enter a card type";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    const DashInput(
                      label: "Name on Card",
                      placeholder: "Your Name",
                    ),
                    const SizedBox(height: 20),
                    DashInput(
                      label: "Card Number",
                      placeholder: "Card Number",
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                        LengthLimitingTextInputFormatter(16),
                      ],
                      obscureText: true,
                    ),
                    const SizedBox(height: 20),
                    const DatePicker(
                      label: "Expiration Date",
                      placeholder: "25 Dec 2025",
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        _formKey.currentState!.validate();
                      },
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(double.infinity, 54),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(16),
                          ),
                          side: BorderSide(color: Colors.black),
                        ),
                        backgroundColor: const Color(0xff1814F3),
                        foregroundColor: Colors.white,
                        elevation: 0,
                        textStyle: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [Text("Add Card")],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
