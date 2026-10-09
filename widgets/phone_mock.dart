import 'package:flutter/material.dart';
// import 'package:fitness/portfolio/theme/app_theme.dart';

import '../theme/app_theme.dart';

class PhoneMock extends StatelessWidget {
  const PhoneMock({super.key});

  @override
  Widget build(BuildContext context) {
    const rows = [
      ['Groceries', '- Rs 3,200'],
      ['Salary', '+ Rs 90,000'],
      ['Transport', '- Rs 850'],
      ['Mutual fund', '- Rs 10,000'],
    ];
    return Container(
      width: 230,
      height: 440,
      padding: const EdgeInsets.all(10),
      decoration:
          BoxDecoration(color: ink, borderRadius: BorderRadius.circular(36)),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(28)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text('This month', style: TextStyle(fontSize: 13)),
          const SizedBox(height: 4),
          Text('Rs 75,950', style: heading(28, color: blue)),
          const SizedBox(height: 16),
          Container(
            height: 8,
            decoration: BoxDecoration(
                gradient: const LinearGradient(colors: [blue, sky]),
                borderRadius: BorderRadius.circular(4)),
          ),
          const SizedBox(height: 20),
          for (final r in rows)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 9),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(r[0]),
                    Text(r[1],
                        style: const TextStyle(fontWeight: FontWeight.w600)),
                  ]),
            ),
        ]),
      ),
    );
  }
}
