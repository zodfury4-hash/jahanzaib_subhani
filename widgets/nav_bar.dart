import 'package:flutter/material.dart';
import '../data/portfolio_data.dart';
import '../theme/app_theme.dart';

class NavBar extends StatelessWidget {
  final Map<String, VoidCallback> items;
  const NavBar({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(children: [
        Text(myName, style: heading(18)),
        const SizedBox(width: 16),
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            reverse: true,
            child: Row(children: [
              for (final e in items.entries)
                TextButton(
                  onPressed: e.value,
                  style: TextButton.styleFrom(foregroundColor: ink),
                  child: Text(e.key),
                ),
            ]),
          ),
        ),
      ]),
    );
  }
}
