import 'package:flutter/material.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary({super.key, required this.summaryData});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children:
              summaryData.map((data) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomIndex(data: data),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              data['question'] as String,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              data['user_answer'] as String,
                              style: TextStyle(color: Colors.purpleAccent),
                            ),
                            Text(
                              data['correct_answer'] as String,
                              style: TextStyle(color: Colors.lightBlueAccent),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              }).toList(),
        ),
      ),
    );
  }
}

class CustomIndex extends StatelessWidget {
  const CustomIndex({super.key, required this.data});

  final Map<String, Object> data;

  @override
  Widget build(BuildContext context) {
    final Color color;
    if (data['user_answer'] == data['correct_answer']) {
      color = Colors.lightBlueAccent;
    } else {
      color = const Color.fromARGB(255, 229, 126, 255);
    }
    return Container(
      alignment: Alignment.center,
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: color,
      ),
      child: Text(((data['question_index'] as int) + 1).toString()),
    );
  }
}
