import 'package:flutter/material.dart';
import '../models/exam.dart';

class ExamCard extends StatelessWidget {
  final Exam exam;
  final void Function()? onTap;

  const ExamCard({super.key, required this.exam, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final isPast = exam.dateTime.isBefore(DateTime.now());

    return Card(
      color: isPast ? Colors.red[100] : Colors.green[100],
      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: ListTile(
        onTap: onTap,
        title: Text(
          exam.subject,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.calendar_today, size: 16),
                SizedBox(width: 6),
                Text("${exam.dateTime.day}.${exam.dateTime.month}.${exam.dateTime.year}"),
              ],
            ),
            Row(
              children: [
                Icon(Icons.access_time, size: 16),
                SizedBox(width: 6),
                Text("${exam.dateTime.hour}:${exam.dateTime.minute.toString().padLeft(2, '0')}"),
              ],
            ),
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.room, size: 22, color: Colors.blueGrey),
          SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Простории:", style: TextStyle(fontWeight: FontWeight.bold)),
                Wrap(
                  spacing: 6,
                  runSpacing: 4,
                  children: exam.rooms
                      .map((r) => Chip(
                    label: Text(r),
                    padding: EdgeInsets.symmetric(horizontal: 6),
                  ))
                      .toList(),
                ),
              ],
            ),
          ),
        ],
      )
      ],
        ),
      ),
    );
  }
}
