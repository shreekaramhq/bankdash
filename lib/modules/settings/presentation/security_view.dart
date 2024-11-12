import 'package:flutter/material.dart';

import 'package:bankdash/widgets/barrel.dart';

class SecurityView extends StatelessWidget {
  const SecurityView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Two-factor authentication",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: const Text("Enable or disable two-factor authentication"),
            leading: Switch(
              value: true,
              onChanged: (value) {},
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            "Change Password",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 12),
          const DashInput(
            label: "Current Password",
            placeholder: "Please enter your current password",
            obscureText: true,
          ),
          const SizedBox(height: 20),
          const DashInput(
            label: "New Password",
            placeholder: "Please enter your new password",
            obscureText: true,
          ),
        ],
      ),
    );
  }
}
