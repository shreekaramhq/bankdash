import 'package:flutter/material.dart';

import 'package:bankdash/widgets/barrel.dart';

class PreferenceView extends StatelessWidget {
  const PreferenceView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const DashInput(
            label: "Currency",
            placeholder: "Please enter your currency",
          ),
          const SizedBox(height: 20),
          const DashInput(
            label: "Timezone",
            placeholder: "Please enter your timezone",
          ),
          const SizedBox(height: 20),
          const Text(
            "Notification",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: const Text("I send or receive digital currency"),
            leading: Switch(
              value: true,
              onChanged: (value) {},
            ),
          ),
          const SizedBox(height: 12),
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: const Text("I receive merchant order"),
            leading: Switch(
              value: false,
              onChanged: (value) {},
            ),
          ),
          const SizedBox(height: 12),
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: const Text("There are recommendations for my account"),
            leading: Switch(
              value: true,
              onChanged: (value) {},
            ),
          ),
        ],
      ),
    );
  }
}
