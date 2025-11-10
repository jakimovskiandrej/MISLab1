import 'package:flutter/material.dart';
import '../models/exam.dart';
import '../widgets/exam_card.dart';
import 'exam_detail_screen.dart';

class ExamListScreen extends StatelessWidget {
  final String indexNumber = "226086";

  final List<Exam> exams = [
    Exam(
      subject: "Алгоритми и податочни структури",
      dateTime: DateTime(2025, 1, 20, 10, 0),
      rooms: ["Лаб 138", "Лаб 2", "Лаб 3", "Лаб 200аб", "Лаб 200в", "Лаб 12", "Лаб 13", "Лаб 117"],
    ),
    Exam(
      subject: "Дискретна Математика",
      dateTime: DateTime(2025, 11, 24, 9, 0),
      rooms: ["АМФ ФИНКИ Г", "223", "225"],
    ),
    Exam(
      subject: "Објектно ориентирано програмирање",
      dateTime: DateTime(2025, 11, 17, 12, 0),
      rooms: ["Лаб 2", "Лаб 117", "Лаб 200в", "Лаб 200аб", "Лаб 3", "Лаб 13", "Лаб 215", "Лаб 12"],
    ),
    Exam(
      subject: "Структурно Програмирање",
      dateTime: DateTime(2025, 11, 15, 12, 0),
      rooms: ["Лаб 200аб", "Лаб 12", "Лаб 13", "Лаб 215", "Лаб 2", "Лаб 3", "Лаб 117"],
    ),
    Exam(
      subject: "Веб Програмирање",
      dateTime: DateTime(2025, 11, 21, 12, 0),
      rooms: ["Лаб 117", "Лаб 2", "Лаб 3", "Лаб 200в", "Лаб 138", "Лаб 12", "Лаб 13", "Лаб 200аб"],
    ),
    Exam(
      subject: "Вовед во наука на податоци",
      dateTime: DateTime(2025, 11, 29, 12, 0),
      rooms: ["Лаб 215", "Лаб 117", "Лаб 200аб", "Лаб 200в", "Лаб 2", "Лаб 3", "Лаб 13", "Лаб 117"],
    ),
    Exam(
      subject: "Напредно Програмирање",
      dateTime: DateTime(2025, 11, 15, 12, 0),
      rooms: ["Лаб 138", "Лаб 215", "Лаб 200аб"],
    ),
    Exam(
      subject: "Визуелно Програмирање",
      dateTime: DateTime(2026, 4, 23, 12, 0),
      rooms: ["Лаб 215", "Лаб 138"],
    ),
    Exam(
      subject: "Мобилни информациски системи",
      dateTime: DateTime(2025, 12, 15, 12, 0),
      rooms: ["Лаб 2", "Лаб 200в", "Лаб 117", "Лаб 3", "Лаб 200аб", "Лаб 12", "Лаб 13", "Лаб 138"],
    ),
    Exam(
      subject: "Дизајн и архитектура на софтвер",
      dateTime: DateTime(2025, 12, 20, 12, 0),
      rooms: ["Лаб 200аб", "Лаб 215", "Лаб 117"],
    ),
  ];

  ExamListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    exams.sort((a, b) => a.dateTime.compareTo(b.dateTime));

    return Scaffold(
      appBar: AppBar(
        title: Text("Распоред за испити - $indexNumber"),
      ),
      body: ListView.builder(
        itemCount: exams.length,
        itemBuilder: (context, index) {
          return ExamCard(
            exam: exams[index],
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ExamDetailScreen(exam: exams[index]),
                ),
              );
            },
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        padding: EdgeInsets.all(12),
        color: Colors.blueGrey[100],
        child: Center(
          child: Text(
            "Вкупно испити: ${exams.length}",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
