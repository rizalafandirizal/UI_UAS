import 'package:flutter/material.dart';


class LanguageCard extends StatelessWidget {
final String language;
const LanguageCard({super.key, required this.language});


@override
Widget build(BuildContext context) {
return Container(
width: 300,
padding: const EdgeInsets.all(16),
decoration: BoxDecoration(
color: Colors.white,
borderRadius: BorderRadius.circular(20),
),
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Row(
children: [
Text(language,
style: const TextStyle(fontWeight: FontWeight.bold)),
],
),
const SizedBox(height: 10),
const Text(
'Access restricted only for Lecturer and Student of Telkom University\n\nLogin using Microsoft Office 365 Account.',
style: TextStyle(fontSize: 12),
),
],
),
);
}
}