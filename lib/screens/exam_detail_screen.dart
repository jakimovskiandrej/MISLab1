import 'package:flutter/material.dart';
import '../models/exam.dart';

class ExamDetailScreen extends StatelessWidget {
  final Exam exam;

  const ExamDetailScreen({super.key, required this.exam});

  String _timeLeft() {
    final now = DateTime.now();
    final diff = exam.dateTime.difference(now);

    final days = diff.inDays;
    final hours = diff.inHours % 24;

    if (diff.isNegative) {
      return "Испитот е поминат";
    }

    return "$days дена, $hours часа";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(exam.subject),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Предмет: ${exam.subject}", style: TextStyle(fontSize: 22)),
            SizedBox(height: 12),
            Text("Датум: ${exam.dateTime.day}.${exam.dateTime.month}.${exam.dateTime.year}"),
            Text("Време: ${exam.dateTime.hour}:${exam.dateTime.minute.toString().padLeft(2, '0')}"),
            SizedBox(height: 12),
            Text("Простории: ${exam.rooms.join(", ")}"),
            SizedBox(height: 20),
            Text(
              "Преостанато време:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              _timeLeft(),
              style: TextStyle(fontSize: 18, color: Colors.blueGrey),
            ),
          ],
        ),
      ),
    );
  }
}
