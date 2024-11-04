import 'package:flutter/material.dart';

class CardSettings extends StatelessWidget {
  const CardSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Card Settings',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10,
                offset: Offset(0, 5),
              ),
            ],
          ),
          child: ListView(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            children: [
              ListTile(
                leading: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blue[100],
                  ),
                  child: Icon(Icons.credit_card, color: Colors.blue[800]),
                ),
                title: const Text('Block Card'),
                subtitle: const Text('Instantly block your card'),
              ),
              ListTile(
                leading: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blue[100],
                  ),
                  child: Icon(Icons.apple, color: Colors.blue[800]),
                ),
                title: const Text('Add to Apple Pay'),
                subtitle: const Text('Withdraw without any card'),
              ),
              ListTile(
                leading: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blue[100],
                  ),
                  child: Icon(Icons.apple_outlined, color: Colors.blue[800]),
                ),
                title: const Text('Add to App store'),
                subtitle: const Text('Withdraw without any card'),
              ),
              ListTile(
                leading: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blue[100],
                  ),
                  child: Icon(Icons.lock, color: Colors.blue[800]),
                ),
                title: const Text('Change pic code'),
                subtitle: const Text('Withdraw without any card'),
              ),
            ],
          ),
        )
      ],
    );
  }
}
